# ⚡ Energy Monitoring CLI Tool


---

## 📘 Project Description

This project provides a simple command-line interface that connects to a MySQL database to deliver energy insights such as daily consumption, peak usage hours, appliance trends, and billing alerts.

### 🎯 Learning Goals

This project was built to strengthen following development skills:

- ✅ Relational Database Schema Design
- ✅ Writing SQL Analytical Queries
- ✅ JDBC Integration with Java
- ✅ Object-Oriented Programming Principles
- ✅ Version Control using Git

---

## 🚀 How to Use the JAR File

### 1️⃣ Step 1: Create a MySQL Database

Open your MySQL client and create a new database named `energy_monitoring` (or any unique name of your choice):

    CREATE DATABASE energy_monitoring;


### 2️⃣ Step 2: Import Tables and Seed Data

Once the database is created, run the `schema.sql` file to create all required tables and insert sample data.



     mysql -u your_username -p energy_monitoring < schema.sql

 

### 3️⃣ Step 3: Run the JAR File

Once the database is set up and seeded:

####  Open a terminal and run the JAR file:

    java -jar energy-monitoring-app.jar
### 4️⃣ Step 4: Connect to Your Database

When you run the JAR file, the application will prompt you to connect to your database.

You’ll be asked to enter:

- 🛠️ **Database URL** (e.g., `jdbc:mysql://localhost:3306/energy_monitoring`)
- 👤 **Username** (e.g., `root`)
- 🔐 **Password**

The application will test the connection using these details and display a success/failure message.

## ⚙️ Functionality Overview

Once the JAR file is running and the database connection is established, you’ll see a menu-driven interface.

Each number in the menu corresponds to a specific energy analytics function:

1. **Daily Consumption by Household**  
   ➤ Shows total energy consumed by a given household on a specific date.

2. **Peak Usage Hours Across User Base**  
   ➤ Displays the top 3 hours with the highest total consumption across all households on a given date.

3. **Households Exceeding Budget**  
   ➤ Lists households that crossed their energy budget for a given month and year.

4. **Appliance-Level Energy Trends**  
   ➤ Breaks down consumption by appliance type (e.g., cooling, lighting) for a household on a given date.

5. **Alert History for User**  
   ➤ Fetches alerts generated for a household (e.g., excessive usage warnings).

6. **Estimated vs Actual Bill**  
   ➤ Compares a household’s estimated bill (based on forecast) with the actual usage-based bill for a month.

You can choose a number to invoke the function. After each execution, the app will ask whether you'd like to run another function (`Y/N`).

## 🧾 Working with Inputs

Each function asks for specific input values such as household ID, date, month, or year.  
To help you, the app provides **hints and example inputs** within the interface.

➡️ **Tip:** Use the example inputs whenever possible, as the current dataset is seeded with limited test data.

---

## ☕ Final Words

Thank you for reading this far — you’re awesome!  
Take a deep breath, stretch a little, and have a great day ahead.  
Happy coding! 💻🌿
