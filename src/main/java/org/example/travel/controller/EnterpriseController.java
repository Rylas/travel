package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Booking;
import org.example.travel.entity.Enterprise;
import org.example.travel.entity.User;
import org.example.travel.service.*;
import org.example.travel.utils.CheckPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@Controller
public class EnterpriseController {
    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileStorageService fileStorageService;
    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private BookingService bookingService;

    @GetMapping("/enterprise")
    public String enterprise(HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        if (session.getAttribute("enterprise") != null) {
            return "redirect:/enterprise/dashboard";
        }
        return "enterprise/registerEnterprise";
    }

    @PostMapping("/enterprise")
    public String registerEnterprise(Enterprise enterprise, @RequestParam("logo-file") MultipartFile image,
                                     @RequestParam("banner-file") MultipartFile banner, HttpSession session, RedirectAttributes ra) {
        // Regex name
        if (!enterprise.getNameEnterprise().matches("^[a-zA-Z0-9 ]{1,50}$")) {
            ra.addFlashAttribute("errorMsg", "Name is invalid!");
            return "redirect:/enterprise";
        }
        // Regex address
        if (!enterprise.getAddress().matches("^[a-zA-Z0-9 ]{1,100}$")) {
            ra.addFlashAttribute("errorMsg", "Address is invalid!");
            return "redirect:/enterprise";
        }
        // Regex description
        if (!enterprise.getDescription().matches("^[a-zA-Z0-9 ]{1,500}$")) {
            ra.addFlashAttribute("errorMsg", "Description is invalid!");
            return "redirect:/enterprise";
        }
        // Regex logo
        if (!Objects.requireNonNull(image.getOriginalFilename()).matches(".*\\.(jpg|jpeg|png)$")) {
            ra.addFlashAttribute("errorMsg", "Logo is invalid!");
            return "redirect:/enterprise";
        }
        // Regex banner
        if (!Objects.requireNonNull(banner.getOriginalFilename()).matches(".*\\.(jpg|jpeg|png)$")) {
            ra.addFlashAttribute("errorMsg", "Banner is invalid!");
            return "redirect:/enterprise";
        }

        // Regex phone
        if (!enterprise.getPhone().matches("^0[0-9]{9,10}$")) {
            ra.addFlashAttribute("errorMsg", "Phone number is invalid!");
            return "redirect:/enterprise";
        }
        // Regex email
        if (!enterprise.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            ra.addFlashAttribute("errorMsg", "Email is invalid!");
            return "redirect:/enterprise";
        }
        // Regex website
        if (!enterprise.getWebsite().matches("^(http://|https://)?(www\\.)?[a-zA-Z0-9]+\\.[a-zA-Z]{2,6}$")) {
            ra.addFlashAttribute("errorMsg", "Website is invalid!");
            return "redirect:/enterprise";
        }
        if (!image.isEmpty()) {
            // Generate a random name for the image
            String imageName = fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(image, imageName, "images/enterprise/");
            // Set the image path to the enterprise object
            enterprise.setLogo(imagePath);
        }

        if (!banner.isEmpty()) {
            // Generate a random name for the banner
            String bannerName = fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/enterprise/");
            // Set the banner path to the enterprise object
            enterprise.setBanner(bannerPath);
        }
        // Get current time
        Enterprise newEnterprise1 =  enterpriseService.saveEnterprise(enterprise);
        User user = (User) session.getAttribute("user");
        userService.updateEnterprise(user.getUserID(), newEnterprise1.getEnterpriseID());
        ra.addFlashAttribute("successMsg", "Register enterprise successfully!");
        return "redirect:/";
    }

