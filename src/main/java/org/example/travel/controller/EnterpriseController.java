package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Enterprise;
import org.example.travel.entity.User;
import org.example.travel.service.EnterpriseService;
import org.example.travel.service.FileStorageService;
import org.example.travel.service.UserService;
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
import java.util.Objects;

@Controller
public class EnterpriseController {
    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileStorageService fileStorageService;

    @GetMapping("/enterprise")
    public String enterprise(HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        return "add";
    }

    @PostMapping("/enterprise/add")
    public String addEnterprise(Enterprise enterprise, @RequestParam("image-file") MultipartFile image,
                                @RequestParam("banner-file") MultipartFile banner, HttpSession session) {
        if (!image.isEmpty()) {
            // Generate a random name for the image
            String imageName = fileStorageService.generateRandomName(Objects.requireNonNull(image.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(image, imageName, "images/enterprise/");
            // Set the image path to the enterprise object
            enterprise.setImage(imagePath);
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
        enterprise.setCreatedAt(java.time.LocalDateTime.now());
        Enterprise enterprise1 = enterpriseService.saveEnterprise(enterprise);
        User user = (User) session.getAttribute("user");
//        userService.updateEnterprise(user.getUserId(), enterprise1.getEnterpriseId());
        return "redirect:/admin/enterprise";
    }

    @GetMapping("/admin/enterprise")
    public String listEnterprise(HttpSession session, RedirectAttributes ra, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        if (!user.getRole().equals("admin")) {
            ra.addFlashAttribute("errorMsg", "You don't have permission to access this feature!");
            return "redirect:/";
        }
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
            enterprise.setImage(imagePath);
        }

        if (!banner.isEmpty()) {
// Generate a random name for the banner
            String bannerName = fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/enterprise/");
            // Set the banner path to the enterprise object
            enterprise.setBanner(bannerPath);
        }
        enterprise.setUpdatedAt(java.time.LocalDateTime.now());
        enterpriseService.saveEnterprise(enterprise);
        return "redirect:/admin/enterprise";
        }

        @GetMapping("/admin/enterprise/delete")
        public String deleteEnterprise(@RequestParam("id") Long enterpriseId) {
            Enterprise enterprise = enterpriseService.getEnterpriseById(enterpriseId);
            File image = new File(enterprise.getImage());
            File banner = new File(enterprise.getBanner());
            image.delete();
            banner.delete();
            enterpriseService.deleteEnterprise(enterpriseId);
            return "redirect:/admin/enterprise";
        }
}
