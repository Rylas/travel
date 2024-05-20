package org.example.travel.repository;

import jakarta.transaction.Transactional;
import org.example.travel.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Login
    @Query("SELECT u FROM User u WHERE u.email = ?1 AND u.password = ?2")
    User login(String email, String password);

    // Register a new user with insert
    @Query(value = "INSERT INTO users (password, email, name, role, isActive) VALUES (?1, ?2, ?3, ?4, ?5, ?6)", nativeQuery = true)
    int register(String password, String email, String name, String role, boolean active);

    // Find user by token
    @Query("SELECT u FROM User u WHERE u.token = ?1")
    User findByToken(String token);

    // Active account by update
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.isActive = true, u.token = null WHERE u.userId = ?1")
    void activateAccount(Long id);

    // Find user by email
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findByEmail(String email);

    // Update avatar
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.avatar = ?2 WHERE u.userId = ?1")
    void updateAvatar(Long id, String avatar);

    // Update enterprise
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.enterprise = ?2 WHERE u.userId = ?1")
    void updateEnterprise(Long userId, Long enterpriseId);
}
