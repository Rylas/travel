package org.example.travel.service;

import org.example.travel.entity.Tour;
import org.example.travel.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TourService {
    @Autowired
    private TourRepository tourRepository;
    public List<Tour> getAllTours() {
        return tourRepository.findAll();
    }

    public Tour getTourById(Long id) {
        return tourRepository.findById(id).orElse(null);
    }

    public List<Tour> getToursByHot(boolean isHot) {
        return tourRepository.findByIsHot(isHot);
    }

    public List<Tour> getTourOrderByNumberCustomerDesc() {
        return tourRepository.getTourOrderByNumberCustomerDesc();
    }

    public Tour saveTour(Tour tour) {
        return tourRepository.save(tour);
    }

    public void deleteTour(Long id) {
        tourRepository.deleteById(id);
    }

    public List<Tour> searchTours(String keyword) {
        return tourRepository.findByNameContaining(keyword);
    }

}
