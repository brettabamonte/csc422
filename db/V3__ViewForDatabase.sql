--View 1
CREATE VIEW ActiveStudentsCourses AS
SELECT 
    S.student_id, 
    S.user_name, 
    S.first_name, 
    S.last_name, 
    C.course_id, 
    C.course_name
FROM 
    STUDENT S
JOIN 
    ENROLLMENT E ON S.student_id = E.student_id
JOIN 
    COURSE C ON E.course_id = C.course_id
WHERE 
    S.is_active = TRUE;

--View 2
CREATE VIEW CoursesWithTeachers AS
SELECT 
    C.course_id, 
    C.course_name, 
    T.first_name AS teacher_first_name, 
    T.last_name AS teacher_last_name
FROM 
    COURSE C
JOIN 
    TEACHER T ON C.teacher_id = T.teacher_id;

--View 3
CREATE VIEW DepartmentsWithChairs AS
SELECT 
    D.department_id, 
    D.name AS department_name, 
    T.first_name AS chair_first_name, 
    T.last_name AS chair_last_name, 
    T.email AS chair_email
FROM 
    DEPARTMENT D
JOIN 
    TEACHER T ON D.chair_id = T.teacher_id;

--View 4
CREATE VIEW CollegesWithDeans AS
SELECT 
    C.college_id, 
    C.name AS college_name, 
    T.first_name AS dean_first_name, 
    T.last_name AS dean_last_name, 
    T.email AS dean_email
FROM 
    COLLEGE C
JOIN 
    TEACHER T ON C.dean_id = T.teacher_id;

--View 5
CREATE VIEW StudentGrades AS
SELECT 
    SA.student_id, 
    E.exam_id, 
    E.exam_name, 
    SA.answer_grade, 
    SA.second_attempt_grade
FROM 
    STUDENT_ANSWER SA
JOIN 
    EXAM_QUESTION EQ ON SA.question_id = EQ.question_id
JOIN 
    EXAM E ON EQ.exam_id = E.exam_id;


--View 6
CREATE VIEW EnrollmentsPerDepartment AS
SELECT 
    D.department_id, 
    D.name AS department_name, 
    COUNT(E.enrollment_id) AS total_enrollments
FROM 
    ENROLLMENT E
JOIN 
    COURSE C ON E.course_id = C.course_id
JOIN 
    DEPARTMENT D ON C.teacher_id = D.chair_id
GROUP BY 
    D.department_id, D.name;

--View 7
CREATE VIEW ExamsPerCourse AS
SELECT 
    C.course_id, 
    C.course_name, 
    E.exam_id, 
    E.exam_name, 
    E.start_date, 
    E.end_date
FROM 
    EXAM E
JOIN 
    COURSE C ON E.course_id = C.course_id;

--View 8

CREATE VIEW TeachersWithCourses AS
SELECT 
    T.teacher_id, 
    T.first_name, 
    T.last_name, 
    C.course_id, 
    C.course_name
FROM 
    TEACHER T
JOIN 
    COURSE C ON T.teacher_id = C.teacher_id;

--View 9
CREATE VIEW StudentsWithCourses AS
SELECT 
    S.student_id, 
    S.first_name, 
    S.last_name, 
    C.course_id, 
    C.course_name
FROM 
    STUDENT S
JOIN 
    ENROLLMENT E ON S.student_id = E.student_id
JOIN 
    COURSE C ON E.course_id = C.course_id;

--View 10
CREATE VIEW StudentAnswersDetails AS
SELECT 
    SA.student_id, 
    SA.question_id, 
    SA.answer_text, 
    SA.second_attempt_answer, 
    SA.answer_grade, 
    SA.second_attempt_grade
FROM 
    STUDENT_ANSWER SA;

--View 11
CREATE VIEW StudentPassFail AS
SELECT 
    SA.student_id, 
    E.exam_id, 
    E.exam_name, 
    CASE 
        WHEN SA.answer_grade IN ('A', 'B', 'C', 'D') THEN 'Passed'
        ELSE 'Failed'
    END AS result
FROM 
    STUDENT_ANSWER SA
JOIN 
    EXAM_QUESTION EQ ON SA.question_id = EQ.question_id
JOIN 
    EXAM E ON EQ.exam_id = E.exam_id;

--View 12
CREATE VIEW EnrollmentCountPerCourse AS
SELECT 
    C.course_id, 
    C.course_name, 
    COUNT(E.enrollment_id) AS total_students
FROM 
    COURSE C
LEFT JOIN 
    ENROLLMENT E ON C.course_id = E.course_id
GROUP BY 
    C.course_id, C.course_name;

--View 13
CREATE VIEW AverageGradePerCourse AS
SELECT 
    C.course_id, 
    C.course_name, 
    AVG(CASE 
        WHEN SA.answer_grade IN ('A', 'B', 'C', 'D') THEN 
            CASE 
                WHEN SA.answer_grade = 'A' THEN 4
                WHEN SA.answer_grade = 'B' THEN 3
                WHEN SA.answer_grade = 'C' THEN 2
                WHEN SA.answer_grade = 'D' THEN 1
            END 
        ELSE 0 
    END) AS average_grade
FROM 
    COURSE C
JOIN 
    EXAM E ON C.course_id = E.course_id
