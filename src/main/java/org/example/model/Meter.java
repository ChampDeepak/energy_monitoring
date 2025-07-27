package org.example.model;

public class Meter {
    private int meterId; // Auto-generated
    private int householdId; // Foreign key
    private int meterTypeId;
    private String serialNumber;

    // ✅ Constructor without meterId (used before DB insert)
    public Meter( int meterTypeId, String serialNumber) {

        this.meterTypeId = meterTypeId;
        this.serialNumber = serialNumber;
    }

    // ✅ Constructor with meterId (used when reading from DB)
    public Meter(int meterId, int householdId, int meterTypeId, String serialNumber) {
        this.meterId = meterId;
        this.householdId = householdId;
        this.meterTypeId = meterTypeId;
        this.serialNumber = serialNumber;
    }

    // ✅ Getters
    public int getMeterId() {
        return meterId;
    }

    public int getHouseholdId() {
        return householdId;
    }

    public int getMeterTypeId() {
        return meterTypeId;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    // ✅ Setter for meterId (in case needed after insert)
    public void setMeterId(int meterId) {
        this.meterId = meterId;
    }
    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

}
