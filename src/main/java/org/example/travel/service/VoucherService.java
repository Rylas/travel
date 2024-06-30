package org.example.travel.service;

import org.example.travel.entity.Voucher;
import org.example.travel.repository.VoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoucherService {
    @Autowired
    private VoucherRepository voucherRepository;

    public List<Voucher> getAllVouchers() {
        return voucherRepository.findAll();
    }

    public Voucher getVoucherByVoucherCode(String voucherCode) {
        return voucherRepository.findByVoucherCode(voucherCode);
    }

    public List<Voucher> getVoucherByStatus(boolean status) {
        return voucherRepository.findByStatus(status);
    }

    public Voucher saveVoucher(Voucher voucher) {
        return voucherRepository.save(voucher);
    }

    public void deleteVoucher(Long id) {
        voucherRepository.deleteById(id);
    }

    public Voucher getVoucherById(Long id) {
        return voucherRepository.findById(id).orElse(null);
    }
}
