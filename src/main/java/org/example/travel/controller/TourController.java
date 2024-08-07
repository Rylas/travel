package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.*;
import org.example.travel.service.*;
import org.example.travel.utils.CheckPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
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
import java.time.LocalDate;
import java.util.*;
import java.sql.Date;

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

    @Autowired
    private DiscountService discountService;


    @GetMapping("/details/tour/{id}")
    public String details(@PathVariable("id") long id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            boolean checkTour = bookingService.findBookingByTourIDAndUserID(id, user.getUserID());
            model.addAttribute("checkTour", checkTour);
        }
        tourService.incView(id);
        Tour tour = tourService.getTourByTourIDAndStatusIsTrue(id);
        Set<Review> listReview = tour.getReviews();
        int totalRating = 0;
        for (Review review : listReview) {
            totalRating += review.getStar();
        }
        if (totalRating > 0) {
            // Get 2 decimal places
            int avgRating = (int) totalRating / listReview.size();
            model.addAttribute("avgRating", avgRating);
        } else {
            model.addAttribute("avgRating", 0);
        }
        List<Tour> relatedTours = tourService.getRelatedTours();
        model.addAttribute("tour", tour);
        model.addAttribute("reviews", listReview);
        Set<Schedule> schedules = tour.getSchedules();
        model.addAttribute("schedules", schedules);
        model.addAttribute("relatedTours", relatedTours);
