--Traer todos los Profesores
SELECT * FROM Profesor

--Traer todos los Alumnos
SELECT * FROM ALUMNO

--Traer todas las Asignaturas
SELECT * FROM Asignatura

--Traer todas las Secciones
SELECT * FROM Profesor

--Traer todos los Semestres
SELECT * FROM Semestre

--Traer todos los alumnos de la seccion 1ro A con sus(Asignaturas, Seccion, Profesor que impartio la materia, encargado de seccion, semestre, calificacion) en el año 2020
SELECT
	A.Alumno_ID as Alumno_ID,
	CONCAT(A.Nombre, ' ', A.Apellido) Estudiante,
	Asg.Nombre as Asignatura,
	C.Puntaje as Calificacion,
	CONCAT(P.Nombre, ' ', P.Apellido) as Maestro,
	S.Nombre Seccion,
	CONCAT(Ps.Nombre, ' ', Ps.Apellido) as Encargado,
	Sm.Abreviacion as Semestre,
	Anio 
		FROM Calificaciones C
		INNER JOIN ALUMNO A ON C.Alumno_ID = A.Alumno_ID
		INNER JOIN Asignatura Asg ON Asg.Asignatura_ID = C.Asignatura_ID
		INNER JOIN Profesor P ON P.Profesor_ID = C.Profesor_ID
		INNER JOIN Seccion S ON S.Seccion_ID = C.Seccion_ID
		INNER JOIN Semestre Sm ON Sm.Semestre_ID = C.Semestre_ID
		INNER JOIN Profesor Ps ON S.Profesor_ID = Ps.Profesor_ID
	WHERE C.Anio = 2020 and C.Semestre_ID = 1 and C.Seccion_ID = 1