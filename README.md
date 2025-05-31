# 🧠 Online Course Management System (SQL Project)

An end-to-end **relational database project** simulating an online course management platform (think: Coursera, Udemy, etc.).

This project demonstrates:
- **Database schema design** (DDL): Tables, relationships, constraints  
- **Sample data population** (DML): Pre-filled with realistic records  
- **50 SQL queries**: CRUD, complex joins, aggregations, views, analytics  
- **ER Diagram**: Visual entity-relationship model  

---

## 📌 Project Overview

This Online Course Management System (OCMS) is designed to manage:

- **Students** (registration, profiles)  
- **Instructors** (profiles, departments, experience)  
- **Courses** (curriculum, instructor linkage)  
- **Enrollments** (students joining/dropping courses, status tracking)  
- **Assignments** (course tasks, due dates)  
- **Submissions** (assignment uploads, marks)  
- **Course Feedback** (ratings, comments)  
- **Certificates** (issued on course completion)  
- **Admins** (platform administrators)  
- **Announcements** (course-specific notices)  
- **Departments** (organizing instructors/courses)  

**Key SQL concepts covered:**
- Table creation with PK/FK constraints  
- Normalization up to 3NF  
- INSERT, UPDATE, DELETE operations  
- JOINs (INNER, LEFT, RIGHT)  
- Aggregate functions (`COUNT`, `AVG`, `SUM`), `GROUP BY`, `HAVING`  
- `VIEW` definitions for reusable query logic  
- Subqueries, nested queries, conditional DML  

---

## 📋 Prerequisites

Before running this project, ensure you have:
- **MySQL 8.0+** (or compatible MariaDB version) installed  
- A MySQL client or IDE (e.g., MySQL Workbench, HeidiSQL, DBeaver)  
- Basic familiarity with executing `.sql` scripts via command line or GUI  

---

## 🔍 ER Diagram

![ER Diagram](ER_Diagram.png)  
*Created using dbdiagram.io*  

- **Primary keys** are underlined  
- **Foreign keys** (FK) link tables  
- Cardinality (1-to-many, many-to-many via junction tables) is depicted  

---

## 📂 Directory Structure

```
Online-Course-Management-System/
├── schema.sql         # DDL: CREATE TABLE statements + DROP IF EXISTS
├── data.sql           # DML: INSERT statements to populate tables
├── queries.sql        # 50 SQL queries (CRUD, joins, views, analytics)
├── er_diagram.png     # ER diagram image
├── .gitignore         # Git ignore rules for OS/IDE artifacts and DB dumps
└── README.md          # Project overview and instructions
```

- **`schema.sql`**  
  - Creates all tables in the correct order (Departments → Students, Instructors → Courses → Enrollments, Assignments → Submissions → Course_Feedback → Certificates → Admins → Announcements).  
  - Includes `DROP TABLE IF EXISTS` for easy re-runs.

- **`data.sql`**  
  - Populates each table with realistic sample data (e.g., three students, three instructors, three courses, sample assignments/submissions, feedback, certificates, admins, announcements).  
  - Ensures you can immediately run queries against non-empty tables.

- **`queries.sql`**  
  - Contains **50 well-documented SQL statements**:  
    1. **SELECT** queries (joins, filters, aggregates)  
    2. **UPDATE** queries (conditional updates, bulk data adjustments)  
    3. **DELETE** queries (cascade-like cleanup, status-based deletes)  
    4. **CREATE VIEW** statements (reusable result sets for: student grades, instructor courses, assignment performance, feedback summaries, active students, top performers, etc.)  
    5. Example usage of views via additional SELECTs  
  - Each query is prefixed with a comment indicating its purpose/title.

- **`er_diagram.png`**  
  - A PNG screenshot exported from dbdiagram.io showing entities, attributes, and relationships.  
  - Embedded in the README to give a quick visual summary.

- **`.gitignore`**  
  - Prevents local/IDE-specific files (e.g., `.DS_Store`, `.vscode/`), database dumps (e.g., `*.db`, `*_dump.sql`), and logs (e.g., `*.log`) from being committed.

---

## ⚙️ Setup & Usage

1. **Clone the repository**  
   ```bash
   git clone https://github.com/AyanMujawar/Online-Course-Management-System.git
   cd Online-Course-Management-System
   ```

