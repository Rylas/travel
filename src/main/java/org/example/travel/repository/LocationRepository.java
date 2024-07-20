package org.example.travel.repository;


import org.example.travel.dto.LocationDTO;
import org.example.travel.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
@Repository
public interface LocationRepository extends JpaRepository<Location, Long> {
    List<Location> findAll();

    List<Location> findByIsHot(boolean isHot);

    // get Location Order By Number Customer Desc

    Location save(Location location);
    void deleteById(Long id);

    // get Locations, limit, offset


    // get Locations Order By Number Viewer Desc
    @Query("SELECT l FROM Location l ORDER BY l.numberViewed DESC")
    List<Location> getLocationsOrderByNumberViewerDesc();

    // searchLocations
    @Query("SELECT l FROM Location l WHERE l.nameLocation LIKE %:keyword%  or l.description LIKE %:keyword%")
    List<Location> searchLocations(String keyword);

    // getLocationsLimitOffset limit offset
    @Query("SELECT l FROM Location l WHERE l.status = true")
    Page<Location> findActiveLocations(Pageable pageable);

    @Query("SELECT l FROM Location l WHERE l.status = true ORDER BY l.numberViewed DESC")
    Page<Location> findAllActiveLocations(Pageable pageable);

}
