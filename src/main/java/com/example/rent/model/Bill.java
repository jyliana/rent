package com.example.rent.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

public class Bill {
    private int id;
    private int orderId;
    private int billTypeId;
    private int days;
    private BigDecimal totalSum;
    private Date createDate;
    private Date payDate;
    private boolean isPayed;

    public static Bill createBill(int orderId, int days, BigDecimal totalSum, Date createDate) {
        Bill created = new Bill();
        created.setOrderId(orderId);
        created.setDays(days);
        created.setTotalSum(totalSum);
        created.setCreateDate(createDate);
        return created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBillTypeId() {
        return billTypeId;
    }

    public void setBillTypeId(int billTypeId) {
        this.billTypeId = billTypeId;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public boolean isPayed() {
        return isPayed;
    }

    public void setPayed(boolean payed) {
        isPayed = payed;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", billTypeId=" + billTypeId +
                ", days=" + days +
                ", wholePrice=" + totalSum +
                ", createDate=" + createDate +
                ", payDate=" + payDate +
                ", isPayed=" + isPayed +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Bill bill = (Bill) o;
        return id == bill.id && orderId == bill.orderId && billTypeId == bill.billTypeId && days == bill.days && isPayed == bill.isPayed && Objects.equals(totalSum, bill.totalSum) && Objects.equals(createDate, bill.createDate) && Objects.equals(payDate, bill.payDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, orderId, billTypeId, days, totalSum, createDate, payDate, isPayed);
    }
}
