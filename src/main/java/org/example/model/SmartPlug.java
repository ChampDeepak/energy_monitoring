package org.example.model;

public class SmartPlug {
    private int plugId;         // Primary key (manually set)
    private int householdId;    // Foreign key

    // ✅ Constructor
    public SmartPlug(int plugId, int householdId) {
        this.plugId = plugId;
        this.householdId = householdId;
    }

    // ✅ Getters
    public int getPlugId() {
        return plugId;
    }

    public int getHouseholdId() {
        return householdId;
    }

    // ✅ Setters (if needed)
    public void setPlugId(int plugId) {
        this.plugId = plugId;
    }

    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

}
