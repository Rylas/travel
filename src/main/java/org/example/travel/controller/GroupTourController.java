package org.example.travel.controller;

import org.example.travel.entity.Enterprise;
import org.example.travel.entity.GroupTour;
import org.example.travel.entity.User;
import org.example.travel.service.GroupTourService;
import org.example.travel.utils.CheckPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GroupTourController {
    @Autowired
    private GroupTourService groupTourService;

    @GetMapping("/enterprise/grouptour")
    public String getGroupTour(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        // Get all group tours of tour of enterprise
        List<GroupTour> groupTours = enterprise.getTours().stream().map(tour -> groupTourService.getGroupTourByTourIDAndStatusTrue(tour.getTourID())).toList();
        model.addAttribute("groupTours", groupTours);

        return "enterprise/grouptour";
    }
}
