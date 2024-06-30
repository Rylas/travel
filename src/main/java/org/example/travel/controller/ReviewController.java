package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Review;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.BookingService;
import org.example.travel.service.ReviewService;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private TourService tourService;

    @Autowired
    private BookingService bookingService;

    @PostMapping("/review/add")
    public String addReview(Review review, @RequestParam("tourID") Long tourID, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        boolean checkTour = bookingService.findBookingByTourIDAndUserID(tourID, user.getUserID());
        if (!checkTour) {
            return "redirect:/";
        }
        review.setUser(user);
        Tour tour = tourService.getTourByTourID(tourID);
        review.setTour(tour);
        reviewService.addReview(review);
        return "redirect:/detail/tour/" + review.getTour().getTourID();
    }
}
