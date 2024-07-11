package org.example.travel.repository;

import org.example.travel.entity.ChatRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {
    // Tìm tất các phòng chat theo userID và status = true
    List<ChatRoom> findByUserUserIDAndStatusTrue(Long userID);

    // Tìm phòng chat theo userID và status = true
    @Query("SELECT c FROM ChatRoom c WHERE c.user.userID = ?1 AND c.status = true")
    ChatRoom findByUserIDAndStatusTrue(Long userID);
}
