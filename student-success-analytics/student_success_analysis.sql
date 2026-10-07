
SELECT current_database();

DROP TABLE IF EXISTS student_success_data;

CREATE TABLE student_success_data (
    marital_status TEXT,
    application_mode TEXT,
    application_order INTEGER,
    course TEXT,
    daytime_evening_attendance TEXT,
    previous_qualification TEXT,
    previous_qualification_grade NUMERIC,
    nationality INTEGER,
    mother_s_qualification INTEGER,
    father_s_qualification INTEGER,
    mother_s_occupation INTEGER,
    father_s_occupation INTEGER,
    admission_grade NUMERIC,
    displaced TEXT,
    educational_special_needs TEXT,
    debtor TEXT,
    tuition_fees_up_to_date TEXT,
    gender TEXT,
    scholarship_holder TEXT,
    age_at_enrollment INTEGER,
    international TEXT,
    curricular_units_1st_sem_credited INTEGER,
    curricular_units_1st_sem_enrolled INTEGER,
    curricular_units_1st_sem_evaluations INTEGER,
    curricular_units_1st_sem_approved INTEGER,
    curricular_units_1st_sem_grade NUMERIC,
    curricular_units_1st_sem_without_evaluations INTEGER,
    curricular_units_2nd_sem_credited INTEGER,
    curricular_units_2nd_sem_enrolled INTEGER,
    curricular_units_2nd_sem_evaluations INTEGER,
    curricular_units_2nd_sem_approved INTEGER,
    curricular_units_2nd_sem_grade NUMERIC,
    curricular_units_2nd_sem_without_evaluations INTEGER,
    unemployment_rate NUMERIC,
    inflation_rate NUMERIC,
    gdp NUMERIC,
    target TEXT,
    age_group TEXT,
    first_sem_approval_rate NUMERIC,
    second_sem_approval_rate NUMERIC,
    dropout_flag INTEGER,
    graduate_flag INTEGER
);

SELECT COUNT(*)
FROM information_schema.columns
WHERE table_name = 'student_success_data';

SELECT COUNT(*)
FROM student_success_data;

-- 1. Overall Student Outcomes
SELECT
    target,
    COUNT(*) AS student_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM student_success_data
GROUP BY target
ORDER BY student_count DESC;

-- 2. Dropout Rate by Tuition Fee Status
SELECT
    tuition_fees_up_to_date,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY tuition_fees_up_to_date
ORDER BY dropout_rate DESC;

-- 3. Dropout Rate by Debtor Status
SELECT
    debtor,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY debtor
ORDER BY dropout_rate DESC;

-- 4. Dropout Rate by Scholarship Status
SELECT
    scholarship_holder,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY scholarship_holder
ORDER BY dropout_rate DESC;

-- 5. Dropout Rate by Age Group
SELECT
    age_group,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY age_group
ORDER BY dropout_rate DESC;

-- 6. Average Semester Approval Rates by Student Outcome
SELECT
    target,
    COUNT(*) AS total_students,
    ROUND(AVG(first_sem_approval_rate) * 100.0, 2) AS first_sem_approval_pct,
    ROUND(AVG(second_sem_approval_rate) * 100.0, 2) AS second_sem_approval_pct
FROM student_success_data
GROUP BY target
ORDER BY first_sem_approval_pct DESC;

-- 7. Dropout Rate by Course
SELECT
    course,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY course
ORDER BY dropout_rate DESC;

-- 8. Course Dropout Rates - Minimum 100 Students
SELECT
    course,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY course
HAVING COUNT(*) >= 100
ORDER BY dropout_rate DESC;

-- 9. Dropout Rate by Debtor and Tuition Status
SELECT
    debtor,
    tuition_fees_up_to_date,
    COUNT(*) AS total_students,
    SUM(dropout_flag) AS dropout_students,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY debtor, tuition_fees_up_to_date
ORDER BY dropout_rate DESC;

-- 10. Academic Performance by Tuition Status
SELECT
    tuition_fees_up_to_date,
    COUNT(*) AS total_students,
    ROUND(AVG(first_sem_approval_rate) * 100.0, 2) AS first_sem_approval_pct,
    ROUND(AVG(second_sem_approval_rate) * 100.0, 2) AS second_sem_approval_pct,
    ROUND(AVG(dropout_flag) * 100.0, 2) AS dropout_rate
FROM student_success_data
GROUP BY tuition_fees_up_to_date
ORDER BY dropout_rate DESC;