-- Additional Students 
INSERT INTO STUDENT (user_name, first_name, last_name, email, clerk_user_id, last_login, created_at, updated_at)
VALUES
('pwilson', 'Peter', 'Wilson', 'peter.wilson@example.com', 'clerk_12375', NOW(), NOW(), NOW()),
('ethomas', 'Emily', 'Thomas', 'emily.thomas@example.com', 'clerk_12376', NOW(), NOW(), NOW()),
('hkim', 'Hannah', 'Kim', 'hannah.kim@example.com', 'clerk_12377', NOW(), NOW(), NOW()),
('mposner', 'Michael', 'Posner', 'michael.posner@example.com', 'clerk_12378', NOW(), NOW(), NOW()),
('cgarcia', 'Carlos', 'Garcia', 'carlos.garcia@example.com', 'clerk_12379', NOW(), NOW(), NOW()),
('yzhang', 'Yan', 'Zhang', 'yan.zhang@example.com', 'clerk_12380', NOW(), NOW(), NOW()),
('kbrown', 'Kevin', 'Brown', 'kevin.brown@example.com', 'clerk_12381', NOW(), NOW(), NOW()),
('psingh', 'Priya', 'Singh', 'priya.singh@example.com', 'clerk_12382', NOW(), NOW(), NOW()),
('amueller', 'Anna', 'Mueller', 'anna.mueller@example.com', 'clerk_12383', NOW(), NOW(), NOW()),
('rmartinez', 'Roberto', 'Martinez', 'roberto.martinez@example.com', 'clerk_12384', NOW(), NOW(), NOW());

-- Additional Teachers 
INSERT INTO TEACHER (user_name, first_name, last_name, email, clerk_user_id, role, last_login, created_at, updated_at)
VALUES
('ppatel', 'Priya', 'Patel', 'priya.patel@example.com', 'clerk_22360', 'teacher', NOW(), NOW(), NOW()),
('ychen', 'Yong', 'Chen', 'yong.chen@example.com', 'clerk_22361', 'teacher', NOW(), NOW(), NOW()),
('kshah', 'Kiran', 'Shah', 'kiran.shah@example.com', 'clerk_22362', 'admin', NOW(), NOW(), NOW()),
('slopez', 'Sofia', 'Lopez', 'sofia.lopez@example.com', 'clerk_22363', 'teacher', NOW(), NOW(), NOW()),
('jpark', 'Jin', 'Park', 'jin.park@example.com', 'clerk_22364', 'teacher', NOW(), NOW(), NOW());

-- Additional Colleges 
INSERT INTO COLLEGE (name, dean_id, created_at, updated_at)
VALUES
('School of Pharmacy', 11, NOW(), NOW()),
('School of Architecture', 12, NOW(), NOW());

-- Additional Departments 
INSERT INTO DEPARTMENT (name, chair_id, college_id, created_at, updated_at)
VALUES
('Pharmaceutical Sciences', 11, 5, NOW(), NOW()),
('Architectural Design', 12, 6, NOW(), NOW()),
('Biotechnology', 13, 2, NOW(), NOW()),
('Environmental Science', 14, 2, NOW(), NOW());

