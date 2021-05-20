package com.example.rent.model;

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
