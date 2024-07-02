package org.example.travel.service;

import org.example.travel.entity.Tour;
import org.example.travel.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TourService {
    @Autowired
    private TourRepository tourRepository;
    public List<Tour> getAllTours() {
        return tourRepository.findAll();
    }

    public Tour getTourByTourID(Long id) {
        return tourRepository.findByTourID(id);
    }

    public Tour getTourByTourIDAndStatusIsTrue(Long id) {
        return tourRepository.findByTourIDAndStatusIsTrue(id);
    }

    public List<Tour> getToursByHot(boolean isHot) {
        return tourRepository.findByIsHot(isHot);
    }

    public List<Tour> getTourOrderByNumberCustomerDesc() {
        return tourRepository.getTourOrderByNumberCustomerDesc();
    }

    public void saveTour(Tour tour) {
        tourRepository.save(tour);
    }

    public void deleteTour(Long tourID) {
        Optional<Tour> tour = tourRepository.findById(tourID);
        if (tour.isPresent()) {
            tourRepository.delete(tour.get());
        } else {
            throw new RuntimeException("Tour not found with ID: " + tourID);
        }
    }

    public List<Tour> searchTours(String keyword) {
        return tourRepository.findByNameTourContaining(keyword);
    }

    public void incView(Long id) {
        Tour tour = tourRepository.findByTourID(id);
        if (tour != null) {
            tour.setNumberViewed(tour.getNumberViewed() + 1);
            tourRepository.save(tour);
        }
    }

    public void incCustomer(Long id) {
        Tour tour = tourRepository.findByTourID(id);
        if (tour != null) {
            tour.setNumberBooked(tour.getNumberBooked() + 1);
            tourRepository.save(tour);
        }
    }
}
