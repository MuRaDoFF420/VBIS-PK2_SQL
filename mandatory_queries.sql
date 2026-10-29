-- VBIS Chapter 3 - Məcburi tapşırıqlar
-- SQL dialekti: PostgreSQL
-- 3.11 və 3.24-3.25: university sxemi; 3.15: bank sxemi.
-- Qeyd: Hər sorğunu uyğun verilənlər bazasında ayrıca icra edin.


-- Exercise 3.11(a)
-- Ən azı bir Comp. Sci. kursu almış tələbələrin ID və adları (təkrarsız).
SELECT DISTINCT s.ID, s.name
FROM student AS s
JOIN takes AS t ON t.ID = s.ID
JOIN course AS c ON c.course_id = t.course_id
WHERE c.dept_name = 'Comp. Sci.'
ORDER BY s.ID;


-- Exercise 3.11(b)
-- 2017-ci ildən əvvəl heç bir kurs almamış tələbələr.
SELECT s.ID, s.name
FROM student AS s
WHERE NOT EXISTS (
    SELECT 1
    FROM takes AS t
    WHERE t.ID = s.ID
      AND t.year < 2017
)
ORDER BY s.ID;


-- Exercise 3.11(c)
-- Hər departament üzrə müəllimlərin ən yüksək maaşı.
SELECT i.dept_name, MAX(i.salary) AS max_salary
FROM instructor AS i
GROUP BY i.dept_name
ORDER BY i.dept_name;


-- Exercise 3.11(d)
-- Departamentlər üzrə maksimal maaşlardan ən kiçiyi.
SELECT MIN(dm.max_salary) AS min_of_department_max_salaries
FROM (
    SELECT MAX(i.salary) AS max_salary
    FROM instructor AS i
    GROUP BY i.dept_name
) AS dm;


-- Exercise 3.15(a)
-- Brooklyn-dəki BÜTÜN filiallarda hesabı olan müştərilər.
-- İç-içə NOT EXISTS 'hər biri üçün' (universal) şərtini ifadə edir.
SELECT c.ID, c.customer_name
FROM customer AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM branch AS b
    WHERE b.branch_city = 'Brooklyn'
      AND NOT EXISTS (
          SELECT 1
          FROM depositor AS d
          JOIN account AS a ON a.account_number = d.account_number
          WHERE d.ID = c.ID
            AND a.branch_name = b.branch_name
      )
)
ORDER BY c.ID;


-- Exercise 3.15(b)
-- Bankdakı kredit məbləğlərinin ümumi cəmi.
SELECT SUM(l.amount) AS total_loan_amount
FROM loan AS l;


-- Exercise 3.15(c)
-- Aktivi Brooklyn-dəki ən azı bir filialın aktivindən böyük olan filiallar.
SELECT b.branch_name
FROM branch AS b
WHERE EXISTS (
    SELECT 1
    FROM branch AS brooklyn
    WHERE brooklyn.branch_city = 'Brooklyn'
      AND b.assets > brooklyn.assets
)
ORDER BY b.branch_name;


-- Exercise 3.24
-- Physics müəllimlərinin məsləhət verdiyi Accounting tələbələri.
SELECT s.name, s.ID
FROM student AS s
JOIN advisor AS a ON a.s_ID = s.ID
JOIN instructor AS i ON i.ID = a.i_ID
WHERE s.dept_name = 'Accounting'
  AND i.dept_name = 'Physics'
ORDER BY s.name, s.ID;


-- Exercise 3.25
-- Büdcəsi Philosophy departamentinin büdcəsindən yüksək departamentlər.
SELECT d.dept_name
FROM department AS d
WHERE d.budget > (
    SELECT p.budget
    FROM department AS p
    WHERE p.dept_name = 'Philosophy'
)
ORDER BY d.dept_name;
