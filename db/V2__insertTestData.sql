
INSERT INTO STUDENT (user_name, first_name, last_name, email, clerk_user_id, last_login, created_at, updated_at)
VALUES
('jdoe', 'John', 'Doe', 'john.doe@example.com', 'clerk_12345', NOW(), NOW(), NOW()),
('asmith', 'Alice', 'Smith', 'alice.smith@example.com', 'clerk_12346', NOW(), NOW(), NOW()),
('bwilliams', 'Bob', 'Williams', 'bob.williams@example.com', 'clerk_12347', NOW(), NOW(), NOW()),
('lwhite', 'Lucy', 'White', 'lucy.white@example.com', 'clerk_12348', NOW(), NOW(), NOW()),
('dblack', 'David', 'Black', 'david.black@example.com', 'clerk_12349', NOW(), NOW(), NOW()),
('hgreen', 'Helen', 'Green', 'helen.green@example.com', 'clerk_12350', NOW(), NOW(), NOW()),
('gsmith', 'George', 'Smith', 'george.smith@example.com', 'clerk_12351', NOW(), NOW(), NOW()),
('nrodriguez', 'Natalie', 'Rodriguez', 'natalie.rodriguez@example.com', 'clerk_12352', NOW(), NOW(), NOW()),
('jchan', 'Jessica', 'Chan', 'jessica.chan@example.com', 'clerk_12353', NOW(), NOW(), NOW()),
('jjones', 'Jason', 'Jones', 'jason.jones@example.com', 'clerk_12354', NOW(), NOW(), NOW()),
('jsmith', 'John', 'Smith', 'john.smith@example.com', 'clerk_12355', '2024-10-10 08:00:00', NOW(), NOW()),
('bjackson', 'Betty', 'Jackson', 'betty.jackson@example.com', 'clerk_12356', '2024-10-10 08:00:00', NOW(), NOW()),
('rclark', 'Richard', 'Clark', 'richard.clark@example.com', 'clerk_12357', '2024-10-10 08:00:00', NOW(), NOW()),
('mfoster', 'Mary', 'Foster', 'mary.foster@example.com', 'clerk_12358', '2024-10-10 08:00:00', NOW(), NOW()),
('tturner', 'Tom', 'Turner', 'tom.turner@example.com', 'clerk_12359', '2024-10-10 08:00:00', NOW(), NOW()),
('khall', 'Kim', 'Hall', 'kim.hall@example.com', 'clerk_12360', '2024-10-10 08:00:00', NOW(), NOW()),
('nlee', 'Nina', 'Lee', 'nina.lee@example.com', 'clerk_12361', '2024-10-10 08:00:00', NOW(), NOW()),
('aparker', 'Adam', 'Parker', 'adam.parker@example.com', 'clerk_12362', '2024-10-10 08:00:00', NOW(), NOW()),
('vgreen', 'Victor', 'Green', 'victor.green@example.com', 'clerk_12363', '2024-10-10 08:00:00', NOW(), NOW()),
('scarter', 'Sarah', 'Carter', 'sarah.carter@example.com', 'clerk_12364', '2024-10-10 08:00:00', NOW(), NOW());

INSERT INTO TEACHER (user_name, first_name, last_name, email, clerk_user_id, role, last_login, created_at, updated_at)
VALUES
('mjones', 'Mary', 'Jones', 'mary.jones@example.com', 'clerk_22345', 'admin', NOW(), NOW(), NOW()),
('rjohnson', 'Rick', 'Johnson', 'rick.johnson@example.com', 'clerk_22346', 'teacher', NOW(), NOW(), NOW()),
('jroberts', 'James', 'Roberts', 'james.roberts@example.com', 'clerk_22347', 'teacher', NOW(), NOW(), NOW()),
('kthomas', 'Karen', 'Thomas', 'karen.thomas@example.com', 'clerk_22348', 'teacher', NOW(), NOW(), NOW()),
('emartin', 'Emma', 'Martin', 'emma.martin@example.com', 'clerk_22349', 'teacher', NOW(), NOW(), NOW()),
('awilliams', 'Alan', 'Williams', 'alan.williams@example.com', 'clerk_22350', 'teacher', NOW(), NOW(), NOW()),
('sjohnson', 'Susan', 'Johnson', 'susan.johnson@example.com', 'clerk_22351', 'teacher', NOW(), NOW(), NOW()),
('bgarcia', 'Ben', 'Garcia', 'ben.garcia@example.com', 'clerk_22352', 'admin', NOW(), NOW(), NOW()),
('nmartinez', 'Natalie', 'Martinez', 'natalie.martinez@example.com', 'clerk_22353', 'teacher', NOW(), NOW(), NOW()),
('mlewis', 'Michael', 'Lewis', 'michael.lewis@example.com', 'clerk_22354', 'teacher', NOW(), NOW(), NOW());

