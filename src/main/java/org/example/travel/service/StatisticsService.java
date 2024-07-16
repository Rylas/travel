package org.example.travel.service;

import org.example.travel.entity.Booking;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private EnterpriseService enterpriseService;
    @Autowired
    private UserService userService;
    @Autowired
    private TourService tourService;

    public Map<String, Object> getStatistics(long id) {
        Map<String, Object> statistics = new HashMap<>();

        // Lấy tổng số lượng visitor của tất cả các tour
        long totalVisitors = tourService.getTotalVisitors(id);
        // Lấy tổng số lượng booking của tất cả các tour
        long totalBookings = bookingService.getTotalBookingsOfEnterprise(id);
        // Lấy tổng doanh thu của tất cả các tour
        long totalRevenue = (long) bookingService.getTotalRevenue(id);
        // Lấy tổng doanh thu trong năm này
        long totalRevenueThisYear = (long) bookingService.getTotalRevenueThisYear(id);
        // Lấy tổng doanh thu trong tháng này
        long totalRevenueThisMonth = (long) bookingService.getTotalRevenueThisMonth(id);

        // Lấy tổng doanh thu trong hôm nay
        long totalRevenueToday = (long) bookingService.getTotalRevenueToday(id);

        // Lấy tổng số lượng tour
        long totalTours = tourService.getTotalToursEnterprise(id);

        Tour hotestTour = tourService.getHotestTour(id);

        List<Long> listRevenueJanuaryToDecember = bookingService.getListRevenueJanuaryToDecember(id);
        List<Long> bookingCountJanuaryToDecember = bookingService.getBookingCountJanuaryToDecember(id);
        List<Long> listVisitorJanuaryToDecember = tourService.getListVisitorJanuaryToDecember(id);
        List<User> listNewUsers = userService.getNewUsersOfEnterprise(id);
        List<Booking> listBooking = bookingService.getRecentBookings(id);

        statistics.put("totalVisitors", totalVisitors);
        statistics.put("totalBookings", totalBookings);
        statistics.put("totalRevenue", totalRevenue);
        statistics.put("totalRevenueThisYear", totalRevenueThisYear);
        statistics.put("totalRevenueThisMonth", totalRevenueThisMonth);
        statistics.put("totalRevenueToday", totalRevenueToday);
        statistics.put("totalTours", totalTours);
        statistics.put("hotestTour", hotestTour);
        statistics.put("listRevenueJanuaryToDecember", listRevenueJanuaryToDecember);
        statistics.put("bookingCountJanuaryToDecember", bookingCountJanuaryToDecember);
        statistics.put("listVisitorJanuaryToDecember", listVisitorJanuaryToDecember);
        statistics.put("listNewUsers", listNewUsers);
        statistics.put("listBooking", listBooking);

        return statistics;
    }
}
