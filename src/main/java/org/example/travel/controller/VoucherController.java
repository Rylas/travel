package org.example.travel.controller;

import org.example.travel.entity.Voucher;
import org.example.travel.service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class VoucherController {
    @Autowired
    private VoucherService voucherService;

    @GetMapping("/enterprise/voucher")
    public String listVoucher(Model model) {
        model.addAttribute("vouchers", voucherService.getAllVouchers());
        return "enterprise/voucher";
    }

    @PostMapping("/enterprise/voucher/add")
    public String addVoucher(Voucher voucher) {
        voucher.setStatus(false);
        voucherService.saveVoucher(voucher);
        return "redirect:/enterprise/voucher";
    }

    @GetMapping("/admin/voucher")
    public String voucher(Model model) {
        model.addAttribute("vouchers", voucherService.getAllVouchers());
        return "voucher/list";
    }

    @GetMapping("/admin/voucher/add")
    public String addVoucher() {
        return "voucher/add";
    }

    @GetMapping("/admin/voucher/edit")
    public String editVoucher(Model model, @RequestParam("id") Long id) {
        model.addAttribute("voucher", voucherService.getVoucherById(id));
        return "voucher/edit";
    }

    @GetMapping("/admin/voucher/delete")
    public String deleteVoucher(@RequestParam("id") Long id) {
        voucherService.deleteVoucher(id);
        return "redirect:/admin/voucher";
    }

    @PostMapping("/admin/voucher/add")
    public String processAdd(Voucher voucher) {
        voucherService.saveVoucher(voucher);
        return "redirect:/admin/voucher";
    }

    @PostMapping("/admin/voucher/update")
    public String processEdit(Voucher voucher) {
        voucherService.saveVoucher(voucher);
        return "redirect:/admin/voucher";
    }

    @PostMapping("/checkVoucher")
    public ResponseEntity<Map<String, Object>> checkVoucher(@RequestParam String code) {
        Map<String, Object> response = new HashMap<>();
        Voucher voucher = voucherService.getVoucherByVoucherCode(code);

        if (voucher != null) {
            response.put("valid", true);
            response.put("discountAmount", voucher.getValue());
            response.put("discountType", voucher.isTypeSale());
            response.put("maxValue", voucher.getMaxDesValue());
        } else {
            response.put("valid", false);
        }

        return ResponseEntity.ok(response);
    }

}