2. **Create & select your database**
   ```sql
   CREATE DATABASE ocms_db;
   USE ocms_db;
   ```

3. **Run the schema script**
   ```sql
   SOURCE schema.sql;
   ```

4. **Populate sample data**
   ```sql
   SOURCE data.sql;
   ```

5. **Verify tables and data**
   ```sql
   SHOW TABLES;
   SELECT * FROM Students LIMIT 5;
   SELECT * FROM Courses LIMIT 5;
   ```

6. **Run the queries**
   ```sql
   SOURCE queries.sql;
   ```
   - Queries are numbered (1–50) with a comment above each section.
   - You can copy/paste individual query blocks to test specific use cases.

---

## 🧮 Sample Queries (Highlights)

Here are a few sample queries from `queries.sql`. Try them out!

```sql
-- 1. List all students enrolled in 'Intro to Python'
SELECT s.student_id, s.name, c.title
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.title = 'Intro to Python';

-- 11. Find the average marks per assignment
SELECT a.title, AVG(sub.marks) AS average_marks
FROM Submissions sub
JOIN Assignments a ON sub.assignment_id = a.assignment_id
GROUP BY sub.assignment_id;

-- 28. VIEW: Student grades and certificates
CREATE OR REPLACE VIEW Student_Grades AS
SELECT s.name AS student_name, c.title AS course_title, cert.grade
FROM Certificates cert
JOIN Students s ON cert.student_id = s.student_id
JOIN Courses c ON cert.course_id = c.course_id;

-- 40. Use VIEW: List top-rated courses from the Course_Rating_Summary view
SELECT course_title, avg_rating
FROM Course_Rating_Summary
WHERE avg_rating >= 4.5
ORDER BY avg_rating DESC;

-- 46. Get the total number of assignments per course
SELECT c.title AS course_title, COUNT(a.assignment_id) AS total_assignments
FROM Courses c
LEFT JOIN Assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;
```

---

## 📈 Project Highlights

- **Normalized Schema:** All tables are in 3rd Normal Form (3NF) to minimize redundancy.
- **Rich Sample Data:** Realistic records allow meaningful query results.
- **Comprehensive Query Set:**
    - Selection & Joins: e.g., dropped students, instructor analytics
    - Aggregations & Grouping: e.g., average feedback, enrollment counts per course/department
    - Views: Modularize complex logic into reusable virtual tables
    - Conditional Updates & Deletes: e.g., auto-complete enrollment when all assignments are submitted, delete stale announcements
- **ER Diagram:** Provides an immediate visual understanding of relationships (PK/FK).

---

## 🚀 Next Steps / Extensions

- **Build a Simple Web Interface**
  - Use Flask (Python), Node.js/Express, or PHP to connect to your MySQL database.
  - Create basic CRUD pages for:
    - Student registration & profile view
    - Instructor dashboard (view enrolled students, post announcements)
    - Course browsing & enrollment for users
    - Assignment upload/submission forms
  - This adds a UI layer on top of your SQL logic.

- **Add Stored Procedures & Triggers**
  - Example: Trigger to automatically generate a certificate when all assignments for a course are submitted.
  - Stored procedures to batch-update enrollment statuses or generate summary reports.

- **Performance Tuning & Indexing**
  - Add indexes on frequently queried columns (e.g., Enrollments.course_id, Submissions.assignment_id).
  - Use `EXPLAIN` to analyze query plans and optimize join order.

- **Data Export/Import Scripts**
  - Create .csv exports of tables (e.g., enrollment rosters).
  - Write a script to import/export data for backup or ETL workflows.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to open an [issue](https://github.com/AyanMujawar/Online-Course-Management-System/issues) or submit a pull request.

**To contribute:**
1. Fork the repo
2. Create a new branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

---


## ✨ Contact

**Project Author:**  
Ayan Mujawar  
B.Tech CSE, Pimpri Chinchwad College Of Engineering  
GitHub: [@AyanMujawar](https://github.com/AyanMujawar)

For questions or suggestions, open an [issue](https://github.com/AyanMujawar/Online-Course-Management-System/issues) or contact me via GitHub.

> ⭐️ If you found this useful, please star the repo and share your feedback!