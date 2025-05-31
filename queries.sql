-- 1. List all students enrolled in a specific course (e.g., 'Intro to Python')
SELECT s.student_id, s.name, c.title
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.title = 'Intro to Python';

-- 2. Count how many students are enrolled in each course
SELECT c.title, COUNT(e.student_id) AS total_enrolled
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.title

-- 3. Show students who have completed any course
SELECT s.name, c.title
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.status = 'completed';

-- 4.List students who dropped a course
SELECT s.name, c.title
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.status = 'dropped';

-- 5. Find all students who have not submitted a particular assignment
SELECT s.student_id, s.name
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id
WHERE e.course_id = (
         SELECT a.course_id
         FROM Assignments a
         WHERE a.assignment_id = 401
      )
  AND NOT EXISTS (
      SELECT 1
      FROM Submissions sub
      WHERE sub.student_id = s.student_id
        AND sub.assignment_id = 401
  );


-- 6. List courses along with their instructor names
SELECT c.title, i.name AS instructor_name
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id;

-- 7.Find the instructor with the most number of courses
SELECT i.name, COUNT(c.course_id) AS course_count
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id
ORDER BY course_count DESC
LIMIT 1;

-- 8. Find all courses under a specific department (e.g., Computer Science)
SELECT c.title
FROM Courses c
JOIN Instructors i
  ON c.instructor_id = i.instructor_id
JOIN Departments d
  ON i.department_id = d.department_id
WHERE d.name = 'Computer Science';


--9.List all assignments of a course
SELECT a.title, a.due_date
FROM Assignments a
JOIN Courses c ON a.course_id = c.course_id
WHERE c.title = 'Intro to Python';

-- 10. List students and their marks for a given assignment
SELECT s.name, sub.marks
FROM Submissions sub
JOIN Students s ON sub.student_id = s.student_id
WHERE sub.assignment_id = 401;

-- 11. Find the average marks per assignment
SELECT a.title, AVG(sub.marks) AS average_marks
FROM Submissions sub
JOIN Assignments a ON sub.assignment_id = a.assignment_id
GROUP BY sub.assignment_id;

-- 12. Identify top scoring student in each assignment
SELECT a.title, s.name, sub.marks
FROM Submissions sub
JOIN Assignments a ON sub.assignment_id = a.assignment_id
JOIN Students s ON sub.student_id = s.student_id
WHERE (sub.assignment_id, sub.marks) IN (
    SELECT assignment_id, MAX(marks)
    FROM Submissions
    GROUP BY assignment_id
);

-- 13. Get average feedback rating for each course
SELECT c.title, AVG(cf.rating) AS avg_rating
FROM Course_Feedback cf
JOIN Courses c ON cf.course_id = c.course_id
GROUP BY c.course_id;

-- 14. Show feedback comments for a specific course
SELECT s.name, cf.comments
FROM Course_Feedback cf
JOIN Students s ON cf.student_id = s.student_id
WHERE cf.course_id = 301;

-- 15. List all certificates issued with grades
SELECT s.name, c.title, cert.grade
FROM Certificates cert
JOIN Students s ON cert.student_id = s.student_id
JOIN Courses c ON cert.course_id = c.course_id;

-- 16. List all announcements for a course
SELECT c.title, a.title AS announcement_title, a.created_at
FROM Announcements a
JOIN Courses c ON a.course_id = c.course_id
WHERE c.title = 'Intro to Python';

-- 17. Show number of active students by gender
SELECT gender, COUNT(*) AS total_students
FROM Students
GROUP BY gender;

-- 18. Get list of courses with no enrollments
SELECT c.title
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- 19. List instructors who have no courses assigned
SELECT i.name
FROM Instructors i
LEFT JOIN Courses c ON i.instructor_id = c.instructor_id
WHERE c.course_id IS NULL;

-- 20. Find students who submitted all assignments of a course
SELECT s.name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 301 AND NOT EXISTS (
    SELECT 1
    FROM Assignments a
    WHERE a.course_id = 301 AND NOT EXISTS (
        SELECT 1
        FROM Submissions sub
        WHERE sub.assignment_id = a.assignment_id AND sub.student_id = s.student_id
    )
);

-- 21. UPDATE: Change enrollment status to 'completed' for students who submitted all assignments of course 301
UPDATE Enrollments
SET status = 'completed'
WHERE course_id = 301 AND NOT EXISTS (
    SELECT 1
    FROM Assignments a
    WHERE a.course_id = 301 AND NOT EXISTS (
        SELECT 1
        FROM Submissions s
        WHERE s.assignment_id = a.assignment_id AND s.student_id = Enrollments.student_id
    )
);

-- 22. UPDATE: Increase marks by 5% for all submissions before a certain date
UPDATE Submissions
SET marks = LEAST(ROUND(marks * 1.05), 100)
WHERE submitted_on < '2024-01-01';

-- 23. UPDATE: Change instructor of a course (course_id = 301)
UPDATE Courses
SET instructor_id = 202
WHERE course_id = 301;

-- 24. DELETE: Remove all enrollments with 'dropped' status
DELETE FROM Enrollments
WHERE status = 'dropped';

-- 25. DELETE: Delete students who have not enrolled in any course
DELETE FROM Students
WHERE student_id NOT IN (
    SELECT DISTINCT student_id FROM Enrollments
);

-- 26. DELETE: Remove announcements older than a year
DELETE FROM Announcements
WHERE created_at < CURDATE() - INTERVAL 1 YEAR;

-- 27. DELETE: Remove submissions that received zero marks
DELETE FROM Submissions
WHERE marks = 0;

