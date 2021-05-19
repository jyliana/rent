package com.example.rent.db.entity;

import com.example.rent.db.Car;

public enum CarClass {
    ENTRY, BUSINESS, PREMIUM;

    public static CarClass getCarClass(Car car) {
        int carId = car.getClassId();
        return CarClass.values()[carId];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
