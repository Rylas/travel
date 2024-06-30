package org.example.travel.repository;

import org.example.travel.entity.Enterprise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnterpriseRepository  extends JpaRepository<Enterprise, Long> {

    List<Enterprise> findAll();
    Enterprise findByNameEnterprise(String name);

    // Save the enterprise
    Enterprise save(Enterprise enterprise);
}
