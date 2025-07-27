package org.example;

import org.example.analytics.AlertAnalytics;
import org.example.analytics.BillingAnalytics;
import org.example.analytics.ConsumptionAnalytics;

import java.sql.SQLException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);


        System.out.print("Enter DB URL (e.g., jdbc:mysql://localhost:3306/energy_monitor): ");
        String url = scanner.nextLine();

        System.out.print("Enter DB Username: ");
        String username = scanner.nextLine();

        System.out.print("Enter DB Password: ");
        String password = scanner.nextLine();


        DatabaseConnector.setCredentials(url, username, password);


        DatabaseConnector.testConnection();


        String continueChoice;
        do {

            System.out.println("\nWhich analytics function do you want to run?");
            System.out.println("1. Daily consumption by household");
            System.out.println("2. Peak usage hours across user base");
            System.out.println("3. Households exceeding budgeted usage");
            System.out.println("4. Appliance-level consumption trends");
            System.out.println("5. Alert history per user");
            System.out.println("6. Estimated vs. actual bill comparison");
            System.out.print("Enter your choice (1-6): ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    System.out.print("Enter household ID (e.g., 1): ");
                    int h1 = scanner.nextInt();
                    scanner.nextLine();
                    System.out.print("Enter date (YYYY-MM-DD, e.g., 2025-07-20): ");
                    String date1 = scanner.nextLine();
                    ConsumptionAnalytics.getDailyConsumptionByHousehold(h1, date1);
                    break;

                case 2:
                    System.out.print("Enter date (YYYY-MM-DD, e.g., 2025-07-20): ");
                    String date2 = scanner.nextLine();
                    ConsumptionAnalytics.getPeakUsageHoursAcrossUserBase(date2);
                    break;

                case 3:
                    System.out.print("Enter year (e.g., 2025): ");
                    String year = scanner.nextLine();
                    System.out.print("Enter month (1-12, e.g., 7): ");
                    String month = scanner.nextLine();
                    BillingAnalytics.getHouseholdsExceedingBudget(year, month);
                    break;

                case 4:
                    System.out.print("Enter household ID (e.g., 1): ");
                    int h2 = scanner.nextInt();
                    scanner.nextLine();
                    System.out.print("Enter date (YYYY-MM-DD, e.g., 2025-07-20): ");
                    String date4 = scanner.nextLine();
                    ConsumptionAnalytics.getApplianceLevelTrends(h2, date4);
                    break;

                case 5:
                    System.out.print("Enter user ID (e.g., 1): ");
                    int userId = scanner.nextInt();
                    scanner.nextLine();
                    AlertAnalytics.getAlertHistoryForUser(userId);
                    break;

                case 6:
                    System.out.print("Enter household ID (e.g., 1): ");
                    int h3 = scanner.nextInt();
                    scanner.nextLine();
                    System.out.print("Enter month (1-12, e.g., 5): ");
                    String month6 = scanner.nextLine();
                    System.out.print("Enter year (e.g., 2025): ");
                    String year6 = scanner.nextLine();
                    BillingAnalytics.getEstimatedVsActualBill(h3, month6, year6);
                    break;

                default:
                    System.out.println("Invalid choice.");
            }


            System.out.print("\nDo you want to run another function? (Y/N): ");
            continueChoice = scanner.nextLine().trim().toUpperCase();

        } while (continueChoice.equals("Y"));

        System.out.println("👋 Take A Deep Breathe!");
        System.out.println("And Have A Nice Day.");
        scanner.close();
    }
}