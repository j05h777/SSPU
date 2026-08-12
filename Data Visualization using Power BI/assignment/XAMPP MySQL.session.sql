SELECT
    s.StudentName,
    s.Department,
    t.TeacherName,
    s.Subject,
    s.EvaluationScore
FROM Students s
JOIN Teachers t
    ON s.TeacherID = t.TeacherID;


SELECT VERSION(),@@port;
