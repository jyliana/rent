package com.example.rent.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

public class Order {
    private int id;
    private int carId;
    private int userId;
    private String passDetails;
    private boolean hasDriver;
    private Date startDate;
    private Date endDate;
    private int statusId;
    private String comment;
    private int days;
    private BigDecimal totalSum;

    public static Order createOrder(int carId, int userId, String passDetails, boolean hasDriver, Date startDate, Date endDate) {
        Order created = new Order();
        created.setCarId(carId);
        created.setUserId(userId);
        created.setPassDetails(passDetails);
        created.setHasDriver(hasDriver);
        created.setStartDate(startDate);
        created.setEndDate(endDate);
        created.setStatusId(0);
        return created;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public BigDecimal getTotalSum() {
        return totalSum;
    }

    public void setTotalSum(BigDecimal totalSum) {
        this.totalSum = totalSum;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPassDetails() {
        return passDetails;
    }

    public void setPassDetails(String passDetails) {
        this.passDetails = passDetails;
    }

    public boolean isHasDriver() {
        return hasDriver;
    }

    public void setHasDriver(boolean hasDriver) {
        this.hasDriver = hasDriver;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", carId=" + carId +
                ", userId=" + userId +
                ", passDetails='" + passDetails + '\'' +
                ", hasDriver=" + hasDriver +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", statusId=" + statusId +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return id == order.id && carId == order.carId && userId == order.userId && hasDriver == order.hasDriver && statusId == order.statusId && Objects.equals(passDetails, order.passDetails) && Objects.equals(startDate, order.startDate) && Objects.equals(endDate, order.endDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, carId, userId, passDetails, hasDriver, startDate, endDate, statusId);
    }
}
