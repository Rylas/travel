package org.example.travel.controller;

import org.example.travel.entity.Discount;
import org.example.travel.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DiscountController {
    @Autowired
    private DiscountService discountService;

    @GetMapping("/admin/discount")
    public String discount(Model model) {
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "discount/list";
    }

    @GetMapping("/admin/discount/add")
    public String addDiscount() {
        return "discount/add";
    }

    @GetMapping("/admin/discount/edit")
    public String editDiscount(Model model, @RequestParam("id") Long id) {
        model.addAttribute("discount", discountService.getDiscountById(id));
        return "discount/edit";
    }

    @GetMapping("/admin/discount/delete")
    public String deleteDiscount(@RequestParam("id") Long id) {
        discountService.deleteDiscount(id);
        return "redirect:/admin/discount";
    }

    @PostMapping("/admin/discount/add")
    public String processAdd(Discount discount) {
        discountService.addDiscount(discount);
        return "redirect:/admin/discount";
    }

    @PostMapping("/admin/discount/update")
    public String processEdit(Discount discount) {
        discountService.updateDiscount(discount);
        return "redirect:/admin/discount";
    }
}
