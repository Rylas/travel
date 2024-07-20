package org.example.travel.controller;

import org.example.travel.entity.Location;
import org.example.travel.entity.Tour;
import org.example.travel.service.LocationService;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoadMoreApiController {
    @Autowired
    private LocationService locationService;
    @Autowired
    private TourService tourService;
    @GetMapping("/location/more")
    public Page<Location> getLocations(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "6") int size) {
        return locationService.loadLocations(page, size);
    }

    @GetMapping("/tour/more")
    public Page<Tour> getTours(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "6") int size) {
        return tourService.loadTours(page, size);
    }
}
