package org.example.travel.service;

import org.example.travel.entity.GroupTour;
import org.example.travel.repository.GroupTourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupTourService {
    @Autowired
    private GroupTourRepository groupTourRepository;

    // getGroupTourByTourIDAndStatusTrue
    public List<GroupTour> getGroupTourByTourTourIDAndStatus(Long tourID, String status) {
        return groupTourRepository.findByTourTourIDAndStatus(tourID, status);
    }

    public List<GroupTour> getGroupTourByTourTourID(Long tourID) {
        return groupTourRepository.findByTourTourID(tourID);
    }
    // updateGroupTour
    public void updateGroupTour(GroupTour groupTour) {
        groupTourRepository.save(groupTour);
    }

    // deleteGroupTour
    public void deleteGroupTour(GroupTour groupTour) {
        groupTourRepository.delete(groupTour);
    }

    public List<GroupTour> getAllGroupToursByStatus(String status) {
        return groupTourRepository.findByStatus(status);
    }

    public GroupTour findGroupTourById(Long groupTourId) {
        return groupTourRepository.findById(groupTourId).orElse(null);
    }
}
