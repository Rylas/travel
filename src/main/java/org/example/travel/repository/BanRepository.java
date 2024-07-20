package org.example.travel.repository;

import org.example.travel.entity.Ban;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;
@Repository
public interface BanRepository extends JpaRepository<Ban, Long> {
    Ban findByUserUserID(Long userID);

    void deleteByUserUserID(Long userID);

    // unBan
    @Transactional
    @Modifying
    @Query("DELETE FROM Ban b WHERE b.banID = ?1")
    void unBan(Long banID);

}
