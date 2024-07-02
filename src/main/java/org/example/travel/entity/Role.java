package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long roleID;
    private String roleName;

    @OneToMany
    @JoinColumn(name = "roleID")
    private Set<User> users = new HashSet<>();

    public Role() {
    }

    public Role(Long roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
    }

}
