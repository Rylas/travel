package org.example.travel.controller;

import org.example.travel.entity.Schedule;
import org.example.travel.entity.Tour;
import org.example.travel.service.LocationService;
import org.example.travel.service.ScheduleService;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private TourService tourService;

    @Autowired
    private LocationService locationService;

    @GetMapping("/admin/tour/schedule")
    public String schedule(Model model, @RequestParam("tourID") Long tourID) {
        model.addAttribute("tour", tourService.getTourByTourID(tourID));
        model.addAttribute("schedules", scheduleService.getScheduleByTourID(tourID));
        return "schedule/list";
    }

    @GetMapping("/admin/tour/schedule/add")
    public String addSchedule(Model model, @RequestParam("tourID") Long tourID) {
        model.addAttribute("tourID", tourID);
        model.addAttribute("locations", locationService.getAllLocations());
        return "schedule/add";
    }

    @GetMapping("/admin/tour/schedule/edit")
    public String editSchedule(Model model, @RequestParam("id") Long id) {
        Tour tour = scheduleService.getScheduleById(id).getTour();
        model.addAttribute("tour", tour);
        model.addAttribute("schedule", scheduleService.getScheduleById(id));
        model.addAttribute("locations", locationService.getAllLocations());
        return "schedule/edit";
    }

    @PostMapping("/admin/tour/schedule/add")
    public String processAdd(@RequestParam("tourID") long tourID,
                             @RequestParam("timeStart") String timeStart,
                             @RequestParam("timeEnd") String timeEnd,
                                @RequestParam("date") String date,
                                @RequestParam("title") String title,
                                @RequestParam("description") String description,
                                @RequestParam("locationID") long locationID) {
        Tour tour = tourService.getTourByTourID(tourID);
        Schedule schedule = new Schedule();
        schedule.setTour(tour);
        schedule.setTimeStart(convertToTime(timeStart));
        schedule.setTimeEnd(convertToTime(timeEnd));
        schedule.setDate(java.sql.Date.valueOf(date));
        schedule.setTitle(title);
        schedule.setDescription(description);
        schedule.setLocation(locationService.getLocationById(locationID));
        scheduleService.saveSchedule(schedule);
        return "redirect:/admin/tour/schedule?tourID=" + tour.getTourID();
    }

    @PostMapping("/admin/tour/schedule/update")
    public String processEdit(@RequestParam("scheduleID") long scheduleID,
                              @RequestParam("timeStart") String timeStart,
                              @RequestParam("timeEnd") String timeEnd,
                              @RequestParam("date") String date,
                              @RequestParam("title") String title,
                              @RequestParam("description") String description,
                              @RequestParam("locationID") long locationID) {
        Schedule schedule = scheduleService.getScheduleById(scheduleID);
        schedule.setTimeStart(convertToTime(timeStart));
        schedule.setTimeEnd(convertToTime(timeEnd));
        schedule.setDate(java.sql.Date.valueOf(date));
        schedule.setTitle(title);
        schedule.setDescription(description);
        schedule.setLocation(locationService.getLocationById(locationID));
        scheduleService.saveSchedule(schedule);
        return "redirect:/admin/tour/schedule?tourID=" + schedule.getTour().getTourID();
    }

    @GetMapping("/admin/tour/schedule/delete")
    public String deleteSchedule(@RequestParam("id") Long id) {
        long tourID = scheduleService.getScheduleById(id).getTour().getTourID();
        scheduleService.deleteSchedule(id);
        return "redirect:/admin/tour/schedule?tourID=" + tourID;
    }

    private Time convertToTime(String timeString) {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        try {
            long ms = sdf.parse(timeString).getTime();
            return new Time(ms);
        } catch (ParseException e) {
            throw new RuntimeException("Failed to parse time: " + timeString);
        }
    }
}
