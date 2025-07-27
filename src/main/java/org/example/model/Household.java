package org.example.model;

public class Household {
    private int householdId; // auto-generated
    private int userId; // foreign key from users table
    private String householdName;
    private String householdAddress;

    // ✅ Constructor without ID (used before inserting into DB)
    public Household( String householdName, String householdAddress) {
        this.householdName = householdName;
        this.householdAddress = householdAddress;
    }

    // ✅ Constructor with ID (used when fetching from DB)
    public Household(int householdId, int userId, String householdName,String householdAddress) {
        this.householdId = householdId;
        this.userId = userId;
        this.householdName = householdName;
        this.householdAddress = householdAddress;
    }

    // ✅ Getters
    public int getHouseholdId() {
        return householdId;
    }

    public int getUserId() {
        return userId;
    }

    public String getHouseholdName() {
        return householdName;
    }

    public String getHouseholdAddress() {
        return householdAddress;
    }

    // ✅ Setter for auto-generated ID
    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
}
