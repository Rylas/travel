package org.example.travel.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocationDTO {
    private Long locationID;
    private String nameLocation;
    private String description;
    private String banner;
    private String firstImage;
    private String secondImage;
    private String thirdImage;
    private boolean status = false;
    private boolean isHot = false;
    private int numberViewed = 0;
    private String createdAt;
    private String updatedAt;
}
