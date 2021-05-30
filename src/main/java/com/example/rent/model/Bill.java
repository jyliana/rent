package com.example.rent.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

public class Bill {
    private int id;
    private int orderId;
    private int billTypeId;
    private int days;
    private BigDecimal wholePrice;
    private Date createDate;
    private Date payDate;
    private boolean isPayed;

    public static Bill createBill(int id, int orderId, int days, BigDecimal wholePrice, Date createDate) {
        Bill created = new Bill();
        created.setId(id);
        created.setOrderId(orderId);
        created.setDays(days);
        created.setWholePrice(wholePrice);
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

    public BigDecimal getWholePrice() {
        return wholePrice;
    }

    public void setWholePrice(BigDecimal wholePrice) {
        this.wholePrice = wholePrice;
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
                ", wholePrice=" + wholePrice +
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
        return id == bill.id && orderId == bill.orderId && billTypeId == bill.billTypeId && days == bill.days && isPayed == bill.isPayed && Objects.equals(wholePrice, bill.wholePrice) && Objects.equals(createDate, bill.createDate) && Objects.equals(payDate, bill.payDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, orderId, billTypeId, days, wholePrice, createDate, payDate, isPayed);
    }
}
