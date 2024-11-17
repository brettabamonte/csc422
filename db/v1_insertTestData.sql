
INSERT INTO STUDENT (user_name, first_name, last_name, email, clerk_user_id, last_login, created_at, updated_at)
VALUES
('jdoe', 'John', 'Doe', 'john.doe@example.com', 'clerk_12345', NOW(), NOW(), NOW()),
('asmith', 'Alice', 'Smith', 'alice.smith@example.com', 'clerk_12346', NOW(), NOW(), NOW()),
('bwilliams', 'Bob', 'Williams', 'bob.williams@example.com', 'clerk_12347', NOW(), NOW(), NOW());


INSERT INTO TEACHER (user_name, first_name, last_name, email, clerk_user_id, role, last_login, created_at, updated_at)
VALUES
('mjones', 'Mary', 'Jones', 'mary.jones@example.com', 'clerk_22345', 'admin', NOW(), NOW(), NOW()),
('rjohnson', 'Rick', 'Johnson', 'rick.johnson@example.com', 'clerk_22346', 'teacher', NOW(), NOW(), NOW());


INSERT INTO COLLEGE (name, dean_id, created_at, updated_at)
VALUES
('Engineering College', 1, NOW(), NOW()),
('Science College', 2, NOW(), NOW());


INSERT INTO DEPARTMENT (name, chair_id, college_id, created_at, updated_at)
VALUES
('Computer Science', 2, 1, NOW(), NOW()),
('Mathematics', 1, 2, NOW(), NOW());


INSERT INTO COURSE (course_id, course_name, course_code, course_description, capacity, teacher_id, is_active, start_date, end_date, created_at, updated_at)
VALUES
('CS101', 'Intro to CS', 'CS101-FALL', 'Introduction to Computer Science', 50, 2, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('MATH201', 'Calculus I', 'MATH201-FALL', 'Differential and Integral Calculus', 40, 1, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW());


INSERT INTO ENROLLMENT (student_id, course_id, status, enrollment_date)
VALUES
(1, 'CS101', 1, NOW()),
(2, 'MATH201', 1, NOW()),
(3, 'CS101', 2, NOW());


INSERT INTO EXAM (course_id, exam_name, exam_description, start_date, end_date, created_at, updated_at)
VALUES
('CS101', 'Midterm Exam', 'Covers Chapters 1-4', '2024-10-15 10:00:00', '2024-10-15 12:00:00', NOW(), NOW()),
('MATH201', 'Final Exam', 'Covers All Topics', '2024-12-10 09:00:00', '2024-12-10 12:00:00', NOW(), NOW());


INSERT INTO EXAM_QUESTION (exam_id, question_text, created_at, updated_at)
VALUES
(1, 'What is a variable in programming?', NOW(), NOW()),
(1, 'Explain the concept of recursion.', NOW(), NOW()),
(2, 'What is the derivative of x^2?', NOW(), NOW());


INSERT INTO ANSWER (answer_text, question_id, created_at, updated_at)
VALUES
('A variable is a storage location for data.', 1, NOW(), NOW()),
('Recursion is a process where a function calls itself.', 2, NOW(), NOW()),
('The derivative of x^2 is 2x.', 3, NOW(), NOW());


INSERT INTO STUDENT_ANSWER (student_id, question_id, answer_text, second_attempt_answer, answer_grade, second_attempt_grade, answer_stage, created_at, updated_at)
VALUES
(1, 1, 'A variable is a data container.', NULL, 'A', NULL, 1, NOW(), NOW()),
(1, 2, 'A variable is a data container.', NULL, 'A', NULL, 1, NOW(), NOW()),
(2, 3, 'The derivative is x.', 'The derivative is 2x.', 'C', 'A', 2, NOW(), NOW());
