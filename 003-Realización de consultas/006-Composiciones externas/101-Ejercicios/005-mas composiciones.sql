-- Seleccionamos los datos que nos interesan
-- Cruzamos matriculas con alumnos y asignaturas

SELECT 
*
FROM matriculas
LEFT JOIN asignaturas
ON matriculas.idasignatura = asignaturas.Identificador
LEFT JOIN alumnos
ON matriculas.idalumno = alumnos.Identificador;