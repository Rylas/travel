package org.example.travel.service;

import org.example.travel.entity.Enterprise;
import org.example.travel.repository.EnterpriseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnterpriseService {
    @Autowired
    private EnterpriseRepository enterpriseRepository;

    public EnterpriseService() {
    }

    // Get the enterprise by name
    public Enterprise getEnterpriseByName(String name) {
        return enterpriseRepository.findByName(name);
    }

    // Save the enterprise
    public Enterprise saveEnterprise(Enterprise enterprise) {
        return enterpriseRepository.save(enterprise);
    }

    public List<Enterprise> getAllEnterprises() {
        return enterpriseRepository.findAll();
    }

    public Enterprise activeEnterprise(Long id) {
        Enterprise enterprise = enterpriseRepository.findById(id).orElse(null);
        assert enterprise != null;
        enterprise.setStatus(true);
        return enterpriseRepository.save(enterprise);
    }

    public Enterprise getEnterpriseById(Long id) {
        return enterpriseRepository.findById(id).orElse(null);
    }

    public void deleteEnterprise(Long id) {
        enterpriseRepository.deleteById(id);
    }
}
