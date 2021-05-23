package com.example.rent.model;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Objects;

public class Car {
    private int id = 0;
    private int classId;
    private String brand;
    private String model;
    private BigDecimal priceForDay;
    private boolean isBooked;
    private InputStream photo;

    public boolean getIsBooked() {
        return isBooked;
    }

    public InputStream getPhoto() {
        return photo;
    }

    public void setPhoto(InputStream photo) {
        this.photo = photo;
    }

    public void setIsBooked(boolean isBooked) {
        this.isBooked = isBooked;
    }

    public static Car createCar(String brand, String model, int carClass, BigDecimal priceForDay) {
        Car created = new Car();
        created.setBrand(brand);
        created.setModel(model);
        created.setClassId(carClass);
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
