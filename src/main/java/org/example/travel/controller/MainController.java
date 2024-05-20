package org.example.travel.controller;

import org.example.travel.entity.Location;
import org.example.travel.entity.Tour;
import org.example.travel.service.LocationService;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class MainController  {
    @Autowired
    private TourService tourService;
    @Autowired
    private LocationService locationService;

    @GetMapping("/")
    public String homePage(Model model){

        // Get all hot tours
        List<Tour> hotTours = tourService.getToursByHot(true);

        // Get all locations
        List<Location> locations = locationService.getLocationOrderByNumberCustomerDesc();

        // Get all tours
        List<Tour> tours = tourService.getTourOrderByNumberCustomerDesc();

        model.addAttribute("hotTours", hotTours);
        model.addAttribute("locations", locations);
        model.addAttribute("tours", tours);

        return "index";
    }



}
