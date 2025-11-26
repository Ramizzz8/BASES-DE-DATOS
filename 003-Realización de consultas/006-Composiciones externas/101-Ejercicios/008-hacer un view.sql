CREATE VIEW matriculas_join AS 
SELECT 
asignaturas.nombre AS 'Nombre de la asignatura',
alumnos.nombre AS 'Nombre del alumno',
alumnos.apellidos AS 'Apellidos del alumno'
FROM matriculas
LEFT JOIN asignaturas
ON matriculas.idasignatura = asignaturas.Identificador
LEFT JOIN alumnos
ON matriculas.idalumno = alumnos.Identificador;