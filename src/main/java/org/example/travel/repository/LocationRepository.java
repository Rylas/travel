package org.example.travel.repository;


import org.example.travel.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LocationRepository extends JpaRepository<Location, Long> {
    List<Location> findAll();

    List<Location> findByIsHot(boolean isHot);

    // get Location Order By Number Customer Desc

    Location save(Location location);
    void deleteById(Long id);

    // get Locations by offset and limit
    @Query("SELECT l FROM Location l")
    List<Location> getLocations(int offset, int limit);

    // get Locations Order By Number Viewer Desc
    @Query("SELECT l FROM Location l ORDER BY l.numberViewed DESC")
    List<Location> getLocationsOrderByNumberViewerDesc();
}
