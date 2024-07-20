package org.example.travel.mapper;

import org.example.travel.dto.LocationDTO;
import org.example.travel.entity.Location;

public class LocationMapper {
    public static LocationDTO toDto(Location location) {
        LocationDTO locationDTO = new LocationDTO();
        locationDTO.setLocationID(location.getLocationID());
        locationDTO.setNameLocation(location.getNameLocation());
        locationDTO.setDescription(location.getDescription());
        locationDTO.setBanner(location.getBanner());
        locationDTO.setFirstImage(location.getFirstImage());
        locationDTO.setSecondImage(location.getSecondImage());
        locationDTO.setThirdImage(location.getThirdImage());
        locationDTO.setStatus(location.isStatus());
        locationDTO.setHot(location.isHot());
        locationDTO.setNumberViewed(location.getNumberViewed());
        locationDTO.setCreatedAt(String.valueOf(location.getCreatedAt()));
        locationDTO.setUpdatedAt(String.valueOf(location.getUpdatedAt()));
        return locationDTO;
    }
}
