package com.example.rent.model;

public enum BillType {
    RENT, DAMAGE;

    public static BillType getBillType(Bill bill) {
        int billTypeId = bill.getBillTypeId();
        return BillType.values()[billTypeId];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
