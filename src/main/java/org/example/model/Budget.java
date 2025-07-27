package org.example.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Budget {
    private int budgetId; // Auto-generated
    private int householdId; // Foreign key
    private LocalDate date;
    private double budgetAmountKwh;

    // ✅ Constructor without budgetId (for insert operations)
    public Budget(LocalDate date,  double budgetAmountKwh) {
        this.date = date;
        this.budgetAmountKwh = budgetAmountKwh;
    }

    // ✅ Constructor with budgetId (for reading from DB)
    public Budget(int budgetId, int householdId, LocalDate date,  double budgetAmountKwh) {
        this.budgetId = budgetId;
        this.householdId = householdId;
        this.date = date;
        this.budgetAmountKwh = budgetAmountKwh;
    }

    // ✅ Getters
    public int getBudgetId() {
        return budgetId;
    }

    public int getHouseholdId() {
        return householdId;
    }

    public LocalDate getDate() {
        return date;
    }

    public  double getBudgetAmountKwh() {
        return budgetAmountKwh;
    }

    // ✅ Setter for budgetId in case it's needed post-insert
    public void setBudgetId(int budgetId) {
        this.budgetId = budgetId;
    }
    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

}
