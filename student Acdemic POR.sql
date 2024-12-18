SELECT * FROM studentproject.studentpor;

#1 What is the average final grade (G3) of all students?
SELECT round(avg(G3),2) as avgoffinalscore FROM studentproject.studentpor;

#2. How many students are there in each school (school)?
SELECT
school,count(*)
FROM studentproject.studentpor
group by school;

#3. What is the average study time (studytime) of students living in urban (address = 'U') vs. rural (address = 'R') areas?
SELECT
address,round(avg(studytime),2) as avg_studutime
FROM studentproject.studentpor
group by address;

#4. What is the relationship between parental education levels (Medu, Fedu) and the final grade (G3)?
SELECT Medu,Fedu,round(AVG(G3),2)AS average_final_grade 
FROM studentproject.studentpor
group by Medu,Fedu
order by average_final_grade DESC;

#5. What is the average final grade (G3) of students based on their study time?
SELECT 
    studytime,AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY studytime
ORDER BY average_final_grade DESC;

#6. How many students have internet access compared to those who don't?
SELECT internet, COUNT(*) AS student_count
FROM studentproject.studentpor
GROUP BY internet;

#7. How many students receive family support (famsup) and also participate in extracurricular activities (activities)?
SELECT famsup, activities, COUNT(*) AS student_count
FROM studentproject.studentpor
GROUP BY famsup, activities;

#8. Which address type (urban/rural) has the highest average final grade (G3)?
SELECT address, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY address;

#9. What is the distribution of alcohol consumption (Dalc) among students based on their study time?
SELECT studytime, Dalc, COUNT(*) AS student_count
FROM studentproject.studentpor
GROUP BY studytime, Dalc;

#10.How does having romantic relationships (romantic) affect students' final grades (G3)?
SELECT romantic, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY romantic;

#11.What is the average G3 score of students grouped by their health status?
SELECT health, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY health;

#12.Which guardian type (mother, father, or other) has students with the highest average G3?
SELECT guardian, AVG(G3) AS average_final_grade
FROM  studentproject.studentpor
GROUP BY guardian;

#13.What is the average final grade (G3) for students who receive school support (schoolsup)?
SELECT schoolsup, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY schoolsup;

#14.How does family size (famsize) influence students' final grades (G3)?
SELECT famsize, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY famsize;

#15.Which travel time group has the highest average G3 score?
SELECT traveltime, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY traveltime
order by traveltime;

#16.Which job type of mothers (Mjob) correlates with the highest average G3 scores?
SELECT Mjob, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY Mjob
order by average_final_grade DESC;

#17.Which reason for choosing the school (reason) results in the highest average G3 scores?
SELECT reason, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY reason
order by average_final_grade DESC;

#18.Find the average G3 scores for students grouped by the number of past class failures.
SELECT failures, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY failures;

#19.Count the number of students grouped by their weekly alcohol consumption (Walc).
SELECT Walc, COUNT(*) AS student_count
FROM studentproject.studentpor
GROUP BY Walc;

#20.How many students participate in extracurricular activities and have internet access?
SELECT activities, internet, COUNT(*) AS student_count
FROM studentproject.studentpor
GROUP BY activities, internet
ORDER BY student_count DESC;

#21.What is the average G3 score of students grouped by their free time?
SELECT freetime, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY freetime;

#22.What is the average G3 score for students who receive family support (famsup) and school support (schoolsup)?
SELECT famsup, schoolsup, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY famsup, schoolsup
ORDER BY average_final_grade DESC;

#23.What is the correlation between absences and final grades (G3)?
SELECT absences, AVG(G3) AS average_final_grade
FROM studentproject.studentpor
GROUP BY absences
order by average_final_grade DESC;

#24.What is the average G3 score of students grouped by family size and internet access?
 SELECT 
	famsize,internet,AVG(G3) AS avg_final_grade
    FROM studentproject.studentpor
    GROUP BY famsize, internet
    ORDER BY  avg_final_grade DESC;  

#25. How many students have study times above average?
SELECT COUNT(*) AS student_count
FROM studentproject.studentpor
WHERE studytime > (SELECT AVG(studytime) FROM studentproject.studentpor);
 
#26. How many students have no failures but consume alcohol frequently?
SELECT COUNT(*) AS student_count
FROM studentproject.studentpor
WHERE failures = 0 AND (Dalc + Walc) > 6;

#27.What is the average G3 score for students grouped by their daily alcohol consumption levels?
SELECT Dalc, AVG(G3) AS avg_final_grade
FROM studentproject.studentpor
GROUP BY Dalc;

#28.What is the total number of students with G3 greater than the average G3?
 WITH AverageG3 AS (
    SELECT AVG(G3) AS AvgG3
    FROM studentproject.studentpor
)
SELECT COUNT(*) AS TotalStudents
FROM studentproject.studentpor
WHERE G3 > (SELECT AvgG3 FROM AverageG3);

#29.How does the average G3 score vary based on parental education?
SELECT
    CASE 
        WHEN Medu + Fedu <= 2 THEN 'Low'
        WHEN Medu + Fedu BETWEEN 3 AND 6 THEN 'Medium'
        ELSE 'High'
    END AS EducationLevel,
    AVG(G3) AS AvgG3
FROM studentproject.studentpor
GROUP BY EducationLevel;

#30.Compare average G3 scores of students with the same address but different activities.
SELECT 
    s1.address AS Address,
    AVG(s1.G3) AS AvgG3_NoActivities,
    AVG(s2.G3) AS AvgG3_WithActivities
FROM studentproject.studentpor s1
JOIN studentproject.studentpor s2
    ON s1.address = s2.address AND s1.activities = 'no' AND s2.activities = 'yes'
GROUP BY s1.address;

#31.Find the most frequent study time among students who scored above the average G3.
SELECT studytime, COUNT(*) AS Frequency
FROM studentproject.studentpor
WHERE G3 > (SELECT AVG(G3) FROM studentproject.studentpor)
GROUP BY studytime
ORDER BY Frequency DESC
LIMIT 1;









 
    
    
    
    


		
    



	

    
    
        
        
























