package org.example.travel.service;

import org.example.travel.dto.LocationDTO;
import org.example.travel.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.example.travel.entity.Location;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
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
        return locationRepository.getLocationsOrderByNumberViewerDesc();
    }

    public Location saveLocation(Location location) {
        return locationRepository.save(location);
    }

    public void deleteLocation(Long id) {
        locationRepository.deleteById(id);
    }

    // Get locations, limit, offset, return List<LocationDTO>
    public Page<Location> getMoreLocations(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return locationRepository.findActiveLocations(pageable);
    }



    public void incView(Long id) {
        Location location = locationRepository.findById(id).orElse(null);
        if (location != null) {
            location.setNumberViewed(location.getNumberViewed() + 1);
            locationRepository.save(location);
        }
    }

    // searchLocations
    public List<Location> searchLocations(String keyword) {
        return locationRepository.searchLocations(keyword);
    }

    public Page<Location> loadLocations(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize, Sort.Direction.DESC, "numberViewed");
        return locationRepository.findAllActiveLocations(pageable);
    }
}
