CREATE VIEW personas_correos
SELECT
email.direccion,
personas.nombre,
personas.apellidos
FROM email
LEFT JOIN personas
ON email.personas = personas.Identificador;


SELECT * FROM personas_correos, --se comporta com una tabla--