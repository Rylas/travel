package org.example.travel.service;

import org.example.travel.entity.Booking;
import org.example.travel.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
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

    public List<Booking> getBookingsByUserID(Long userId) {
        return bookingRepository.findByUserID(userId);
    }

    public List<Booking> getBookingsByUserIDStatusTrue(Long userId) {
        return bookingRepository.findByUserIDAndStatusTrue(userId);
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

    // getTotalBookings
    public Long getTotalBookingsOfEnterprise(Long enterpriseID) {
        return bookingRepository.getTotalBookings(enterpriseID) == null ? 0 : bookingRepository.getTotalBookings(enterpriseID);
    }

    // getTotalRevenue
    public double getTotalRevenue(Long enterpriseID) {
        return bookingRepository.getTotalRevenue(enterpriseID) == null ? 0 : bookingRepository.getTotalRevenue(enterpriseID);
    }

    // getTotalRevenueThisYear
    public double getTotalRevenueThisYear(Long enterpriseID) {
        return bookingRepository.getTotalRevenueThisYear(enterpriseID) == null ? 0 : bookingRepository.getTotalRevenueThisMonth(enterpriseID);
    }

    // getTotalRevenueThisMonth
    public double getTotalRevenueThisMonth(Long enterpriseID) {
        return bookingRepository.getTotalRevenueThisMonth(enterpriseID) == null ? 0 : bookingRepository.getTotalRevenueThisMonth(enterpriseID);
    }

    // getTotalRevenueToday
    public double getTotalRevenueToday(Long enterpriseID) {
        return bookingRepository.getTotalRevenueToday(enterpriseID) == null ? 0 : bookingRepository.getTotalRevenueToday(enterpriseID);
    }

    // getListRevenueJanuaryToDecember
    public List<Long> getListRevenueJanuaryToDecember(Long enterpriseID) {
        List<Long> listRevenueJanuaryToDecember = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            listRevenueJanuaryToDecember.add(bookingRepository.getListRevenueJanuaryToDecember(i, enterpriseID) == null ? 0L : bookingRepository.getListRevenueJanuaryToDecember(i, enterpriseID));
        }
        return listRevenueJanuaryToDecember;
    }

    //getBookingCountJanuaryToDecember
    public List<Long> getBookingCountJanuaryToDecember(Long enterpriseID) {
        List<Long> bookingCountJanuaryToDecember = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            bookingCountJanuaryToDecember.add(bookingRepository.getBookingCountJanuaryToDecember(i, enterpriseID) == null ? 0L : bookingRepository.getBookingCountJanuaryToDecember(i, enterpriseID));
        }
        return bookingCountJanuaryToDecember;
    }

    // getRecentBookings
    public List<Booking> getRecentBookings(Long enterpriseID) {
        return bookingRepository.getRecentBookings(enterpriseID);
    }

    // getBookingsByEnterprise
    public List<Booking> getBookingsByEnterprise(Long enterpriseID) {
        return bookingRepository.findByEnterpriseID(enterpriseID);
    }

    // getBookingsByUserIDAndStatusApproved
    public List<Booking> getBookingsByUserIDAndStatusApproved(Long userID) {
        return bookingRepository.findByUserIDAndStatus(userID, "Approved");
    }
}
