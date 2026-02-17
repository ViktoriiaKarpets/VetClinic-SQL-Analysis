# 🐾 SQL Data Analysis: Veterinary Clinic Management System

## 📌 Project Overview
This repository contains a complete database solution for a **Veterinary Clinic**. The project demonstrates my ability to design complex relational databases, ensure data integrity (1NF, 2NF, 3NF), and write advanced SQL queries for business decision-making.

The system replaces paper documentation with a digital registry, managing patient history, staff schedules, inventory, and financial reporting.

## 🗄️ Database Architecture
The project is implemented in **SQLite**. Key entities include:
* **Owners & Patients:** Detailed medical history and contact information.
* **Staff & Roles:** Management of shifts (praca_pon - praca_ndz) and access levels.
* **Visits & Services:** Integration of medical diagnoses with a pricing system.
* **Inventory (Magazyn):** Tracking of medical supplies and shop products.

## 📊 Business Intelligence & SQL Showcase
I have designed specific SQL queries to address real-world business needs of the clinic:

### 1. Management & Financial Reports
* **Monthly Revenue:** Calculating total income from both medical services and shop sales.
* **Doctor Performance:** Analyzing which doctors handle the most visits to optimize staffing.
* **Payment Reconciliation:** Reporting daily totals split by payment method (Karta, Gotówka, BLIK).

### 2. Operational Efficiency
* **Daily Schedules:** Automated generation of appointment lists for the reception desk.
* **Supply Management:** Monitoring the "Magazyn" to identify low-stock items.

### 3. Medical Excellence (QA for Data)
* **Patient Safety:** Quick-look queries for patient allergies during visit check-ins.
* **Full History Tracking:** Aggregating all past diagnoses for a specific animal to improve treatment quality.

## 🛠️ Skills Demonstrated
* **Relational Database Design:** Creating ER Diagrams and mapping them to SQL tables.
* **Data Integrity:** Use of Primary/Foreign keys and Constraints (NOT NULL, CHECK).
* **Analytical SQL:** Joins, Aggregations (SUM, COUNT), Grouping, and Filtering.