-- 28. VIEW: View of student grades and certificates
CREATE OR REPLACE VIEW Student_Grades AS
SELECT s.name AS student_name, c.title AS course_title, cert.grade
FROM Certificates cert
JOIN Students s ON cert.student_id = s.student_id
JOIN Courses c ON cert.course_id = c.course_id;

-- 29. VIEW: View of instructor and their courses
CREATE OR REPLACE VIEW Instructor_Courses AS
SELECT i.name AS instructor_name, d.name AS department_name, c.title AS course_title
FROM Instructors i
JOIN Departments d ON i.department = d.department_id
LEFT JOIN Courses c ON i.instructor_id = c.instructor_id;

-- 30. VIEW: View of student assignment performance
CREATE OR REPLACE VIEW Student_Assignment_Marks AS
SELECT s.name AS student_name, a.title AS assignment_title, sub.marks
FROM Submissions sub
JOIN Students s ON sub.student_id = s.student_id
JOIN Assignments a ON sub.assignment_id = a.assignment_id;

-- 31. VIEW: Course feedback summary
CREATE OR REPLACE VIEW Course_Rating_Summary AS
SELECT c.title AS course_title, COUNT(cf.feedback_id) AS total_feedbacks, AVG(cf.rating) AS avg_rating
FROM Course_Feedback cf
JOIN Courses c ON cf.course_id = c.course_id
GROUP BY c.course_id;

-- 32. VIEW: Active students with enrolled courses
CREATE OR REPLACE VIEW Active_Students AS
SELECT s.student_id, s.name, c.title AS course_title, e.status
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.status = 'enrolled';

-- 33. Use VIEW: List top-rated courses from the Course_Rating_Summary view
SELECT course_title, avg_rating
FROM Course_Rating_Summary
WHERE avg_rating >= 4.5
ORDER BY avg_rating DESC;

-- 34. Use VIEW: Get all students who scored below 40 marks in any assignment
SELECT student_name, assignment_title, marks
FROM Student_Assignment_Marks
WHERE marks < 40;

-- 35. Use VIEW: List all instructors along with the number of courses they are handling
SELECT instructor_name, COUNT(course_title) AS total_courses
FROM Instructor_Courses
GROUP BY instructor_name;

-- 36. Use VIEW: Find all currently active students and their enrolled course names
SELECT student_id, name AS student_name, course_title
FROM Active_Students
ORDER BY student_name;

-- 37. Use VIEW: Get students who received a grade of 'A' in any course
SELECT student_name, course_title, grade
FROM Student_Grades
WHERE grade = 'A';

-- 38. Use VIEW: Identify courses where average rating is below 3
SELECT course_title, avg_rating
FROM Course_Rating_Summary
WHERE avg_rating < 3;

-- 39. UPDATE: Set certificate grade to 'NA' where marks are NULL in all submissions
UPDATE Certificates
SET grade = 'NA'
WHERE student_id IN (
    SELECT s.student_id
    FROM Students s
    LEFT JOIN Submissions sub ON s.student_id = sub.student_id
    GROUP BY s.student_id
    HAVING COUNT(sub.marks) = SUM(sub.marks IS NULL)
);

-- 40. DELETE: Remove feedback with NULL comments and rating <= 2
DELETE FROM Course_Feedback
WHERE comments IS NULL AND rating <= 2;

-- 41. UPDATE: Update department name
UPDATE Departments
SET name = 'AI & Data Science'
WHERE department_id = 3;

-- 42. DELETE: Remove certificates for dropped students
DELETE FROM Certificates
WHERE student_id IN (
    SELECT student_id FROM Enrollments WHERE status = 'dropped'
);

-- 43. VIEW: Top 3 students per course based on average marks
CREATE OR REPLACE VIEW Top_Students_Per_Course AS
SELECT sub.course_id, sub.student_id, AVG(sub.marks) AS avg_marks
FROM Submissions sub
JOIN Assignments a ON sub.assignment_id = a.assignment_id
GROUP BY sub.course_id, sub.student_id
ORDER BY sub.course_id, avg_marks DESC;

-- 44. UPDATE: Correct email domain of students
UPDATE Students
SET email = REPLACE(email, '@oldcollege.edu', '@newcollege.edu')
WHERE email LIKE '%@oldcollege.edu';

-- 45. DELETE: Remove instructors with no courses and less than 2 years of experience
DELETE FROM Instructors
WHERE instructor_id NOT IN (SELECT DISTINCT instructor_id FROM Courses)
AND experience < 2;

-- 46. Get the total number of assignments per course
SELECT c.title AS course_title, COUNT(a.assignment_id) AS total_assignments
FROM Courses c
LEFT JOIN Assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;

-- 47. Find instructors who received an average course rating above 4
SELECT i.name AS instructor_name, AVG(cf.rating) AS avg_rating
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
JOIN Course_Feedback cf ON c.course_id = cf.course_id
GROUP BY i.instructor_id
HAVING avg_rating > 4;

-- 48. List students who have not submitted any assignments
SELECT s.student_id, s.name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Submissions sub
    WHERE sub.student_id = s.student_id
);

-- 49. Get the number of students enrolled per department
SELECT d.name AS department_name, COUNT(e.student_id) AS total_students
FROM Departments d
JOIN Instructors i ON d.department_id = i.department
JOIN Courses c ON i.instructor_id = c.instructor_id
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY d.department_id;

-- 50. Display all courses with no feedback given yet
SELECT c.title AS course_title
FROM Courses c
LEFT JOIN Course_Feedback cf ON c.course_id = cf.course_id
WHERE cf.feedback_id IS NULL;
