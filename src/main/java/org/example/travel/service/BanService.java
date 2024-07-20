package org.example.travel.service;

import jakarta.transaction.Transactional;
import org.example.travel.entity.Ban;
import org.example.travel.entity.Tour;
import org.example.travel.repository.BanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BanService {
    @Autowired
    private BanRepository banRepository;


    // Ban user
    public void banUser(Ban ban) {
        banRepository.save(ban);
    }

    // Unban user
    @Transactional
    public void unbanUser(Long userID) {
        Ban ban = banRepository.findByUserUserID(userID);
        if (ban != null) {
            banRepository.unBan(ban.getBanID());
        }
    }

    // Get ban by user id
    public Ban getBanByUserID(Long userID) {
        return banRepository.findByUserUserID(userID);
    }
}
