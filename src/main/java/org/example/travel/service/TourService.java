package org.example.travel.service;

import org.example.travel.entity.Tour;
import org.example.travel.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TourService {
    @Autowired
    private TourRepository tourRepository;
    public List<Tour> getAllTours() {
        return tourRepository.findAll();
    }

    public List<Tour> getAllPublicTours() {
        return tourRepository.getAllPublicTours();
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

    // getRelatedTours
    public List<Tour> getRelatedTours() {
        return tourRepository.getRelatedTours();
    }

    // getTotalVisitors
    public Long getTotalVisitors(Long enterpriseID) {
        return tourRepository.getTotalVisitors(enterpriseID) == null ? 0 : tourRepository.getTotalVisitors(enterpriseID);
    }

    // getTotalTours
    public Long getTotalToursEnterprise(Long enterpriseID) {
        return tourRepository.findByEnterprise_EnterpriseID(enterpriseID).stream().count();
    }

    // getHotestTour with enterpriseId
    public Tour getHotestTour(Long enterpriseID) {
        return tourRepository.getHotestTour(enterpriseID);
    }

    // getListVisitorJanuaryToDecember
    public List<Long> getListVisitorJanuaryToDecember(Long enterpriseID) {
        List<Long> listVisitorJanuaryToDecember = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            listVisitorJanuaryToDecember.add(tourRepository.getListVisitorJanuaryToDecember(i, enterpriseID) == null ? 0L : tourRepository.getListVisitorJanuaryToDecember(i, enterpriseID));
        }
        return listVisitorJanuaryToDecember;
    }

    // getToursByEnterpriseID
    public List<Tour> getToursByEnterpriseID(Long enterpriseID) {
        return tourRepository.findByEnterprise_EnterpriseID(enterpriseID);
    }

    // searchTourByEverything
    public List<Tour> searchTourByEverything(String keyword) {
        return tourRepository.searchTourByEverything(keyword);
    }

    // save
    public void save(Tour tour) {
        tourRepository.save(tour);
    }
}