    @PostMapping("/admin/enterprise/add")
    public String addEnterprise(Enterprise enterprise, @RequestParam("image-file") MultipartFile image,
                                @RequestParam("banner-file") MultipartFile banner, HttpSession session) {
        if (!image.isEmpty()) {
            // Generate a random name for the image
            String imageName = fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(image, imageName, "images/enterprise/");
            // Set the image path to the enterprise object
            enterprise.setLogo(imagePath);
        }

        if (!banner.isEmpty()) {
// Generate a random name for the banner
            String bannerName = fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/enterprise/");
            // Set the banner path to the enterprise object
            enterprise.setBanner(bannerPath);
        }
        // Get current time
        Enterprise enterprise1 = enterpriseService.saveEnterprise(enterprise);
        User user = (User) session.getAttribute("user");
//        userService.updateEnterprise(user.getUserId(), enterprise1.getEnterpriseId());
        return "redirect:/admin/enterprise";
    }

    @GetMapping("/admin/enterprise")
    public String listEnterprise(HttpSession session, RedirectAttributes ra, Model model) {
        CheckPermission.checkAdmin(session, ra);
        model.addAttribute("enterprises", enterpriseService.getAllEnterprises());
        return "enterprise/admin-enterprise";
    }

    @GetMapping("/admin/enterprise/add")
    public String addEnterprise(Model model) {
        return "enterprise/add";
    }

    @GetMapping("/admin/enterprise/active/{id}")
    public String approveEnterprise(@PathVariable("id") Long enterpriseId) {
        enterpriseService.activeEnterprise(enterpriseId);
        return "redirect:/admin/enterprise";
    }

    @GetMapping("/admin/enterprise/edit/{id}")
    public String editEnterprise(@PathVariable("id") Long enterpriseId, Model model) {
        model.addAttribute("enterprise", enterpriseService.getEnterpriseById(enterpriseId));
        return "enterprise/edit-enterprise";
    }

    @PostMapping("/admin/enterprise/edit")
    public String editEnterprise(Enterprise enterprise, @RequestParam("image-file") MultipartFile image,
                                 @RequestParam("banner-file") MultipartFile banner, Model model) {
        if (!image.isEmpty()) {
            // Generate a random name for the image
            String imageName = fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(image, imageName, "images/enterprise/");
            // Set the image path to the enterprise object
            enterprise.setLogo(imagePath);
        }

        if (!banner.isEmpty()) {
            // Generate a random name for the banner
            String bannerName = fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/enterprise/");
            // Set the banner path to the enterprise object
            enterprise.setBanner(bannerPath);
        }
        enterpriseService.saveEnterprise(enterprise);
        return "redirect:/admin/enterprise";
    }

    @GetMapping("/admin/enterprise/delete")
    public String deleteEnterprise(@RequestParam("id") Long enterpriseID) {
        Enterprise enterprise = enterpriseService.getEnterpriseById(enterpriseID);
        try {
            File image = new File(enterprise.getLogo());
            File banner = new File(enterprise.getBanner());
            image.delete();
            banner.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        enterpriseService.deleteEnterprise(enterpriseID);
        return "redirect:/admin/enterprise";
    }

    @GetMapping("/enterprise/dashboard")
    public String enterpriseDashboard(HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        if (session.getAttribute("enterprise") == null) {
            ra.addFlashAttribute("errorMsg", "You need to register an enterprise to use this feature!");
            return "redirect:/enterprise";
        }
        Enterprise enterprise = (Enterprise) session.getAttribute("enterprise");
        Map<String, Object> statistics = statisticsService.getStatistics(enterprise.getEnterpriseID());
        session.setAttribute("statistics", statistics);
        return "enterprise/dashboard";
    }

    @GetMapping("/enterprise/grouptour")
    public String enterpriseGroupTour(HttpSession session, RedirectAttributes ra, Model model){
        if (!CheckPermission.checkEnterprise(session, ra)) {
            return "redirect:/login";
        }
        User user = (User) session.getAttribute("user");
        List<Booking> bookings = bookingService.getBookingsByEnterprise(user.getEnterprise().getEnterpriseID());
        model.addAttribute("bookings", bookings);
        return "enterprise/groupTourList";
    }
}
