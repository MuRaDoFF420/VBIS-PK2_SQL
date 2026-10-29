-- VBIS Chapter 3 - Əlavə tapşırıqlar
-- SQL dialekti: PostgreSQL; bütün sorğular university sxeminə əsaslanır.


-- Exercise 3.26
-- Eyni kursu ən azı üç dəfə götürmüş tələbə-kurs cütlükləri.
SELECT t.course_id, t.ID
FROM takes AS t
GROUP BY t.course_id, t.ID
HAVING COUNT(*) >= 3
ORDER BY t.course_id, t.ID;


-- Exercise 3.27
-- Ən azı üç FƏRQLİ kursun hər birini ən azı iki dəfə götürmüş tələbələr.
SELECT repeated.ID
FROM (
    SELECT t.ID, t.course_id
    FROM takes AS t
    GROUP BY t.ID, t.course_id
    HAVING COUNT(*) >= 2
) AS repeated
GROUP BY repeated.ID
HAVING COUNT(*) >= 3
ORDER BY repeated.ID;


-- Exercise 3.28
-- Öz departamentindəki bütün kursları ən azı bir dəfə tədris etmiş müəllimlər.
SELECT i.name, i.ID
FROM instructor AS i
WHERE NOT EXISTS (
    SELECT 1
    FROM course AS c
    WHERE c.dept_name = i.dept_name
      AND NOT EXISTS (
          SELECT 1
          FROM teaches AS t
          WHERE t.ID = i.ID
            AND t.course_id = c.course_id
      )
)
ORDER BY i.name, i.ID;


-- Exercise 3.31
-- Tədris etdiyi heç bir bölmədə 'A' qiyməti olmayan müəllimlər.
-- Heç kurs tədris etməmiş müəllimlər də nəticəyə daxildir.
SELECT i.ID, i.name
FROM instructor AS i
WHERE NOT EXISTS (
    SELECT 1
    FROM teaches AS th
    JOIN takes AS tk
      ON tk.course_id = th.course_id
     AND tk.sec_id = th.sec_id
     AND tk.semester = th.semester
     AND tk.year = th.year
    WHERE th.ID = i.ID
      AND tk.grade = 'A'
)
ORDER BY i.ID;


-- Exercise 3.32
-- 'A' verməyən, amma ən azı bir qeyri-NULL başqa qiyməti olan müəllimlər.
SELECT i.ID, i.name
FROM instructor AS i
WHERE NOT EXISTS (
    SELECT 1
    FROM teaches AS th
    JOIN takes AS tk
      ON tk.course_id = th.course_id
     AND tk.sec_id = th.sec_id
     AND tk.semester = th.semester
     AND tk.year = th.year
    WHERE th.ID = i.ID
      AND tk.grade = 'A'
)
AND EXISTS (
    SELECT 1
    FROM teaches AS th
    JOIN takes AS tk
      ON tk.course_id = th.course_id
     AND tk.sec_id = th.sec_id
     AND tk.semester = th.semester
     AND tk.year = th.year
    WHERE th.ID = i.ID
      AND tk.grade IS NOT NULL
      AND tk.grade <> 'A'
)
ORDER BY i.ID;


-- Exercise 3.33
-- Saat 12:00-da və ya daha gec bitən bölməsi olan Comp. Sci. kursları.
-- Rəsmi universitet nümunə DDL-ində time_slot.end_hr istifadə olunur.
SELECT DISTINCT c.course_id, c.title
FROM course AS c
JOIN section AS s ON s.course_id = c.course_id
JOIN time_slot AS ts ON ts.time_slot_id = s.time_slot_id
WHERE c.dept_name = 'Comp. Sci.'
  AND ts.end_hr >= 12
ORDER BY c.course_id;


-- Exercise 3.34
-- Hər bölmədə qeydiyyatda olan tələbələrin sayı (0-lar daxil edilmir).
SELECT t.course_id, t.sec_id, t.year, t.semester,
       COUNT(*) AS num
FROM takes AS t
GROUP BY t.course_id, t.sec_id, t.year, t.semester
ORDER BY t.course_id, t.sec_id, t.year, t.semester;


-- Exercise 3.35
-- Maksimum qeydiyyatı olan bölmə(lər): bərabərlik halları da qaytarılır.
-- LEFT JOIN sayəsində hamısı 0 olarsa, 0 olan bölmələr də müqayisədədir.
WITH section_enrollment AS (
    SELECT s.course_id, s.sec_id, s.year, s.semester,
           COUNT(t.ID) AS num
    FROM section AS s
    LEFT JOIN takes AS t
      ON t.course_id = s.course_id
     AND t.sec_id = s.sec_id
     AND t.year = s.year
     AND t.semester = s.semester
    GROUP BY s.course_id, s.sec_id, s.year, s.semester
)
SELECT se.course_id, se.sec_id, se.year, se.semester, se.num
FROM section_enrollment AS se
WHERE se.num = (
    SELECT MAX(num)
    FROM section_enrollment
)
ORDER BY se.course_id, se.sec_id, se.year, se.semester;
