package org.example.travel.service;

import org.example.travel.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.example.travel.entity.Location;
import java.util.List;

@Service
public class LocationService {
    @Autowired
    private LocationRepository locationRepository;
    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    // Get location by id
    public Location getLocationById(Long id) {
        return locationRepository.findById(id).orElse(null);
    }

    public List<Location> getLocationByHot(boolean isHot) {
        return locationRepository.findByIsHot(isHot);
    }

    public List<Location> getLocationOrderByNumberCustomerDesc() {
        return locationRepository.getLocationOrderByNumberCustomerDesc();
    }

    public Location saveLocation(Location location) {
        return locationRepository.save(location);
    }

    public void deleteLocation(Long id) {
        locationRepository.deleteById(id);
    }

    public List<Location> getLocations(int offset, int limit) {
        return locationRepository.getLocations(offset, limit);
    }

    public void incView(Long id) {
        Location location = locationRepository.findById(id).orElse(null);
        if (location != null) {
            location.setNumberView(location.getNumberView() + 1);
            locationRepository.save(location);
        }
    }
}
