-- Departments
INSERT INTO Departments (department_id, name) VALUES
(1, 'Computer Science'),
(2, 'Data Science'),
(3, 'Electrical Engineering'),
(4, 'Mechanical Engineering'),  
(5, 'Civil Engineering'),
(6, 'Chemical Engineering'),
(7, 'Information Technology'),
(8, 'Artificial Intelligence'),
(9, 'Cybersecurity'),
(10, 'Software Engineering'),
(11, 'Robotics'),
(12, 'Bioinformatics'),
(13, 'Environmental Engineering'),
(14, 'Telecommunications'),
(15, 'Aerospace Engineering');

-- Instructors
INSERT INTO Instructors (instructor_id, name, department, experience, bio) VALUES
(101, 'Dr. Ayesha Khan', 1, 10, 'Expert in AI and Machine Learning.'),
(102, 'Prof. Rajat Sharma', 2, 7, 'Specializes in data mining and analytics.'),
(103, 'Dr. Meera Patel', 3, 12, 'Focused on embedded systems and IoT.'),
(104, 'Dr. Vikram Singh', 4, 8, 'Mechanical systems and robotics expert.'),
(105, 'Prof. Anjali Verma', 5, 15, 'Civil engineering and sustainable design specialist.'),
(106, 'Dr. Ravi Kumar', 6, 9, 'Chemical processes and materials science.'),
(107, 'Prof. Neha Gupta', 7, 11, 'Information systems and IT management.'),
(108, 'Dr. Suresh Rao', 8, 14, 'AI applications in healthcare and finance.'),
(109, 'Prof. Priya Desai', 9, 6, 'Cybersecurity and network security specialist.'),
(110, 'Dr. Arjun Mehta', 10, 13, 'Software development methodologies and practices.'),
(111, 'Prof. Kavita Joshi', 11, 5, 'Robotics and automation systems.'),
(112, 'Dr. Sanjay Iyer', 12, 4, 'Bioinformatics and computational biology.'),
(113, 'Prof. Rina Chatterjee', 13, 3, 'Environmental engineering and sustainability.'),
(114, 'Dr. Amit Kapoor', 14, 2, 'Telecommunications and wireless networks.'),
(115, 'Prof. Neeraj Singh', 15, 1, 'Aerospace systems and avionics.');

-- Students
INSERT INTO Students (student_id, name, email, dob, phone, gender) VALUES
(201, 'Robert Downey Jr.', 'robert@example.com', '2001-05-21', '9876543210', 'Male'),
(202, 'Ross Geller', 'ross@example.com', '2000-12-15', '9876501234', 'Male'),
(203, 'Chandler Bing', 'chandler@example.com', '2002-07-30', '9876512345', 'Male'),
(204, 'Monica Geller', 'monica@example.com', '2001-04-08', '9876523456', 'Female'),
(205, 'Rachel Green', 'rachel@example.com', '2001-05-25', '9876534567', 'Female'),
(206, 'Phoebe Buffay', 'phoebe@example.com', '2001-02-29', '9876549876', 'Female'),
(207, 'Joey Tribbiani', 'joey@example.com', '2001-01-01', '9876556789', 'Male'),
(208, 'Steven Strange', 'steven@example.com', '2001-11-18', '9876567890', 'Male'),
(209, 'Natasha Romanoff', 'natasha@example.com', '2001-04-30', '9876578901', 'Female'),
(210, 'Bruce Banner', 'bruce@example.com', '2001-12-18', '9876589012', 'Male'),
(211, 'Chris Hemsworth', 'chris@example.com', '2001-08-11', '9876590123', 'Male'),
(212, 'Chris Evans', 'chris.evans@example.com', '2001-06-13', '9876509876', 'Male'),
(213, 'Scarlett Johansson', 'scarlett@example.com', '2001-11-22', '9876512345', 'Female'),
(214, 'Tom Hiddleston', 'tom.hiddleston@example.com', '2001-04-01', '9876523456', 'Male'),
(215, 'Lionel Messi', 'lionel.messi@example.com', '2001-06-24', '9876501234', 'Male'),
(216, 'Cristiano Ronaldo', 'cristiano.ronaldo@example.com', '2001-02-05', '9876512345', 'Male'),
(217, 'Neymar Jr.', 'neymar.jr@example.com', '2001-02-05', '9876512345', 'Male'),   
(218, 'Kylian Mbappe', 'kylian.mbappe@example.com', '2001-12-20', '9876523456', 'Male'),    
(219, 'Virat Kohli', 'virat.kohli@example.com', '2001-11-05', '9876534567', 'Male'),    
(220, 'Sachin Tendulkar', 'sachin.tendulkar@example.com', '2001-04-24', '9876543210', 'Male'),  
(221, 'Rohit Sharma', 'rohit.sharma@example.com', '2001-01-30', '9876523456', 'Male'),
(222, 'MS Dhoni', 'ms.dhoni@example.com', '2001-07-07', '9876512345', 'Male');