//        return "tour/detail-tour";
        return "tour/detail-tour";
    }

    @GetMapping("/admin/tour/add")
    public String addTour(Model model) {
        model.addAttribute("enterprises", enterpriseService.getAllEnterprises());
        model.addAttribute("locations", locationService.getAllLocations());
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "tour/add-tour";
    }

    @GetMapping("/enterprise/tour/add")
    public String addTourEnterprise(Model model, HttpSession session, RedirectAttributes ra) {
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        model.addAttribute("locations", locationService.getAllLocations());
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "enterprise/add-tour";
    }

    @GetMapping("/admin/tour")
    public String adminTour(Model model, HttpSession session, RedirectAttributes ra){
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        List<Tour> tours = tourService.getAllTours();
        model.addAttribute("tours", tours);
        return "tour/tour-list-admin";
    }

    @PostMapping("/admin/tour/add")
    public String addTour(@RequestParam("nameTour") String name,
                          @RequestParam("description") String description,
                          @RequestParam("priceAdult") String priceAdult,
                            @RequestParam("priceChild6_10") String priceChild6_10,
                            @RequestParam("priceChild2_5") String priceChild2_5,
                            @RequestParam("priceChild2") String priceChild2,
                          @RequestParam("startDate") String start,
                          @RequestParam("endDate") String end,
                          @RequestParam("image-file1") MultipartFile firstImage,
                            @RequestParam("image-file2") MultipartFile secondImage,
                            @RequestParam("image-file3") MultipartFile thirdImage,
                          @RequestParam("linkVideo") String linkVideo,
                          @RequestParam("duration") int duration,
                          @RequestParam("banner-file") MultipartFile banner,
                          @RequestParam("locations") List<Long> locationIDs,
                          @RequestParam("transport") String transport,
                            @RequestParam("maxPeople") int maxPeople,
                            @RequestParam("minPeople") int minPeople,
                          @RequestParam("status") boolean status,
                          @RequestParam("isHot") boolean isHot,
                          @RequestParam("enterpriseID") Long enterpriseID,
                          @RequestParam("discountID") Long discountID,
                          Model model, HttpSession session, RedirectAttributes ra) throws ParseException {
        if(!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }

        Tour tour = new Tour();
        tour.setNameTour(name);
        tour.setDescription(description);
        tour.setPriceAdult(Integer.parseInt(priceAdult));
        tour.setPriceChild6_10(Integer.parseInt(priceChild6_10));
        tour.setPriceChild2_5(Integer.parseInt(priceChild2_5));
        tour.setPriceChild2(Integer.parseInt(priceChild2));
        tour.setLinkVideo(linkVideo);
        tour.setTransport(transport);
        tour.setDuration(duration);
        tour.setHot(isHot);
        tour.setMaxPeople(maxPeople);
        tour.setMinPeople(minPeople);
        tour.setEnterprise(enterpriseService.getEnterpriseById(enterpriseID));
        tour.setStatus(status);

        if (!firstImage.isEmpty()) {
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(firstImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(firstImage, imageName, "images/tour/");
            tour.setFirstImage(imagePath);
        }
        if (!secondImage.isEmpty()) {
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(secondImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(secondImage, imageName, "images/tour/");
            tour.setSecondImage(imagePath);
        }
        if (!thirdImage.isEmpty()) {
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(thirdImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(thirdImage, imageName, "images/tour/");
            tour.setThirdImage(imagePath);
        }

        if (!banner.isEmpty()) {
            String bannerName = "banner-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/tour/");
            tour.setBanner(bannerPath);
        }

        Set<Location> locations = new HashSet<>();
        for (Long locationId : locationIDs) {
            Location location = locationService.getLocationById(locationId);
            if (location != null) {
                locations.add(location);
            }
        }
        tour.setDiscount(discountService.getDiscountById(discountID));
        tour.setLocations(locations);

        Date startDate = Date.valueOf(start);
        Date endDate = Date.valueOf(end);
        tour.setDepartureDate(startDate);
        tour.setExpectedDate(endDate);

        tour.setStatus(true);
        tourService.saveTour(tour);

        model.addAttribute("msg", "Add tour successfully");
        return "redirect:/admin/tour/schedule/add?tourID=" + tour.getTourID();
    }






    @GetMapping("/admin/editTour/{id}")
    public String editTour(@PathVariable("id") int id, Model model, HttpSession session, RedirectAttributes ra) {
        if(!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        // Get format date YYYY-MM-DD
        model.addAttribute("enterprises", enterpriseService.getAllEnterprises());
        model.addAttribute("tour", tourService.getTourByTourID((long) id));
        model.addAttribute("locations", locationService.getAllLocations());
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "tour/edit-tour";
    }

    @GetMapping("/enterprise/tour")
    public String listTour(Model model, HttpSession session, RedirectAttributes ra) {
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        User user = (User) session.getAttribute("user");

        List<Tour> tours = tourService.getToursByEnterpriseID(user.getEnterprise().getEnterpriseID());
        model.addAttribute("tours", tours);
        return "enterprise/tour";
    }

    @PostMapping("/admin/editTour")
    public String editTour(Tour tour, @RequestParam("image-file1") MultipartFile firstImage,
                            @RequestParam("image-file2") MultipartFile secondImage,
                            @RequestParam("image-file3") MultipartFile thirdImage,
                           @RequestParam("banner-file") MultipartFile banner, @RequestParam("locations") List<Long> locationIds, Model model, HttpSession session, RedirectAttributes ra
    ) throws ParseException {
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        if (!firstImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(firstImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(firstImage, imageName, "images/tour/");
            // Set the image path to the enterprise object
            tour.setFirstImage(imagePath);
        }
        if (!secondImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(secondImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(secondImage, imageName, "images/tour/");
            // Set the image path to the enterprise object
            tour.setSecondImage(imagePath);
        }
        if (!thirdImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-tour-" + fileStorageService.generateRandomName(Objects.requireNonNull(thirdImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(thirdImage, imageName, "images/tour/");
            // Set the image path to the enterprise object
            tour.setThirdImage(imagePath);
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
        tourService.saveTour(tour);
        model.addAttribute("msg", "Edit tour successfully");
        return "redirect:/admin/tour";
    }

    // Get parameter from URL ?id=1
    @GetMapping("/admin/deleteTour")
    public String deleteTour(@RequestParam("id") Long id, Model model, HttpSession session, RedirectAttributes ra) {
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        tourService.deleteTour(id);
        model.addAttribute("msg", "Delete tour successfully");
        return "redirect:/admin/tour";
    }

    @GetMapping("/search")
    public String searchTours(@RequestParam("keyword") String keyword, @RequestParam("date") String date, @RequestParam("groupTour") String groupTour, Model model) {
        List<Tour> tours = new ArrayList<>();
        if(groupTour.equals("both")) {
            tours = tourService.searchTourByKeywordDateGroup(keyword, Date.valueOf(date), true);
            tours.addAll(tourService.searchTourByKeywordDateGroup(keyword, Date.valueOf(date), false));
        } else {
            tours = tourService.searchTourByKeywordDateGroup(keyword, Date.valueOf(date), Boolean.parseBoolean(groupTour));
        }
        List<Location> locations = locationService.searchLocations(keyword);
        model.addAttribute("tours", tours);
        model.addAttribute("keyword", keyword);
        model.addAttribute("locations", locations);
        return "user/search";
    }

    @GetMapping("/destination")
    public String destination(Model model) {
        List<Tour> tours = tourService.getAllPublicTours();
        model.addAttribute("tours", tours);
        return "element/destination";
    }


    @Scheduled(cron = "0 0 0 * * ?")
    public void checkAndUpdateDepartureDates() {
        List<Tour> tours = tourService.getAllTours();
        LocalDate now = LocalDate.now();

        for (Tour tour : tours) {
            if (tour.getDepartureDate() != null && now.minusDays(tour.getDuration()).isAfter(tour.getDepartureDate().toLocalDate())) {
                tour.setDepartureDate(Date.valueOf(now.plusDays(1)));
                tour.setExpectedDate(Date.valueOf(now.plusDays(tour.getDuration())));
                tourService.save(tour);
            }
        }
    }
}
