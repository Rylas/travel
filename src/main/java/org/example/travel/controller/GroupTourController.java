package org.example.travel.controller;

import org.example.travel.entity.Enterprise;
import org.example.travel.entity.GroupTour;
import org.example.travel.entity.User;
import org.example.travel.service.GroupTourService;
import org.example.travel.utils.CheckPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Controller
public class GroupTourController {
    @Autowired
    private GroupTourService groupTourService;

//    @GetMapping("/enterprise/grouptour")
//    public String getGroupTour(Model model, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        Enterprise enterprise = user.getEnterprise();
//        // Get all group tours of tour of enterprise
//        List<GroupTour> groupTours = groupTourService.getGroupTourByTourTourID(enterprise.getEnterpriseID());
//        model.addAttribute("groupTours", groupTours);
//        return "enterprise/grouptour";
//    }

    @GetMapping("/enterprise/grouptour/active/{groupTourID}")
    public String activeGroupTour(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        Long groupTourID = Long.parseLong(Objects.requireNonNull(model.getAttribute("groupTourID")).toString());
        GroupTour groupTour = groupTourService.findGroupTourById(groupTourID);
        if (groupTour.getEnterprise().getEnterpriseID().equals(enterprise.getEnterpriseID())) {
            groupTour.setStatus("Active");
            groupTourService.updateGroupTour(groupTour);
        }
        return "redirect:/enterprise/grouptour";
    }

    @GetMapping("/enterprise/grouptour/detail/{groupTourID}")
    public String getGroupTourDetail(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        Long groupTourID = Long.parseLong(Objects.requireNonNull(model.getAttribute("groupTourID")).toString());
        GroupTour groupTour = groupTourService.findGroupTourById(groupTourID);
        if (groupTour.getEnterprise().getEnterpriseID().equals(enterprise.getEnterpriseID())) {
            model.addAttribute("groupTour", groupTour);
        }
        return "enterprise/grouptour_detail";
    }

    @GetMapping("/enterprise/grouptour/edit/{groupTourID}")
    public String editGroupTour(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        Long groupTourID = Long.parseLong(Objects.requireNonNull(model.getAttribute("groupTourID")).toString());
        GroupTour groupTour = groupTourService.findGroupTourById(groupTourID);
        if (groupTour.getEnterprise().getEnterpriseID().equals(enterprise.getEnterpriseID())) {
            model.addAttribute("groupTour", groupTour);
        }
        return "enterprise/grouptour_edit";
    }

    @GetMapping("/enterprise/grouptour/delete/{groupTourID}")
    public String deleteGroupTour(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        Long groupTourID = Long.parseLong(Objects.requireNonNull(model.getAttribute("groupTourID")).toString());
        GroupTour groupTour = groupTourService.findGroupTourById(groupTourID);
        if (groupTour.getEnterprise().getEnterpriseID().equals(enterprise.getEnterpriseID())) {
            groupTourService.deleteGroupTour(groupTour);
        }
        return "redirect:/enterprise/grouptour";
    }

    @PostMapping("/enterprise/grouptour/edit/{groupTourID}")
    public String updateGroupTour(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = user.getEnterprise();
        Long groupTourID = Long.parseLong(Objects.requireNonNull(model.getAttribute("groupTourID")).toString());
        GroupTour groupTour = groupTourService.findGroupTourById(groupTourID);
        if (groupTour.getEnterprise().getEnterpriseID().equals(enterprise.getEnterpriseID())) {
            groupTour.setStartDate((java.sql.Date) model.getAttribute("startDate"));
            groupTour.setEndDate((java.sql.Date) model.getAttribute("endDate"));
            groupTour.setMaxPeople((int) model.getAttribute("maxPeople"));
            groupTour.setPrice((int) model.getAttribute("price"));
            groupTourService.updateGroupTour(groupTour);
        }
        return "redirect:/enterprise/grouptour";
    }

    @Scheduled(cron = "0 0 0 * * ?")
    public void checkAndUpdateDepartureDates() {
        List<GroupTour> groupTours = groupTourService.getAllGroupToursByStatus("Waiting");
        LocalDate now = LocalDate.now();

        for (GroupTour groupTour : groupTours) {
            if (groupTour.getStartDate().toLocalDate().isEqual(now)) {
                if (groupTour.getCurrentPeople() < groupTour.getMaxPeople()) {
                    groupTour.setStatus("Canceled");
                    groupTourService.updateGroupTour(groupTour);
                } else {
                    groupTour.setStatus("Active");
                    groupTourService.updateGroupTour(groupTour);
                }
            }
            if (groupTour.getEndDate().toLocalDate().isEqual(now)) {
                groupTour.setStatus("Finished");
                groupTourService.updateGroupTour(groupTour);
            }
        }
    }
}