-- Courses
INSERT INTO Courses (course_id, title, description, instructor_id) VALUES
(301, 'Intro to Python', 'Learn Python basics and syntax.', 101),
(302, 'Data Analytics', 'Analyze and visualize data using tools.', 102),
(303, 'Embedded Systems', 'Hardware interfacing and programming.', 103),
(304, 'Machine Learning', 'Introduction to machine learning algorithms.', 101),
(305, 'Web Development', 'Build dynamic websites using HTML, CSS, and JavaScript.', 107),
(306, 'Database Management', 'Learn SQL and database design principles.', 110),
(307, 'Cybersecurity Fundamentals', 'Basics of cybersecurity and network security.', 109),
(308, 'Robotics Basics', 'Introduction to robotics and automation systems.', 111),
(309, 'Bioinformatics', 'Computational methods in biology.', 112),
(310, 'Environmental Engineering', 'Sustainable engineering practices.', 113),
(311, 'Telecommunications', 'Wireless communication systems and protocols.', 114),
(312, 'Aerospace Systems', 'Fundamentals of aerospace engineering.', 115),
(313, 'Software Engineering', 'Software development lifecycle and methodologies.', 110),
(314, 'Artificial Intelligence', 'AI concepts and applications.', 101),
(315, 'Information Technology Management', 'IT management and strategy.', 107);

-- Enrollments
INSERT INTO Enrollments (student_id, course_id, enroll_date, status) VALUES
(201, 301, '2025-04-01', 'enrolled'),
(202, 301, '2025-04-03', 'completed'),
(202, 302, '2025-04-04', 'enrolled'),
(203, 303, '2025-04-02', 'dropped'),
(204, 301, '2025-04-05', 'enrolled'),
(205, 302, '2025-04-06', 'completed'),
(206, 304, '2025-04-07', 'enrolled'),
(207, 305, '2025-04-08', 'enrolled'),
(208, 306, '2025-04-09', 'completed'),
(209, 307, '2025-04-10', 'enrolled'),
(210, 308, '2025-04-11', 'enrolled'),
(211, 309, '2025-04-12', 'completed'),
(212, 310, '2025-04-13', 'enrolled'),
(213, 311, '2025-04-14', 'enrolled'),
(214, 312, '2025-04-15', 'completed'),
(215, 313, '2025-04-16', 'enrolled'),
(216, 314, '2025-04-17', 'enrolled'),
(217, 315, '2025-04-18', 'completed'),
(218, 301, '2025-04-19', 'enrolled'),
(219, 302, '2025-04-20', 'completed'),
(220, 303, '2025-04-21', 'enrolled'),
(221, 304, '2025-04-22', 'enrolled'),
(222, 305, '2025-04-23', 'completed');

-- Assignments
INSERT INTO Assignments (assignment_id, course_id, title, due_date) VALUES
(401, 301, 'Python Basics Quiz', '2025-04-15'),
(402, 301, 'Mini Project: Calculator', '2025-04-20'),
(403, 302, 'Data Cleaning Task', '2025-04-18'),
(404, 303, 'Embedded Systems Project', '2025-04-22'),
(405, 304, 'ML Algorithm Implementation', '2025-04-25'),
(406, 305, 'Web Development Project', '2025-04-30'),
(407, 306, 'Database Design Assignment', '2025-05-05'),
(408, 307, 'Cybersecurity Case Study', '2025-05-10'),
(409, 308, 'Robotics Simulation Task', '2025-05-15'),
(410, 309, 'Bioinformatics Analysis', '2025-05-20'),
(411, 310, 'Environmental Impact Report', '2025-05-25'),
(412, 311, 'Telecommunications Design Project', '2025-05-30'),
(413, 312, 'Aerospace Systems Analysis', '2025-06-05'),
(414, 313, 'Software Engineering Case Study', '2025-06-10'),
(415, 314, 'AI Application Development', '2025-06-15'),
(416, 315, 'IT Management Strategy Report', '2025-06-20');