-- Additional Courses 
INSERT INTO COURSE (course_id, course_name, course_code, course_description, capacity, teacher_id, is_active, start_date, end_date, created_at, updated_at)
VALUES
('PHAR101', 'Introduction to Pharmacy', 'PHAR101-F24', 'Basic pharmaceutical concepts', 40, 11, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('ARCH101', 'Architectural Fundamentals', 'ARCH101-F24', 'Basic architectural principles', 35, 12, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('BIOT101', 'Intro to Biotechnology', 'BIOT101-F24', 'Fundamentals of biotechnology', 30, 13, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('ENVS101', 'Environmental Studies', 'ENVS101-F24', 'Introduction to environmental science', 45, 14, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('PHAR201', 'Pharmaceutical Chemistry', 'PHAR201-F24', 'Chemical principles in pharmacy', 30, 15, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW());

-- Additional Enrollments 
INSERT INTO ENROLLMENT (student_id, course_id, status, enrollment_date)
VALUES
(21, 'PHAR101', 1, NOW()),
(22, 'ARCH101', 1, NOW()),
(23, 'BIOT101', 1, NOW()),
(24, 'ENVS101', 1, NOW()),
(25, 'PHAR201', 1, NOW()),
(26, 'PHAR101', 1, NOW()),
(27, 'ARCH101', 1, NOW()),
(28, 'BIOT101', 1, NOW()),
(29, 'ENVS101', 1, NOW()),
(30, 'PHAR201', 1, NOW());

-- Additional Exams 
INSERT INTO EXAM (course_id, exam_name, exam_description, start_date, end_date, created_at, updated_at)
VALUES
('PHAR101', 'Pharmacy Basics Assessment', 'Fundamental pharmacy concepts', '2024-09-30 10:00:00', '2024-09-30 12:00:00', NOW(), NOW()),
('ARCH101', 'Architecture Principles Test', 'Basic architectural concepts', '2024-10-05 09:00:00', '2024-10-05 11:00:00', NOW(), NOW()),
('BIOT101', 'Biotechnology Lab Exam', 'Practical biotechnology assessment', '2024-10-10 13:00:00', '2024-10-10 16:00:00', NOW(), NOW()),
('ENVS101', 'Environmental Science Midterm', 'Comprehensive environmental concepts', '2024-10-15 14:00:00', '2024-10-15 17:00:00', NOW(), NOW()),
('PHAR201', 'Pharmaceutical Chemistry Test', 'Chemical principles in pharmacy', '2024-10-20 09:00:00', '2024-10-20 12:00:00', NOW(), NOW());

-- Additional Exam Questions 
INSERT INTO EXAM_QUESTION (exam_id, question_text, created_at, updated_at)
VALUES
(5, 'Explain the role of pharmacokinetics in drug delivery.', NOW(), NOW()),
(5, 'Describe the importance of drug absorption rates.', NOW(), NOW()),
(6, 'Define sustainable architectural design principles.', NOW(), NOW()),
(6, 'Explain the importance of site analysis in architecture.', NOW(), NOW()),
(7, 'Describe DNA replication process.', NOW(), NOW()),
(7, 'Explain the applications of PCR in biotechnology.', NOW(), NOW()),
(8, 'Discuss the impact of climate change on ecosystems.', NOW(), NOW()),
(8, 'Explain the concept of biodiversity and its importance.', NOW(), NOW()),
(9, 'Describe the chemical structure of common drug compounds.', NOW(), NOW()),
(9, 'Explain drug-receptor interactions at molecular level.', NOW(), NOW());

-- Additional Answers 
INSERT INTO ANSWER (answer_text, question_id, created_at, updated_at)
VALUES
('Pharmacokinetics governs how drugs move through the body.', 16, NOW(), NOW()),
('Drug absorption rates affect therapeutic effectiveness.', 17, NOW(), NOW()),
('Sustainable design minimizes environmental impact.', 18, NOW(), NOW()),
('Site analysis ensures optimal building placement and design.', 19, NOW(), NOW()),
('DNA replication involves multiple enzymes and proteins.', 20, NOW(), NOW()),
('PCR amplifies specific DNA sequences for analysis.', 21, NOW(), NOW()),
('Climate change affects species distribution and survival.', 22, NOW(), NOW()),
('Biodiversity ensures ecosystem resilience and stability.', 23, NOW(), NOW()),
('Drug compounds have specific functional groups.', 24, NOW(), NOW()),
('Receptor interactions determine drug effectiveness.', 25, NOW(), NOW());

-- Additional Student Answers 
INSERT INTO STUDENT_ANSWER (student_id, question_id, answer_text, answer_grade, answer_stage, created_at, updated_at)
VALUES
(21, 16, 'Pharmacokinetics describes drug movement in body systems.', 'A', 1, NOW(), NOW()),
(22, 18, 'Sustainable design focuses on environmental conservation.', 'A', 1, NOW(), NOW()),
(23, 20, 'DNA replication is semi-conservative and involves multiple steps.', 'A', 1, NOW(), NOW()),
(24, 22, 'Climate change affects global ecosystems and biodiversity.', 'B', 1, NOW(), NOW()),
(25, 24, 'Drug compounds contain specific functional groups for activity.', 'A', 1, NOW(), NOW()),
(26, 17, 'Absorption rates determine drug bioavailability.', 'B', 1, NOW(), NOW()),
(27, 19, 'Site analysis considers environmental and social factors.', 'A', 1, NOW(), NOW()),
(28, 21, 'PCR is used for DNA amplification in research.', 'A', 1, NOW(), NOW()),
(29, 23, 'Biodiversity supports ecosystem functions.', 'B', 1, NOW(), NOW()),
(30, 25, 'Drug-receptor interactions are specific and selective.', 'A', 1, NOW(), NOW());