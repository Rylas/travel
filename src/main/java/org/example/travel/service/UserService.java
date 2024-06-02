package org.example.travel.service;

import org.example.travel.entity.User;
import org.example.travel.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User login(String email, String password) {
        return userRepository.login(email, password);
    }

    public User findByToken(String token) {
        return userRepository.findByToken(token);
    }

    public void activateAccount(Long id) {
        userRepository.activateAccount(id);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void updateAvatar(User user) {
        userRepository.updateAvatar(user.getUserId(), user.getAvatar());
    }

    public void updateEnterprise(Long userId, Long enterpriseId) {
        userRepository.updateEnterprise(userId, enterpriseId);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}