-- Submissions
INSERT INTO Submissions (submission_id, student_id, assignment_id, submitted_on, marks) VALUES
(501, 201, 401, '2025-04-14', 88),
(502, 202, 401, '2025-04-14', 92),
(503, 202, 403, '2025-04-17', 85),
(504, 203, 404, '2025-04-21', 75),
(505, 204, 402, '2025-04-19', 90),
(506, 205, 403, '2025-04-18', 95),
(507, 206, 405, '2025-04-24', 80),
(508, 207, 406, '2025-04-29', 70),
(509, 208, 407, '2025-05-04', 85),
(510, 209, 408, '2025-05-09', 78),
(511, 210, 409, '2025-05-14', 82),
(512, 211, 410, '2025-05-19', 88),
(513, 212, 411, '2025-05-24', 90),
(514, 213, 412, '2025-05-29', 95),
(515, 214, 413, '2025-06-03', 87),
(516, 215, 414, '2025-06-08', 92),
(517, 216, 415, '2025-06-13', 89),
(518, 217, 416, '2025-06-18', 91);

-- Course Feedback
INSERT INTO Course_Feedback (feedback_id, student_id, course_id, rating, comments, feedback_date) VALUES
(601, 202, 301, 5, 'Excellent course!', '2025-04-25'),
(602, 203, 303, 3, 'Too hardware-heavy for me.', '2025-04-26'),
(603, 204, 301, 4, 'Good introduction to Python.', '2025-04-27'),
(604, 205, 302, 5, 'Loved the data visualization techniques.', '2025-04-28'),
(605, 206, 304, 4, 'Great insights into machine learning.', '2025-04-29'),
(606, 207, 305, 3, 'Web development was basic.', '2025-04-30'),
(607, 208, 306, 5, 'SQL concepts were well explained.', '2025-05-01'),
(608, 209, 307, 4, 'Cybersecurity basics were useful.', '2025-05-02'),
(609, 210, 308, 5, 'Robotics simulation was fun!', '2025-05-03'),
(610, 211, 309, 4, 'Bioinformatics was interesting.', '2025-05-04'),
(611, 212, 310, 3, 'Environmental engineering needs more examples.', '2025-05-05'),
(612, 213, 311, 4, 'Telecommunications concepts were clear.', '2025-05-06'),
(613, 214, 312, 5, 'Aerospace systems were fascinating.', '2025-05-07'),
(614, 215, 313, 4, 'Software engineering practices were practical.', '2025-05-08'),
(615, 216, 314, 5,'AI applications were well covered.', '2025-05-09'),
(616, 217, 315 ,4,'IT management strategies were insightful.','2025-05-10');

-- Certificates
INSERT INTO Certificates (certificate_id, student_id, course_id, issue_date, grade) VALUES
(701, 202, 301, '2025-04-28', 'A+'),
(702, 203, 303, '2025-04-29', 'B'),
(703, 204, 301, '2025-04-30', 'A'),
(704, 205, 302, '2025-05-01', 'A+'),
(705, 206, 304, '2025-05-02', 'B+'),
(706, 207, 305, '2025-05-03', 'C'),
(707, 208, 306, '2025-05-04', 'A'),
(708, 209, 307, '2025-05-05', 'B+'),
(709, 210, 308, '2025-05-06', 'A'),
(710, 211, 309, '2025-05-07', 'A+'),
(711, 212, 310, '2025-05-08', 'B'),
(712, 213, 311, '2025-05-09', 'A'),
(713, 214, 312, '2025-05-10', 'A+'),
(714, 215, 313 , '2025-05-11', 'B+'),
(715, 216 ,314 , '2025-05-12' , 'A'),
(716 ,217 ,315 , '2025-05-13' , 'A');



-- Announcements
INSERT INTO Announcements (announcement_id, course_id, title, content, created_at) VALUES
(901, 301, 'Python Quiz Date', 'The quiz will be held on April 15.', '2025-04-10'),
(902, 302, 'Project Guidelines', 'Refer to the project guidelines uploaded.', '2025-04-12'),
(903, 303, 'Embedded Systems Lab', 'Lab sessions will start next week.', '2025-04-14'),
(904, 304, 'ML Assignment', 'New assignment on ML algorithms posted.', '2025-04-16'),
(905, 305, 'Web Dev Workshop', 'Workshop on advanced web development techniques.', '2025-04-18'),
(906, 306, 'Database Quiz', 'Quiz on database concepts scheduled for April 20.', '2025-04-20'),
(907, 307, 'Cybersecurity Seminar', 'Seminar on latest cybersecurity trends.', '2025-04-22'),
(908, 308, 'Robotics Competition', 'Details of the upcoming robotics competition.', '2025-04-24'),
(909, 309, 'Bioinformatics Conference', 'Conference on bioinformatics research.', '2025-04-26');
