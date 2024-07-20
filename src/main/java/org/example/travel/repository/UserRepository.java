package org.example.travel.repository;

import jakarta.transaction.Transactional;
import org.example.travel.entity.Enterprise;
import org.example.travel.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Login
    @Query("SELECT u FROM User u WHERE u.email = ?1 AND u.password = ?2")
    User login(String email, String password);

    // Register a new user with insert
    // Find user by token
    @Query("SELECT u FROM User u WHERE u.token = ?1")
    User findByToken(String token);

    // Active account by update
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.isActive = true, u.token = null WHERE u.userID = ?1")
    void activateAccount(Long id);

    // Find user by email
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findByEmail(String email);

    // Update avatar
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.avatar = ?2 WHERE u.userID = ?1")
    void updateAvatar(Long id, String avatar);

    // Update enterprise
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.enterprise.enterpriseID = ?2 WHERE u.userID = ?1")
    void updateEnterprise(Long userId, Long enterpriseId);

    // Ban user
//    @Modifying
//    @Transactional
//    @Query("UPDATE User u SET u.isActive = false, u.isBanned = true, u.reasonBan = ?2 WHERE u.userId = ?1")
//    void banUser(Long id, String reasonBan);
//
//    @Modifying
//    @Transactional
//    @Query("UPDATE User u SET u.isActive = true, u.isBanned = false, u.reasonBan = null WHERE u.userId = ?1")
//    void unbanUser(Long id);

    // getEnterpriseByUserID, get all column of enterprise by user id and status of enterprise is true
    @Query("SELECT u.enterprise FROM User u WHERE u.userID = ?1 AND u.enterprise.status = true")
    Enterprise getEnterpriseByUserID(Long id);

    // get 6 latest user booking with enterpriseID
    @Query("SELECT u FROM User u JOIN u.bookings b WHERE b.tour.enterprise.enterpriseID = ?1 ORDER BY b.createdAt DESC LIMIT 6")
    List<User> getNewUsersEnterprise(Long enterpriseID);

    // Find user by googleID
    @Query("SELECT u FROM User u WHERE u.googleID = ?1")
    User findByGoogleID(String googleID);

    // findByGoogleIDAndEmail
    @Query("SELECT u FROM User u WHERE u.googleID = ?1 OR u.email = ?2")
    User findByGoogleIDAndEmail(String googleID, String email);

    // Find user by facebookID
    @Query("SELECT u FROM User u WHERE u.facebookID = ?1")
    User findByFacebookID(String facebookID);

    // getNewUsersAdmin
    @Query("SELECT u FROM User u WHERE u.isActive = true ORDER BY u.createdAt DESC LIMIT 6")
    List<User> getNewUsersAdmin();
}
