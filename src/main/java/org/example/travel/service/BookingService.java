package org.example.travel.service;

import org.example.travel.entity.Booking;
import org.example.travel.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    public Booking addBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    public List<Booking> getBookingsByUserId(Long userId) {
        return bookingRepository.findByUserId(userId);
    }

    public List<Booking> getBookingsByUserIDStatusTrue(Long userId) {
        return bookingRepository.findByUserIdAndStatusTrue(userId);
    }

    public Booking getBookingById(Long bookingId) {
        return bookingRepository.findById(bookingId).orElse(null);
    }

    public void deleteBooking(Long bookingId) {
        bookingRepository.deleteById(bookingId);
    }

    public void approveBooking(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            booking.setStatus("Approved");
            bookingRepository.save(booking);
        }
    }

    public void cancelBooking(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            booking.setStatus("Canceled");
            bookingRepository.save(booking);
        }
    }

    public void setCancelDate(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            booking.setCanceledAt(new Date(System.currentTimeMillis()));
            bookingRepository.save(booking);
        }
    }

    public boolean findBookingByTourIDAndUserID(Long tourID, Long userID) {
        return bookingRepository.existsByTourTourIDAndUserUserID(tourID, userID);
    }

    public void updateBooking(Booking booking) {
        bookingRepository.save(booking);
    }

    public void pendingBooking(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId).
                orElse(null);
        if (booking != null) {
            booking.setStatus("Pending");
            bookingRepository.save(booking);
        }
    }
}
