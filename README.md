
# 🏥 Hospital Management System (SQL)

A comprehensive **Hospital Management Database System** built using **SQL** to manage patients, doctors, appointments, billing, departments, and medical records.  
This project focuses on **real-world database design**, **data integrity**, and **advanced SQL querying**, not UI or frontend code.

---

## 📌 Project Objective

The objective of this project is to design and implement a **robust relational database** that simulates real hospital workflows such as:

- Patient registration
- Doctor allocation
- Appointment scheduling
- Billing and payment tracking
- Medical record maintenance

This system ensures **data accuracy, consistency, and scalability** using proper SQL constraints and relationships.

---

## 🧠 Why This Project Is Important

Most hospital systems fail due to:
- Poor schema design
- Redundant data
- No integrity checks

This project solves those issues by:
- Applying **normalization (up to 3NF)**
- Using **primary & foreign keys**
- Implementing **business logic with triggers and procedures**
- Supporting **analytical and reporting queries**

---

## 🛠️ Technologies Used

| Component | Technology |
|--------|-----------|
| Database | MySQL / SQL Server |
| Language | SQL |
| Tools | MySQL Workbench / SSMS |
| Documentation | PDF |

---

## 🧩 System Modules Explained

### 1️⃣ Patients Module
- Stores patient personal details
- Each patient has a **unique patient_id**
- Linked to appointments, bills, and medical records

### 2️⃣ Doctors Module
- Stores doctor information and specialization
- Each doctor belongs to a department
- Tracks workload via appointment records

### 3️⃣ Departments Module
- Manages hospital departments (Cardiology, Neurology, etc.)
- Used to group doctors and generate department-level reports

### 4️⃣ Appointments Module
- Handles patient-doctor scheduling
- Prevents overlapping or invalid appointments
- Maintains appointment status (Scheduled, Completed, Cancelled)

### 5️⃣ Billing Module
- Generates bills per patient
- Tracks payment status
- Supports revenue analysis

### 6️⃣ Medical Records Module
- Stores diagnosis and treatment history
- Linked securely to patients and doctors

---

## 📂 Database Schema Overview

The database is designed using **relational modeling principles**:

- One patient → many appointments
- One doctor → many appointments
- One department → many doctors
- One patient → many bills

All relationships are enforced using **foreign keys**.

---

## 🗂️ Project Structure

Hospital-management-SQL-system/
│
├── tables/
│ ├── patients.sql
│ ├── doctors.sql
│ ├── departments.sql
│ ├── appointments.sql
│ ├── bills.sql
│ └── medical_records.sql
│
├── stored-procedures/
│ ├── add_new_patient.sql
│ ├── schedule_appointment.sql
│ └── generate_patient_bill.sql
│
├── functions/
│ └── calculate_total_bill.sql
│
├── triggers/
│ ├── prevent_double_appointment.sql
│ └── auto_update_bill_status.sql
│
├── sample-data/
│ └── insert_sample_data.sql
│
├── docs/
│ └── Hospital_Management_System_Documentation.pdf
│
├── hospital_management.sql
└── README.md

yaml
Copy code

---

## ⚙️ Key Database Features

- ✔ Primary & Foreign Key constraints
- ✔ CHECK and NOT NULL constraints
- ✔ Triggers for automation
- ✔ Stored Procedures for reusable logic
- ✔ Window functions for analytics
- ✔ Referential integrity enforcement

---

## 📊 Example SQL Use Cases

- Total appointments handled by each doctor
- Rank patients based on total billing amount
- Daily appointment statistics
- Department-wise revenue report
- Identify unpaid bills

---

## 🚀 How to Run the Project

1. **Clone the repository**
```bash
git clone https://github.com/Shivam00242/Hospital-management-SQL-system.git
