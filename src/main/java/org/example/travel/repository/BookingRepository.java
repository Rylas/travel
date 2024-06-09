package org.example.travel.repository;

import org.example.travel.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long>{
    @Query("SELECT b FROM Booking b WHERE b.user.userId = :userId")
    List<Booking> findByUserId(Long userId);

    @Query("SELECT b FROM Booking b WHERE b.user.userId = :userId AND b.status = true")
    List<Booking> findByUserIdAndStatusTrue(Long userId);
}