INSERT INTO COLLEGE (name, dean_id, created_at, updated_at)
VALUES
('Engineering College', 1, NOW(), NOW()),
('Science College', 2, NOW(), NOW()),
('Arts and Humanities', 3, NOW(), NOW()),
('Business College', 4, NOW(), NOW());


INSERT INTO DEPARTMENT (name, chair_id, college_id, created_at, updated_at)
VALUES
('Computer Science', 2, 1, NOW(), NOW()),
('Mathematics', 1, 2, NOW(), NOW()),
('Literature', 3, 3, NOW(), NOW()),
('Finance', 4, 4, NOW(), NOW());


INSERT INTO COURSE (course_id, course_name, course_code, course_description, capacity, teacher_id, is_active, start_date, end_date, created_at, updated_at)
VALUES
('CS101', 'Intro to CS', 'CS101-FALL', 'Introduction to Computer Science', 50, 2, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('MATH201', 'Calculus I', 'MATH201-FALL', 'Differential and Integral Calculus', 40, 1, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('PHIL101', 'Intro to Philosophy', 'PHIL101-FALL', 'Basic concepts of philosophy.', 30, 4, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('ACC101', 'Financial Accounting', 'ACC101-FALL', 'Principles of financial accounting.', 35, 3, 1, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('BIO101', 'Introduction to Biology', 'BIO101-FALL', 'Fundamentals of biology, including cell biology and genetics.', 40, 5, 0, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('CHEM101', 'General Chemistry', 'CHEM101-FALL', 'Introduction to general chemistry principles and applications.', 50, 6, 0, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW()),
('HIST101', 'World History', 'HIST101-FALL', 'Overview of global history from ancient times to the present.', 25, 7, 0, '2024-09-01 08:00:00', '2024-12-15 16:00:00', NOW(), NOW());


INSERT INTO ENROLLMENT (student_id, course_id, status, enrollment_date)
VALUES
(1, 'CS101', 1, NOW()),
(2, 'MATH201', 1, NOW()),
(3, 'CS101', 1, NOW()),
(4, 'PHIL101', 1, NOW()),
(5, 'ACC101', 1, NOW()),
(6, 'CS101', 1, NOW()),
(7, 'MATH201', 1, NOW()),
(8, 'PHIL101', 2, NOW()),
(9, 'ACC101', 2, NOW()),
(10, 'CS101', 3, NOW());


INSERT INTO EXAM (course_id, exam_name, exam_description, start_date, end_date, created_at, updated_at)
VALUES
('CS101', 'Midterm Exam', 'Covers Chapters 1-4', '2024-10-15 10:00:00', '2024-10-15 12:00:00', NOW(), NOW()),
('MATH201', 'Final Exam', 'Covers All Topics', '2024-12-10 09:00:00', '2024-12-10 12:00:00', NOW(), NOW()),
('PHIL101', 'Midterm Exam', 'Covers key philosophical concepts.', '2024-10-20 09:00:00', '2024-10-20 11:00:00', NOW(), NOW()),
('ACC101', 'Quiz 1', 'Covers financial statement basics.', '2024-09-15 14:00:00', '2024-09-15 15:00:00', NOW(), NOW());


INSERT INTO EXAM_QUESTION (exam_id, question_text, created_at, updated_at)
VALUES
(1, 'What is a variable in programming?', NOW(), NOW()),
(1, 'Explain the concept of recursion.', NOW(), NOW()),
(2, 'What is the derivative of x^2?', NOW(), NOW()),
(3, 'What is epistemology?', NOW(), NOW()),
(3, 'Define utilitarianism.', NOW(), NOW()),
(4, 'What is the accounting equation?', NOW(), NOW()),
(4, 'Explain the difference between assets and liabilities.', NOW(), NOW()),
(1, 'What are data types in programming?', NOW(), NOW()),
(1, 'Explain the difference between a loop and recursion.', NOW(), NOW()),
(2, 'Integrate x^3 with respect to x.', NOW(), NOW()),
(2, 'Find the limit of (x^2 - 1)/(x - 1) as x approaches 1.', NOW(), NOW()),
(3, 'What is metaphysics?', NOW(), NOW()),
(3, 'Discuss the philosophy of existentialism.', NOW(), NOW()),
(4, 'What are debits and credits in accounting?', NOW(), NOW()),
(4, 'Describe the importance of financial statements.', NOW(), NOW());

INSERT INTO ANSWER (answer_text, question_id, created_at, updated_at)
VALUES
('A variable is a storage location for data.', 1, NOW(), NOW()),
('Recursion is a process where a function calls itself.', 2, NOW(), NOW()),
('The derivative of x^2 is 2x.', 3, NOW(), NOW()),
('Epistemology is the study of knowledge.', 4, NOW(), NOW()),
('Utilitarianism is an ethical theory that promotes actions that maximize happiness.', 5, NOW(), NOW()),
('The accounting equation is Assets = Liabilities + Equity.', 6, NOW(), NOW()),
('Assets are resources owned by a company, while liabilities are obligations.', 7, NOW(), NOW()),
('Data types categorize data items.', 8, NOW(), NOW()),
('Loops repeat a block of code; recursion calls itself.', 9, NOW(), NOW()),
('The integral of x^3 is (1/4)x^4 + C.', 10, NOW(), NOW()),
('The limit is 2.', 11, NOW(), NOW()),
('Metaphysics studies the nature of reality.', 12, NOW(), NOW()),
('Existentialism focuses on individual freedom and choice.', 13, NOW(), NOW()),
('Debits and credits are accounting entries.', 14, NOW(), NOW()),
('Financial statements show a company’s financial health.', 15, NOW(), NOW());


INSERT INTO STUDENT_ANSWER (student_id, question_id, answer_text, second_attempt_answer, answer_grade, second_attempt_grade, answer_stage, created_at, updated_at)
VALUES
(1, 1, 'A variable is a data container.', NULL, 'A', NULL, 1, NOW(), NOW()),
(1, 2, 'A variable is a data container.', NULL, 'A', NULL, 1, NOW(), NOW()),
(2, 3, 'The derivative is x.', 'The derivative is 2x.', 'C', 'A', 2, NOW(), NOW()),
(4, 4, 'Epistemology is the study of truth.', NULL, 'B', NULL, 1, NOW(), NOW()),
(4, 5, 'Utilitarianism focuses on happiness.', NULL, 'A', NULL, 1, NOW(), NOW()),
(5, 6, 'Assets equal Liabilities + Owners Equity.', NULL, 'A', NULL, 1, NOW(), NOW()),
(5, 7, 'Assets are things owned; liabilities are debts.', 'Assets are owned resources; liabilities are obligations.', 'C', 'B', 2, NOW(), NOW()),
(6, 8, 'Data types define data characteristics.', NULL, 'A', NULL, 1, NOW(), NOW()),
(6, 9, 'A loop iterates; recursion calls itself.', NULL, 'A', NULL, 1, NOW(), NOW()),
(3, 10, 'The integral is (1/4)x^4.', 'The integral is (1/4)x^4 + C.', 'B', 'A', 2, NOW(), NOW()),
(3, 11, 'The limit is undefined.', 'The limit is 2.', 'C', 'A', 2, NOW(), NOW()),
(2, 12, 'Metaphysics studies existence.', NULL, 'B', NULL, 1, NOW(), NOW()),
(2, 13, 'Existentialism is about free will.', NULL, 'A', NULL, 1, NOW(), NOW()),
(5, 14, 'Debits and credits balance accounts.', NULL, 'A', NULL, 1, NOW(), NOW()),
(5, 15, 'Financial statements reflect profitability.', NULL, 'A', NULL, 1, NOW(), NOW());

