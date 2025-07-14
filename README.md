# 📚 Library Management System (SQL Project)

## 🗒️ Project Overview

This project is a **Library Management System** implemented using **MySQL**.  
It simulates a real-life library's database operations like managing books, authors, publishers, borrowers, branches, and book loans.

---

## ⚙️ Features

- Manage **Publishers**  
- Manage **Books**  
- Track **Authors of Books**  
- Manage **Library Branches**  
- Record **Book Copies in each Branch**  
- Track **Borrowers and Book Loans**

---

## 🗄️ Database Tables

| Table Name            | Description                               |
|----------------------|-------------------------------------------|
| `tbl_publisher`       | Stores publisher details                  |
| `tbl_book`            | Stores book details and publisher info   |
| `tbl_library_branch`  | Stores library branch details             |
| `tbl_borrower`        | Stores borrower (members) details         |
| `tbl_book_loans`      | Tracks book loans by borrowers            |
| `tbl_book_copies`     | Stores number of copies per branch        |
| `tbl_book_authors`    | Stores authors of books                   |

---

## 🏗️ Database Schema

- **Primary Keys** and **Foreign Keys** used properly  
- **ON DELETE CASCADE** and **ON UPDATE CASCADE** constraints implemented  
- Proper **Normalization** done

---

## 🧑‍💻 How to Run

1️⃣ Install MySQL  
2️⃣ Create a database:  
```sql
CREATE DATABASE db_LibraryManagement;
USE db_LibraryManagement;
````

3️⃣ Run the SQL script:

```sql
-- Run the file: library_management_project.sql
```

---

## 📦 Sample Data Included

* **16 Publishers**
* **20 Books**
* **4 Library Branches**
* **8 Borrowers**
* **Book Copies & Loans data**

---

## 💡 Use Case

This project is useful for:

* **College Database Projects**
* **SQL Practice**
* **Portfolio Showcase**
* **Learning Database Design**

---

## 👨‍💻 Author

**Kunal **
*SQL Enthusiast | Data Learner*

---

## 📄 License

This project is licensed under the **MIT License**.
Feel free to use and modify it.


