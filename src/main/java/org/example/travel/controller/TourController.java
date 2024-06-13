package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Booking;
import org.example.travel.entity.Location;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class TourController {
    @Autowired
    private TourService tourService;

    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private LocationService locationService;

    @GetMapping("/details/tour/{id}")
    public String details(@PathVariable("id") int id, Model model) {
        model.addAttribute("tour", tourService.getTourById((long) id));
        model.addAttribute("reviews", tourService.getTourById((long) id).getReviews());
        return "tour/detail-tour";
    }

    @GetMapping("/admin/tour/add")
    public String addTour(Model model) {
        model.addAttribute("enterprises", enterpriseService.getAllEnterprises());
        model.addAttribute("locations", locationService.getAllLocations());
        return "tour/add-tour";
    }

    @GetMapping("/admin/tour")
    public String adminTour(Model model, HttpSession session, RedirectAttributes ra){
        User user = (User) session.getAttribute("user");
        if (user == null){
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        String role = user.getRole();
        if (!Objects.equals(role, "admin")){

            ra.addFlashAttribute("errorMsg", "You don't have permission to access this feature!");
            return "redirect:/";
        }
        List<Tour> tours = tourService.getAllTours();
        model.addAttribute("tours", tours);
        return "tour/tour-list-admin";
    }

    @PostMapping("/admin/tour/add")
    public String addTour(@RequestParam("name") String name,
                          @RequestParam("description") String description,
                          @RequestParam("price") String price,
                          @RequestParam("startDate") String start,
                          @RequestParam("endDate") String end,
                          @RequestParam("image-file") MultipartFile image,
                          @RequestParam("banner-file") MultipartFile banner,
                          @RequestParam("locations") List<Long> locationIds,
                          Model model, HttpSession session, RedirectAttributes ra) throws ParseException {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }

        Tour tour = new Tour();
        tour.setName(name);
        tour.setDescription(description);
        tour.setPrice(price);

        if (!image.isEmpty()) {
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(image, imageName, "images/tour/");
            tour.setImage(imagePath);
        }

        if (!banner.isEmpty()) {
            String bannerName = "banner-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/tour/");
            tour.setBanner(bannerPath);
        }

        Set<Location> locations = new HashSet<>();
        for (Long locationId : locationIds) {
            Location location = locationService.getLocationById(locationId);
            if (location != null) {
                locations.add(location);
            }
        }
        tour.setLocations(locations);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = dateFormat.parse(start);
        Date endDate = dateFormat.parse(end);
        tour.setStartDate(startDate);
        tour.setEndDate(endDate);

        tour.setStatus(true);
        tourService.saveTour(tour);

        model.addAttribute("msg", "Add tour successfully");
        return "redirect:/admin/tour";
    }






    @GetMapping("/admin/editTour/{id}")
    public String editTour(@PathVariable("id") int id, Model model) {
        model.addAttribute("enterprises", enterpriseService.getAllEnterprises());
        model.addAttribute("tour", tourService.getTourById((long) id));
        model.addAttribute("locations", locationService.getAllLocations());
        return "tour/edit-tour";
    }

    @PostMapping("/admin/editTour")
    public String editTour(Tour tour, @RequestParam("image-file") MultipartFile image,
                           @RequestParam("banner-file") MultipartFile banner, @RequestParam("locations") List<Long> locationIds, Model model, HttpSession session, RedirectAttributes ra
                           ,@RequestParam("start") String start, @RequestParam("end") String end
    ) throws ParseException {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        if (!image.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(image, imageName, "images/tour/");
            // Set the image path to the enterprise object
            tour.setImage(imagePath);
        }
        if (!banner.isEmpty()) {
            String bannerName = "banner-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/tour/");
            tour.setBanner(bannerPath);
        }
        Set<Location> locations = new HashSet<>();
        for (Long locationId : locationIds) {
            Location location = locationService.getLocationById(locationId);
            if (location != null) {
                locations.add(location);
            }
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        tour.setLocations(locations);
        Date startDate = dateFormat.parse(start);
        Date endDate = dateFormat.parse(end);
        tour.setStartDate(startDate);
        tour.setEndDate(endDate);
        tourService.saveTour(tour);
        model.addAttribute("msg", "Edit tour successfully");
        return "redirect:/admin/tour";
    }

    // Get parameter from URL ?id=1
    @GetMapping("/admin/deleteTour")
    public String deleteTour(@RequestParam("id") Long id, Model model, HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        tourService.deleteTour(id);
        model.addAttribute("msg", "Delete tour successfully");
        return "redirect:/admin/tour";
    }

    @GetMapping("/search")
    public String searchTours(@RequestParam("keyword") String keyword, Model model) {
        List<Tour> tours = tourService.searchTours(keyword);
        model.addAttribute("tours", tours);
        model.addAttribute("keyword", keyword);
        return "user/search";
    }
}
