package org.example.travel.controller;

import org.example.travel.entity.Location;
import org.example.travel.service.FileStorageService;
import org.example.travel.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Objects;

@Controller
public class LocationController {
    @Autowired
    private LocationService locationService;
    @Autowired
    private FileStorageService fileStorageService;


    @GetMapping("/location/more")
    public List<Location> getMoreLocations(@RequestParam int offset, @RequestParam int limit) {
        return locationService.getLocations(offset, limit);
    }

    @GetMapping("/details/location/{id}")
    public String details(@PathVariable("id") int id, Model model) {
        locationService.incView((long) id);
        model.addAttribute("location", locationService.getLocationById((long) id));
        return "location/detail-location";
    }

    @GetMapping("/enterprise/location")
    public String listLocationEnterprise(Model model) {
        model.addAttribute("locations", locationService.getAllLocations());
        return "enterprise/add-location";
    }

    @PostMapping("/enterprise/location")
    public String addLocationEnterprise(Location location, @RequestParam("image-file1") MultipartFile firstImage,
                                        @RequestParam("image-file2") MultipartFile secondImage,
                                        @RequestParam("image-file3") MultipartFile thirdImage,
                                        @RequestParam("banner-file") MultipartFile banner, Model model, RedirectAttributes ra) {
        if (!firstImage.isEmpty()) {
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(firstImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(firstImage, imageName, "images/location/");
            location.setFirstImage(imagePath);
        }

        if (!secondImage.isEmpty()) {
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(secondImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(secondImage, imageName, "images/location/");
            location.setSecondImage(imagePath);
        }

        if (!thirdImage.isEmpty()) {
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(thirdImage.getOriginalFilename()));
            String imagePath = fileStorageService.storeFile(thirdImage, imageName, "images/location/");
            location.setThirdImage(imagePath);
        }

        if (!banner.isEmpty()) {
            String bannerName = "banner-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/location/");
            location.setBanner(bannerPath);
        }
        location.setStatus(false);
        location.setHot(false);
        locationService.saveLocation(location);
        ra.addFlashAttribute("msg", "Gửi yêu cầu thành công");
        return "redirect:/enterprise/location";
    }

    @GetMapping("/admin/location")
    public String listLocation(Model model) {
        model.addAttribute("locations", locationService.getAllLocations());
        return "location/list-location";
    }

    @GetMapping("/admin/location/add")
    public String managerLocation(Model model) {
        return "location/manager-location";
    }

    @PostMapping("/admin/location/add")
    public String addLocation(Location location, @RequestParam("image-file1") MultipartFile firstImage,
                                @RequestParam("image-file2") MultipartFile secondImage,
                                @RequestParam("image-file3") MultipartFile thirdImage,
                              @RequestParam("banner-file") MultipartFile banner, Model model) {
        if (!firstImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(firstImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(firstImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setFirstImage(imagePath);
        }

        if (!secondImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(secondImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(secondImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setSecondImage(imagePath);
        }

        if (!thirdImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(thirdImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(thirdImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setThirdImage(imagePath);
        }

        if (!banner.isEmpty()) {
// Generate a random name for the banner
            String bannerName = "banner-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/location/");
            // Set the banner path to the enterprise object
            location.setBanner(bannerPath);
        }
        locationService.saveLocation(location);
        model.addAttribute("msg", "Add location successfully");
        return "redirect:/admin/location";
    }

    @GetMapping("/admin/location/edit/{id}")
    public String editLocation(@PathVariable("id") int id, Model model) {
        model.addAttribute("location", locationService.getLocationById((long) id));
        return "location/edit-location";
    }

    @PostMapping("/admin/location/edit")
    public String editLocation(Location location, @RequestParam("image-file1") MultipartFile firstImage,
                                 @RequestParam("image-file2") MultipartFile secondImage,
                                    @RequestParam("image-file3") MultipartFile thirdImage,
                               @RequestParam("banner-file") MultipartFile banner, Model model) {
        if (!firstImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(firstImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(firstImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setFirstImage(imagePath);
        }

        if (!secondImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(secondImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(secondImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setSecondImage(imagePath);
        }

        if (!thirdImage.isEmpty()) {
            // Generate a random name for the image
            String imageName = "image-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(thirdImage.getOriginalFilename()));
            // Store the image in the file storage
            String imagePath = fileStorageService.storeFile(thirdImage, imageName, "images/location/");
            // Set the image path to the enterprise object
            location.setThirdImage(imagePath);
        }

        if (!banner.isEmpty()) {
// Generate a random name for the banner
            String bannerName = "banner-location-" + fileStorageService.generateRandomName(Objects.requireNonNull(banner.getOriginalFilename()));
            // Store the banner in the file storage
            String bannerPath = fileStorageService.storeFile(banner, bannerName, "images/location/");
            // Set the banner path to the enterprise object
            location.setBanner(bannerPath);
        }
        locationService.saveLocation(location);
        model.addAttribute("msg", "Edit location successfully");
        return "redirect:/admin/location";
    }

    @GetMapping("/admin/location/delete")
    public String deleteLocation(@RequestParam("id") int id, Model model) {
        locationService.deleteLocation((long) id);
        model.addAttribute("msg", "Delete location successfully");
        return "redirect:/admin/location";
    }

}