JOIN 
    EXAM_QUESTION EQ ON E.exam_id = EQ.exam_id
JOIN 
    STUDENT_ANSWER SA ON EQ.question_id = SA.question_id
GROUP BY 
    C.course_id, C.course_name;

--View 14
CREATE VIEW TeachersWithAdminRoles AS
SELECT 
    T.teacher_id, 
    T.first_name, 
    T.last_name, 
    D.department_id AS chair_of_department, 
    C.college_id AS dean_of_college
FROM 
    TEACHER T
LEFT JOIN 
    DEPARTMENT D ON T.teacher_id = D.chair_id
LEFT JOIN 
    COLLEGE C ON T.teacher_id = C.dean_id
WHERE 
    D.chair_id IS NOT NULL OR C.dean_id IS NOT NULL;

--View 15
CREATE VIEW CourseCapacityAndEnrollment AS
SELECT 
    C.course_id, 
    C.course_name, 
    C.capacity, 
    COUNT(E.enrollment_id) AS current_enrollment
FROM 
    COURSE C
LEFT JOIN 
    ENROLLMENT E ON C.course_id = E.course_id
GROUP BY 
    C.course_id, C.course_name, C.capacity;

--View 16
CREATE VIEW InactiveCourses AS
SELECT 
    C.course_id, 
    C.course_name
FROM 
    COURSE C
WHERE 
    C.is_active = FALSE;

--View 17
CREATE VIEW StudentsNotLoggedIn AS
SELECT 
    S.student_id, 
    S.first_name, 
    S.last_name, 
    DATEDIFF(CURRENT_DATE, S.last_login) AS days_since_last_login
FROM 
    STUDENT S
WHERE 
    DATEDIFF(CURRENT_DATE, S.last_login) > 30;

--View 18
CREATE VIEW CollegeDepartmentCourses AS
SELECT 
    CO.college_id, 
    CO.name AS college_name, 
    D.department_id, 
    D.name AS department_name, 
    C.course_id, 
    C.course_name
FROM 
    COLLEGE CO
JOIN 
    DEPARTMENT D ON CO.college_id = D.college_id
JOIN 
    COURSE C ON D.department_id = C.teacher_id;


--View 19
CREATE VIEW QuestionsPerExam AS
SELECT 
    E.exam_id, 
    E.exam_name, 
    COUNT(EQ.question_id) AS total_questions
FROM 
    EXAM E
JOIN 
    EXAM_QUESTION EQ ON E.exam_id = EQ.exam_id
GROUP BY 
    E.exam_id, E.exam_name;


--View 20
CREATE VIEW SecondAttemptPerformance AS
SELECT 
    SA.student_id, 
    SA.question_id, 
    SA.answer_grade AS first_attempt_grade, 
    SA.second_attempt_grade, 
    CASE 
        WHEN SA.second_attempt_grade > SA.answer_grade THEN 'Improved'
        WHEN SA.second_attempt_grade = SA.answer_grade THEN 'Unchanged'
        ELSE 'Declined'
    END AS performance_change
FROM 
    STUDENT_ANSWER SA;


--View 21
CREATE VIEW CoursesStartingSoon AS
SELECT 
    C.course_id, 
    C.course_name, 
    C.start_date
FROM 
    COURSE C
WHERE 
    C.start_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY);

--View 22
CREATE VIEW StudentsCompletedCourses AS
SELECT 
    S.student_id, 
    S.first_name, 
    S.last_name
FROM 
    STUDENT S
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM COURSE C 
        LEFT JOIN ENROLLMENT E ON C.course_id = E.course_id
        WHERE E.student_id = S.student_id AND C.is_active = TRUE
    );

--View 23
CREATE VIEW OverlappingCourses AS
SELECT 
    C1.course_id AS course1_id, 
    C1.course_name AS course1_name, 
    C2.course_id AS course2_id, 
    C2.course_name AS course2_name, 
    C1.teacher_id
FROM 
    COURSE C1, COURSE C2
WHERE 
    C1.teacher_id = C2.teacher_id 
    AND C1.course_id != C2.course_id
    AND C1.start_date < C2.end_date 
    AND C2.start_date < C1.end_date;


--View 24
CREATE VIEW StudentEnrollmentHistory AS
SELECT 
    S.student_id, 
    S.first_name, 
    S.last_name, 
    C.course_id, 
    C.course_name, 
    E.enrollment_date
FROM 
    STUDENT S
JOIN 
    ENROLLMENT E ON S.student_id = E.student_id
JOIN 
    COURSE C ON E.course_id = C.course_id
ORDER BY 
    S.student_id, E.enrollment_date;

--View 25
CREATE VIEW TeacherSummary AS
SELECT 
    T.teacher_id, 
    T.first_name, 
    T.last_name, 
    COUNT(DISTINCT C.course_id) AS total_courses, 
    COUNT(DISTINCT E.exam_id) AS total_exams, 
    T.is_active
FROM 
    TEACHER T
LEFT JOIN 
    COURSE C ON T.teacher_id = C.teacher_id
LEFT JOIN 
    EXAM E ON C.course_id = E.course_id
GROUP BY 
    T.teacher_id, T.first_name, T.last_name, T.is_active;
