package com.example.rent.db;

import com.example.rent.db.entity.User;

public enum Role {
    ADMIN, MANAGER, CLIENT;

    public static Role getRole(User user) {
        int roleId = user.getRoleId();
        return Role.values()[roleId];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
