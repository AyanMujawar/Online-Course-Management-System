-- Drop tables if they already exist (to avoid errors during re-runs)
DROP TABLE IF EXISTS Submissions, Assignments, Enrollments, Courses, Instructors, Students, Departments, Course_Feedback, Certificates, Announcements;
-- Online Course Management System Schema

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    dob DATE
    phone VARCHAR(15) UNIQUE,
    gender VARCHAR(10)
);

-- Instructors table
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    experience INT,
    bio TEXT,
    FOREIGN KEY (department) REFERENCES Departments(department_id)
);

-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Enrollments table (Many-to-Many relationship)
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    enroll_date DATE,
    status VARCHAR(20) CHECK (status IN ('enrolled', 'completed', 'dropped')),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Assignments table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100),
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Submissions table
CREATE TABLE Submissions (
    submission_id INT PRIMARY KEY,
    student_id INT,
    assignment_id INT,
    submitted_on DATE,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id)
);
-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100)
);
-- Course Feedback table
CREATE TABLE Course_Feedback (
    feedback_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comments TEXT,
    feedback_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Certificates table
CREATE TABLE Certificates (
    certificate_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    issue_date DATE,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Announcements table
CREATE TABLE Announcements (
    announcement_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100),
    content TEXT,
    created_at DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


