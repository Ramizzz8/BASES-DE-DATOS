SELECT 
*
FROM matriculas
LEFT JOIN asignaturas
ON matriculas.idasignatura = asignaturas.Identificador;