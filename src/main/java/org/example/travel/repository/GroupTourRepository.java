package org.example.travel.repository;

import org.example.travel.entity.GroupTour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupTourRepository extends JpaRepository<GroupTour, Long> {
    // findByTourTourIDAndStatusTrue
    GroupTour findByTourTourIDAndStatusTrue(Long tourID);
}
