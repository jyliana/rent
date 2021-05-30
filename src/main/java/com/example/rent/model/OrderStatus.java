package com.example.rent.model;

public enum OrderStatus {
    NEW, APPROVED, REJECTED;

    public static OrderStatus getOrderStatus(Order order) {
        int orderId = order.getStatusId();
        return OrderStatus.values()[orderId];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
