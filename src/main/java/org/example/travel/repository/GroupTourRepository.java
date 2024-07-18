package org.example.travel.repository;

import org.example.travel.entity.GroupTour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GroupTourRepository extends JpaRepository<GroupTour, Long> {
    // findByTourTourIDAndStatusWaitting
    @Query("SELECT g FROM GroupTour g WHERE g.tour.tourID = :tourID AND g.status = :status")
    List<GroupTour> findByTourTourIDAndStatus(Long tourID, String status);

    // findByStatus
    @Query("SELECT g FROM GroupTour g WHERE g.status = :status")
    List<GroupTour> findByStatus(String status);

    // findByTourTourID
    @Query("SELECT g FROM GroupTour g WHERE g.tour.tourID = :tourID")
    List<GroupTour> findByTourTourID(Long tourID);
}
