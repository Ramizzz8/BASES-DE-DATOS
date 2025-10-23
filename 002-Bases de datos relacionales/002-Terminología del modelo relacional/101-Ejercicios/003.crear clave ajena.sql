--paso1 cambiar tipo de columna---
ALTER TABLE emails
MODIFY COLUMN persona INT,

--Paso 2 crear foreing key--
ALTER TABLE emails
ADD CONSTRAINT fk_emails_personas
FOREING KEY(persona) REFERENCES personas (identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE emails
ADD CONSTRAINT fk_emails_personas
FOREING KEY(persona)
REFERENCES personas(identificador)
ON DELETE CASCADE
ON UPDATE CASCADE;

SHOW TABLES;