package org.example.travel.repository;

import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TourRepository extends JpaRepository<Tour, Long> {
    List<Tour> findAll();
    List<Tour> findByIsHot(boolean isHot);

    @Query("SELECT t FROM Tour t ORDER BY t.numberCustomer DESC")
    List<Tour> getTourOrderByNumberCustomerDesc();

    Tour save(Tour tour);
}
