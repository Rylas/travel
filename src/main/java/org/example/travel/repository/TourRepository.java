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

    @Query("SELECT t FROM Tour t ORDER BY t.numberBooked DESC")
    List<Tour> getTourOrderByNumberCustomerDesc();

    Tour save(Tour tour);

    // findByNameContaining
    List<Tour> findByNameTourContaining(String keyword);

    void deleteByTourID(Long id);

    Tour findByTourID(Long id);

    Tour findByTourIDAndStatusIsTrue(Long id);

    // getRelatedTours
    @Query("SELECT t FROM Tour t WHERE t.status = true ORDER BY t.numberBooked DESC LIMIT 8")
    List<Tour> getRelatedTours();

    // getAllPublicTours
    @Query("SELECT t FROM Tour t WHERE t.status = true ORDER BY t.numberBooked DESC")
    List<Tour> getAllPublicTours();

    // getTotalVisitors with enterpriseId
    @Query("SELECT SUM(t.numberViewed) FROM Tour t WHERE t.enterprise.enterpriseID = :enterpriseID")
    Long getTotalVisitors(Long enterpriseID);

    // getHotestTour with enterpriseId
    @Query("SELECT t FROM Tour t WHERE t.enterprise.enterpriseID = :enterpriseID ORDER BY t.numberBooked DESC LIMIT 1")
    Tour getHotestTour(Long enterpriseID);

    // getListVisitorJanuaryToDecember
    @Query("SELECT SUM(t.numberViewed) FROM Tour t WHERE MONTH(t.createdAt) = :month AND t.enterprise.enterpriseID = :enterpriseID")
    Long getListVisitorJanuaryToDecember(int month, Long enterpriseID);

    // getToursByEnterpriseID

    List<Tour> findByEnterprise_EnterpriseID(Long enterpriseID);

    // searchTourByEverything
    @Query("SELECT t FROM Tour t WHERE t.nameTour LIKE %:keyword% OR t.description LIKE %:keyword%")
    List<Tour> searchTourByEverything(String keyword);

}
