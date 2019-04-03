USE university;

--SELECT FullName FROM R1 WHERE Score = 5 AND Discipline = N'Чтение';

--SELECT FullName FROM R2
--EXCEPT
--SELECT FullName FROM R1 WHERE Discipline = N'Чтение';

--SELECT FullName FROM R1 WHERE Score = 2
--GROUP BY FullName, Score
--HAVING COUNT(FullName) > 1;

--SELECT DISTINCT FullName FROM R1 as R4 WHERE NOT EXISTS (SELECT FullName FROM R1 WHERE R4.FullName = R1.FullName AND R1.Score <> 5);

