package com.example.rent.model;

import java.math.BigDecimal;
import java.util.Objects;

public class Car {
    private int id = 0;
    private int classId;
    private String brand;
    private String model;
    private BigDecimal priceForDay;

    public static Car createCar(int classId, String brand, String model, BigDecimal priceForDay) {
        Car created = new Car();
        created.setClassId(classId);
        created.setBrand(brand);
        created.setModel(model);
        created.setPriceForDay(priceForDay);
        return created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public BigDecimal getPriceForDay() {
        return priceForDay;
    }

    public void setPriceForDay(BigDecimal priceForDay) {
        this.priceForDay = priceForDay;
    }

    @Override
    public String toString() {
        return "Car{" +
                "classId=" + classId +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", priceForDay=" + priceForDay +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Car car = (Car) o;
        return Objects.equals(brand, car.brand) && Objects.equals(model, car.model);
    }

    @Override
    public int hashCode() {
        return Objects.hash(brand, model);
    }
}
