-- 1. How can I retrieve the final grades and GPAs of all students along with their interested domains?
SELECT 
    p.StudentID, 
    p.G3 AS FinalGrade, 
    c.GPA, 
    c.InterestedDomain
FROM studentproject.studentpor p
JOIN studentproject.cs_students c
ON p.StudentID = c.StudentID;

-- 2. Who are the students with a GPA greater than 3.5, and what are their final grades?
WITH HighGPA AS (
    SELECT 
        t2.StudentID, 
        t2.GPA, 
        t1.G3 AS FinalGrade
    FROM studentproject.studentpor t1
    JOIN studentproject.cs_students t2
    ON t1.StudentID = t2.StudentID
    WHERE t2.GPA > 3.5
)
SELECT 
    StudentID, 
    GPA, 
    FinalGrade
FROM HighGPA
order by GPA DESC;

-- 3. What is the alignment between students' Python proficiency and their academic performance?
SELECT 
    t1.StudentID, 
    t1.G3 AS FinalGrade, 
    t2.Python, 
    CASE 
        WHEN t1.G3 >= 12 AND t2.Python = 'Strong' THEN 'Aligned'
        WHEN t1.G3 < 12 AND t2.Python != 'Strong' THEN 'Needs Improvement'
        ELSE 'Partially Aligned'
    END AS PerformanceAlignment
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID;

-- 4. Which students are interested in Machine Learning, and what are their grades and technical skills?
SELECT 
    t1.StudentID, 
    t1.G3 AS FinalGrade, 
    t2.GPA, 
    t2.Python, 
    t2.SQL_SUB, 
    t2.Java
FROM studentproject.studentpor  t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t2.InterestedDomain = 'Machine Learning';

-- 5. What is the future career preference of students with high grades (G3 >= 14) and a GPA above 3.7?
SELECT 
    t1.StudentID, 
    t1.G3 AS FinalGrade, 
    t2.GPA, 
    t2.FutureCareer
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.G3 >= 14 AND t2.GPA > 3.7;

-- 6. How many students live in urban areas and are studying Computer Science?
SELECT 
    COUNT(t1.StudentID) AS UrbanComputerScienceStudents
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.address = 'U' AND t2.Major = 'Computer Science';

-- 7. What is the average GPA and final grade for students who have "Strong" SQL proficiency?
SELECT 
    AVG(t2.GPA) AS AvgGPA, 
    AVG(t1.G3) AS AvgFinalGrade
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t2.SQL_SUB = 'Strong';

-- 8. What are the future career aspirations of students whose mothers work "at home" and who have achieved a final grade above 12?
SELECT 
   t1.Mjob,t1.G3,t2.FutureCareer
    
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.Mjob = 'at_home' AND t1.G3>12;

-- 9. Which students with "Strong" Python skills have fathers working as teachers and achieved a final grade above 13?
SELECT 
    t1.Fjob, 
    t1.G3 AS FinalGrade, 
    t2.Python, 
    t2.FutureCareer
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.Fjob = 'teacher' AND t1.G3 > 13 AND t2.Python = 'Strong';

-- 10. What is the average GPA of students who participate in extracurricular activities and have a final grade greater than 10?
WITH ActiveStudents AS (
    SELECT 
        t1.StudentID, 
        t1.G3 AS FinalGrade, 
        t2.GPA
    FROM studentproject.studentpor t1
    JOIN studentproject.cs_students t2
    ON t1.StudentID = t2.StudentID
    WHERE t1.activities = 'yes' AND t1.G3 > 10
)
SELECT 
    AVG(GPA) AS AverageGPA
FROM ActiveStudents;

-- 11. What are the technical skills of students who live in urban areas and are interested in Artificial Intelligence?
SELECT 
    t1.StudentID, 
    t1.address, 
    t2.InterestedDomain, 
    t2.Python, 
    t2.SQL_SUB, 
    t2.Java
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.address = 'U' AND t2.InterestedDomain = 'Artificial Intelligence';

-- 12. Which students with strong Java skills have a family relationship score greater than 4, and what are their GPAs?
SELECT 
    t1.StudentID, 
    t1.famrel AS FamilyRelationScore, 
    t2.Java, 
    t2.GPA
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t2.Java = 'Strong' AND t1.famrel > 4;

