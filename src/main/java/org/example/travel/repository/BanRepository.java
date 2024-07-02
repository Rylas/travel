package org.example.travel.repository;

import org.example.travel.entity.Ban;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BanRepository extends JpaRepository<Ban, Long> {
    Ban findByUserUserID(Long userID);

    void deleteByUserUserID(Long userID);

}
