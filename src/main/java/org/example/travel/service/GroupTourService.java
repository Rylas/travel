package org.example.travel.service;

import org.example.travel.entity.GroupTour;
import org.example.travel.repository.GroupTourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupTourService {
    @Autowired
    private GroupTourRepository groupTourRepository;

    // getGroupTourByTourIDAndStatusTrue
    public GroupTour getGroupTourByTourIDAndStatusTrue(Long tourID) {
        return groupTourRepository.findByTourTourIDAndStatusTrue(tourID);
    }

    // updateGroupTour
    public void updateGroupTour(GroupTour groupTour) {
        groupTourRepository.save(groupTour);
    }
}