-- 13. What are the future career goals and final grades of students who have no academic failures and whose primary guardian is their mother?
SELECT 
    t1.StudentID, 
    t1.guardian, 
    t1.failures, 
    t1.G3 AS FinalGrade, 
    t2.FutureCareer
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.guardian = 'mother' AND t1.failures = 0;

-- 14. Which students with GPAs above 3.7 are not in a romantic relationship and also live in a small family?
SELECT 
    t1.StudentID, 
    t1.romantic, 
    t1.famsize, 
    t2.GPA
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.romantic = 'no' AND t1.famsize = 'LE3' AND t2.GPA > 3.7;

-- 15. How many students from small families ,study time is 3 or less than 3 and have each GPA?
with gpastudent as(
	SELECT 
		t1.StudentID, 
		t1.studytime, 
		t1.famsize, 
		t2.GPA as GPA
	FROM studentproject.studentpor t1
	JOIN studentproject.cs_students t2
	ON t1.StudentID = t2.StudentID
	WHERE t1.studytime <= 3 AND t1.famsize = 'LE3')

select count(*) as totalstudent,GPA
from gpastudent
group by gpa
order by GPA DESC;


-- 16. What is the relationship between study time and GPA for students interested in Web Development?
WITH WebDevStudents AS (
    SELECT 
        t1.StudentID, 
        t1.studytime, 
        t2.GPA
    FROM studentproject.studentpor t1
    JOIN studentproject.cs_students t2
    ON t1.StudentID = t2.StudentID
    WHERE t2.InterestedDomain = 'Web Development'
)
SELECT 
    studytime, 
    AVG(GPA) AS AverageGPA
FROM WebDevStudents
GROUP BY studytime;

-- 17. What are the GPAs and final grades of students who do not have internet access at home but are pursuing careers in Data Science?
SELECT 
    t1.StudentID, 
    t1.internet, 
    t1.G3 AS FinalGrade, 
    t2.GPA, 
    t2.FutureCareer
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.internet = 'no' AND t2.FutureCareer = 'Data Scientist';

-- 18. What is the average GPA of students grouped by family size and romantic relationship status?
SELECT 
    t1.famsize, 
    t1.romantic, 
    AVG(t2.GPA) AS AvgGPA
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
GROUP BY t1.famsize, t1.romantic
ORDER BY AvgGPA DESC;


-- 19. Who are the top-performing students (highest GPA) in small families who are not in romantic relationships?
WITH RankedStudents AS (
    SELECT 
        t1.StudentID, 
        t1.famsize, 
        t1.romantic, 
        t2.GPA, 
        RANK() OVER (PARTITION BY t1.famsize, t1.romantic ORDER BY t2.GPA DESC) as rankofstudent 
    FROM studentproject.studentpor t1
    JOIN studentproject.cs_students t2
    ON t1.StudentID = t2.StudentID
    WHERE t1.famsize = 'LE3' AND t1.romantic = 'no'
)
SELECT 
    StudentID, 
    famsize, 
    romantic, 
    GPA,
    rankofstudent
FROM RankedStudents
WHERE rankofstudent = 1;

-- 20. What is the GPA distribution of students not in romantic relationships, grouped by their mother’s education level?
SELECT 
    t1.Medu AS MothersEducation, 
    COUNT(t2.GPA) AS StudentCount, 
    AVG(t2.GPA) AS AvgGPA
FROM studentproject.studentpor t1
JOIN studentproject.cs_students t2
ON t1.StudentID = t2.StudentID
WHERE t1.romantic = 'no'
GROUP BY t1.Medu
ORDER BY AvgGPA DESC;

-- 21. Which students in small families have the top 3 highest final grades for each GPA range?
WITH TopGrades AS (
    SELECT 
        t1.StudentID, 
        t1.famsize, 
        t1.G3 AS FinalGrade, 
        t2.GPA, 
        RANK() OVER (PARTITION BY t2.GPA ORDER BY t1.G3 DESC) AS GradeRank
    FROM studentproject.studentpor t1
    JOIN studentproject.cs_students t2
    ON t1.StudentID = t2.StudentID
    WHERE t1.famsize = 'LE3'
)
SELECT 
    StudentID, 
    GPA, 
    FinalGrade, 
    GradeRank
FROM TopGrades
WHERE GradeRank <= 3
ORDER BY GPA DESC, GradeRank;






