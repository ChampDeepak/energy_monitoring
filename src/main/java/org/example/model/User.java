package org.example.model;

public class User {
    private int userId; // this will be set only after insertion
    private String name;
    private String mainAddress;
    private String email;
    private String phone;

    // ✅ Constructors
    public User(String name, String mainAddress, String email, String phone) {
        this.name = name;
        this.mainAddress = mainAddress;
        this.email = email;
        this.phone = phone;
    }

    public User(int userId, String name, String mainAddress, String email, String phone) {
        this.userId = userId;
        this.name = name;
        this.mainAddress = mainAddress;
        this.email = email;
        this.phone = phone;
    }

    // ✅ Getters
    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getMainAddress() {
        return mainAddress;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    // ✅ Setters (only for ID)
    public void setUserId(int userId) {
        this.userId = userId;
    }
}
