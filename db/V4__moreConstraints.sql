DELIMITER $$

CREATE TRIGGER check_active_courses
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*)
        FROM ENROLLMENT E
        JOIN COURSE C ON E.course_id = C.course_id
        WHERE E.student_id = NEW.student_id AND C.is_active = TRUE
    ) >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A student cannot be enrolled in more than five active courses.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_course_capacity
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*)
        FROM ENROLLMENT
        WHERE course_id = NEW.course_id
    ) >= (
        SELECT capacity
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Course capacity exceeded.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_teacher_department_insert
BEFORE INSERT ON COURSE
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM DEPARTMENT
        WHERE chair_id = NEW.teacher_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher is not assigned to this department.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_teacher_department_update
BEFORE UPDATE ON COURSE
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM DEPARTMENT
        WHERE chair_id = NEW.teacher_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher is not assigned to this department.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_exam_dates_insert
BEFORE INSERT ON EXAM
FOR EACH ROW
BEGIN
    IF NEW.start_date < (
        SELECT start_date
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) OR NEW.end_date > (
        SELECT end_date
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exam dates must fall within the course dates.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_exam_dates_update
BEFORE UPDATE ON EXAM
FOR EACH ROW
BEGIN
    IF NEW.start_date < (
        SELECT start_date
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) OR NEW.end_date > (
        SELECT end_date
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exam dates must fall within the course dates.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_student_active
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    IF (
        SELECT is_active
        FROM STUDENT
        WHERE student_id = NEW.student_id
    ) = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inactive students cannot enroll in courses.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_teacher_active_insert
BEFORE INSERT ON COURSE
FOR EACH ROW
BEGIN
    IF (
        SELECT is_active
        FROM TEACHER
        WHERE teacher_id = NEW.teacher_id
    ) = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inactive teachers cannot be assigned to teach courses.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_teacher_active_update
BEFORE UPDATE ON COURSE
FOR EACH ROW
BEGIN
    IF (
        SELECT is_active
        FROM TEACHER
        WHERE teacher_id = NEW.teacher_id
    ) = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inactive teachers cannot be assigned to teach courses.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_course_active
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    IF (
        SELECT is_active
        FROM COURSE
        WHERE course_id = NEW.course_id
    ) = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot enroll in inactive courses.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_exam_submission
BEFORE INSERT ON STUDENT_ANSWER
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM ENROLLMENT E
        JOIN EXAM X ON E.course_id = X.course_id
        WHERE E.student_id = NEW.student_id AND X.exam_id = NEW.question_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student can only submit answers for their enrolled exams.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_course_overlap_insert
BEFORE INSERT ON COURSE
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM COURSE C
        WHERE C.teacher_id = NEW.teacher_id
        AND C.start_date < NEW.end_date
        AND C.end_date > NEW.start_date
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher cannot teach courses with overlapping schedules.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_course_overlap_update
BEFORE UPDATE ON COURSE
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM COURSE C
        WHERE C.teacher_id = NEW.teacher_id
        AND C.start_date < NEW.end_date
        AND C.end_date > NEW.start_date
        AND C.course_id != NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher cannot teach courses with overlapping schedules.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER deactivate_enrollments
AFTER UPDATE ON COURSE
FOR EACH ROW
BEGIN
    IF NEW.is_active = FALSE THEN
        UPDATE ENROLLMENT
        SET status = 0
        WHERE course_id = NEW.course_id;
    END IF;
END $$

DELIMITER ;

ALTER TABLE ENROLLMENT ADD CONSTRAINT unique_enrollment UNIQUE (student_id, course_id);

DELIMITER $$

CREATE TRIGGER check_course_capacity_update
BEFORE UPDATE ON COURSE
FOR EACH ROW
BEGIN
    IF NEW.capacity < (
        SELECT COUNT(*)
        FROM ENROLLMENT
        WHERE course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot reduce capacity below current number of enrolled students.';
    END IF;
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER check_teacher_as_student
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*)
        FROM COURSE
        WHERE course_id = NEW.course_id AND teacher_id = NEW.student_id
    ) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A teacher cannot be enrolled as a student in a course they are teaching.';
    END IF;
END $$

DELIMITER ;












