-- 1. What is the average GPA of students grouped by their future career choices?
SELECT FutureCareer, AVG(GPA) AS average_gpa
FROM studentproject.cs_students
GROUP BY FutureCareer
ORDER BY average_gpa DESC;

-- 2.  How many students are interested in "Artificial Intelligence"?
SELECT COUNT(*) AS student_count
FROM studentproject.cs_students
WHERE InterestedDomain = 'Artificial Intelligence';

-- 3. List students with "Strong" Python skills, ordered by their GPA in descending order.
SELECT StudentID, Gender,Age,GPA,Python
FROM studentproject.cs_students
WHERE Python = 'Strong'
ORDER BY GPA DESC;

-- 4. Count students interested in "Data Science" and their average GPA.
SELECT COUNT(*) AS student_count, AVG(GPA) AS average_gpa
FROM studentproject.cs_students
WHERE InterestedDomain = 'Data Science';

-- 5. Identify the student with the lowest GPA.
SELECT StudentID, Gender,GPA
FROM studentproject.cs_students
ORDER BY GPA ASC
LIMIT 1;

-- 6. Count students with "Weak" Java skills.
SELECT COUNT(*) AS student_count
FROM studentproject.cs_students
WHERE Java = 'Weak';

-- 7. What is the average GPA of students grouped by their major?
SELECT Major, AVG(GPA) AS average_gpa
FROM studentproject.cs_students
GROUP BY Major;

-- 8. List students whose GPA is above 3.5 and sort by their future career.
SELECT StudentID,Gender,GPA,FutureCareer
FROM studentproject.cs_students
WHERE GPA > 3.5
ORDER BY FutureCareer;

-- 9. Use CASE to categorize students into GPA performance groups.
SELECT StudentID,GPA, 
    CASE 
        WHEN GPA >= 3.5 THEN 'High'
        WHEN GPA >= 3.0 THEN 'Medium'
        ELSE 'Low'
    END AS Performance_Group
FROM 
    studentproject.cs_students;

-- 10. Find the average GPA grouped by Python skill levels.
SELECT Python, AVG(GPA) AS average_gpa
FROM studentproject.cs_students
GROUP BY Python;

-- 11. List all students who have "Strong" SQL skills and their GPA.
SELECT 
    StudentID, 
    GPA, 
    SQL_SUB
FROM 
    studentproject.cs_students
WHERE 
    SQL_SUB = 'Strong';


-- 12. What is the most common "Interested Domain" among the students?
SELECT InterestedDomain, COUNT(*) AS domain_count
FROM studentproject.cs_students
GROUP BY InterestedDomain
ORDER BY domain_count DESC
LIMIT 1;

-- 13. Which high-achieving students (GPA > 3.5) are interested in a future career related to Machine Learning?
WITH HighAchievers AS (
    SELECT 
        StudentID, 
        GPA, 
        FutureCareer 
    FROM studentproject.cs_students
    WHERE GPA > 3.5
    )
SELECT * 
FROM HighAchievers
WHERE FutureCareer  like 'Machine Learning %';

-- 14. Find students with "Weak" Python skills who are interested in "E-commerce Website" projects.
SELECT StudentID,Python, Projects
FROM studentproject.cs_students
WHERE Python = 'Weak' AND Projects = 'E-commerce Website';

-- 15. Count how many students are interested in "Software Development" and have "Strong" SQL skills.
SELECT 
    COUNT(*) AS student_count
FROM 
    studentproject.cs_students
WHERE 
    InterestedDomain = 'Software Development' 
    AND SQL_SUB = 'Strong';

-- 16. Find students with GPA less than 3.5 who are interested in "Data Science." 
SELECT StudentID, GPA, InterestedDomain
FROM studentproject.cs_students
WHERE GPA < 3.5 AND InterestedDomain = 'Data Science';


-- 17. Find the GPA of students who are interested in "Machine Learning" but have "Weak" SQL skills.
SELECT 
    StudentID, 
    GPA, 
    SQL_SUB, 
    InterestedDomain
FROM 
    studentproject.cs_students
WHERE 
    InterestedDomain = 'Machine Learning' 
    AND SQL_SUB = 'Weak';

-- 18. List students with a GPA greater than 3.5 and who have "Average" Java skills.
SELECT StudentID, GPA, Java
FROM studentproject.cs_students
WHERE GPA > 3.5 AND Java = 'Average';

-- 19. Identify students with at least one "Strong" skill and list their skills.
SELECT 
    StudentID,Gender, Age,
    CASE 
        WHEN Python = 'Strong' THEN 'Python'
        WHEN SQL_SUB = 'Strong' THEN 'SQL'
        WHEN Java = 'Strong' THEN 'Java'
    END AS StrongSkill
FROM studentproject.cs_students;

-- 20. Find the average GPA for students grouped by gender and skill level in Python.
SELECT 
    Gender, 
    Python AS PythonSkill, 
    AVG(GPA) AS AverageGPA
FROM studentproject.cs_students
GROUP BY Gender, Python;


















 
    
    
    
    


		
    



	

    
    
        
        





















 
    
    
    
    


		
    



	

    
    
        
        
































