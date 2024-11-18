CREATE TABLE STUDENT (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32),
    email VARCHAR(120) NOT NULL UNIQUE,
    clerk_user_id VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE TEACHER (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32),
    email VARCHAR(120) NOT NULL UNIQUE,
    clerk_user_id VARCHAR(255) NOT NULL,
    role ENUM('admin', 'teacher') DEFAULT 'teacher',
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE COLLEGE (
    college_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    dean_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (dean_id) REFERENCES TEACHER(teacher_id)
);

CREATE TABLE DEPARTMENT (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    chair_id INT NOT NULL,
    college_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (chair_id) REFERENCES TEACHER(teacher_id),
    FOREIGN KEY (college_id) REFERENCES COLLEGE(college_id)
);

CREATE TABLE COURSE (
    course_id CHAR(8) PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL UNIQUE,
    course_code CHAR(12) NOT NULL,
    course_description VARCHAR(255),
    capacity INT NOT NULL CHECK (capacity BETWEEN 0 AND 500),
    teacher_id INT NOT NULL,
    is_active TINYINT(1) DEFAULT 0,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL CHECK (end_date > start_date),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES TEACHER(teacher_id)
);

CREATE TABLE ENROLLMENT (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id CHAR(8) NOT NULL,
    status INT DEFAULT 1 CHECK (status IN (1, 2, 3)),
    enrollment_date DATETIME NOT NULL,
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

CREATE TABLE EXAM (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id CHAR(8) NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    exam_description VARCHAR(255),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL CHECK (end_date > start_date),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

CREATE TABLE EXAM_QUESTION (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_id INT NOT NULL,
    question_text VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES EXAM(exam_id)
);

CREATE TABLE ANSWER (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    answer_text VARCHAR(255) NOT NULL,
    question_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (question_id) REFERENCES EXAM_QUESTION(question_id)
);

CREATE TABLE STUDENT_ANSWER (
    student_answer_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    question_id INT NOT NULL,
    answer_text VARCHAR(255) NOT NULL,
    second_attempt_answer VARCHAR(255) DEFAULT NULL,
    answer_grade CHAR(1) NOT NULL,
    second_attempt_grade CHAR(1) DEFAULT NULL,
    answer_stage INT CHECK (answer_stage IN (1, 2)),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (question_id) REFERENCES EXAM_QUESTION(question_id)
);
