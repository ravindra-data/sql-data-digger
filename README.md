# 🗄️ Data Digger — SQL Database Project

A structured SQL project that designs and manages a complete e-commerce database — covering table creation, data insertion, CRUD operations, aggregate functions, filtering, sorting and revenue analysis across 4 related tables.

---

## 📌 Project Overview

This project builds a fully functional **E-Commerce Database** from scratch using MySQL — with real-world tables for Customers, Orders, Products and Order Details — demonstrating core SQL skills used in data analyst roles.

---

## 🗂️ Database Schema

```
Data_digger
│
├── customers      → customerID, name, email, address
├── orders         → orderID, customerID, orderdate, totalamount
├── products       → productID, productname, price, stock
└── orderdetails   → orderdetail_ID, orderID, productID, quantity, sub_total
```

---

## 🚀 Operations Covered

### 📋 Customers Table
| Operation | Query Used |
|---|---|
| Create Table | `CREATE TABLE` with PRIMARY KEY, NOT NULL |
| Insert Records | `INSERT INTO` — 5 customers added |
| Retrieve All | `SELECT *` |
| Update Address | `UPDATE ... SET ... WHERE` |
| Delete Customer | `DELETE ... WHERE customerID` |
| Filter by Name | `SELECT ... WHERE name = 'ravindra'` |

### 🛒 Orders Table
| Operation | Query Used |
|---|---|
| Retrieve by Customer | `SELECT ... WHERE customerID` |
| Recent Orders | `WHERE orderdate >= CURDATE() - INTERVAL 30 DAY` |
| Aggregate Stats | `MAX()`, `MIN()`, `AVG()` on totalamount |

### 📦 Products Table
| Operation | Query Used |
|---|---|
| Sort by Price | `ORDER BY price DESC` |
| Price Range Filter | `WHERE price BETWEEN 500 AND 2000` |
| Delete Out of Stock | `DELETE WHERE stock = 0` |
| Most/Least Expensive | `MAX(price)`, `MIN(price)` |

### 🧾 Order Details Table
| Operation | Query Used |
|---|---|
| Total Revenue | `SUM(sub_total)` |
| Top 3 Products | `GROUP BY` + `ORDER BY` + `LIMIT 3` |
| Product Sales Count | `COUNT(*)` with `WHERE productID` |

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Concepts:** DDL, DML, CRUD, Aggregate Functions, Filtering, Sorting, Grouping
- **Tool:** MySQL Workbench

---

## 📁 Project Structure

```
sql-data-digger/
│
├── Project_Data_Digger.sql   # Complete SQL script
└── README.md                 # Project documentation
```

---

## ▶️ How to Run

1. Clone the repository
```bash
git clone https://github.com/ravindra-data/sql-data-digger.git
```

2. Open MySQL Workbench

3. Open `Project_Data_Digger.sql` and run it

4. Database `Data_digger` will be created with all tables and data!

---

## 📸 Sample Queries & Output

```sql
-- Total Revenue
SELECT SUM(sub_total) AS total_revenue FROM orderdetails;
-- Output: 145600

-- Top 3 Most Ordered Products
SELECT productID, SUM(quantity) AS total_quantity
FROM orderdetails
GROUP BY productID
ORDER BY total_quantity DESC
LIMIT 3;

-- Recent Orders (Last 30 days)
SELECT * FROM orders
WHERE orderdate >= CURDATE() - INTERVAL 30 DAY;
```

---

## 💡 What I Learned

- Designing a relational database schema from scratch
- Writing DDL statements — `CREATE TABLE` with constraints
- Performing full CRUD operations using DML statements
- Using Aggregate functions — `SUM()`, `AVG()`, `MAX()`, `MIN()`, `COUNT()`
- Filtering data using `WHERE`, `BETWEEN`, `INTERVAL`
- Sorting and limiting results using `ORDER BY` and `LIMIT`
- Grouping data using `GROUP BY` for sales analysis

---
