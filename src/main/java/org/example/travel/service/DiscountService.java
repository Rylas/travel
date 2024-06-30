package org.example.travel.service;

import org.example.travel.entity.Discount;
import org.example.travel.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountService {
    @Autowired
    private DiscountRepository discountRepository;

    public void addDiscount(Discount discount) {
        discountRepository.save(discount);
    }

    public void deleteDiscount(Long id) {
        discountRepository.deleteById(id);
    }

    public Discount getDiscountById(Long id) {
        return discountRepository.findById(id).orElse(null);
    }

    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }

    public void updateDiscount(Discount discount) {
        discountRepository.save(discount);
    }
}
