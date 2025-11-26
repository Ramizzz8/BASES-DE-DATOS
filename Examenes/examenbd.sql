--CREAR BASE DE DATOS PORTAFOLIOEXAMEN
CREATE DATABASE portafolioexamen;
--USAR LA BASE DE DATOS
USE portafolioexamen;
--CREAMOS LA TABLA CATEGORIASPORTAFOLIO
CREATE TABLE categoriasportafolio(
  identificador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255)
);
--CREAMOS LA TABLA PIEZASPORTAFOLIO
CREATE TABLE piezasportafolio(
  identificador INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255),
  fecha VARCHAR(110),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categoriasportafolio(identificador)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
--REALIZAMOS 5 INSERCIONES EN LA TABLA CATEGORIASPORTAFOLIO
INSERT INTO categoriasportafolio (nombre)
VALUES
('Fotografía'),
('Dibujo'),
('Grabado'),
('Cerámica'),
('Arte digital');

--REALIZAMOS 5 INSERCIONES EN LA TABLA PIEZASPORTAFOLIO
INSERT INTO piezasportafolio (titulo, descripcion, fecha, id_categoria)
VALUES
('Atardecer en la playa', 'Fotografía de un atardecer en la playa', '2022-06-15', 1),
('Retrato a lápiz', 'Dibujo a lápiz de un retrato humano', '2021-11-20', 2),
('Grabado en madera', 'Grabado artístico en madera', '2020-09-10', 3),
('Vasija decorativa', 'Cerámica con diseño decorativo', '2019-05-30', 4),
('Ilustración digital', 'Arte digital de una ilustración colorida', '2023-01-25', 5);

--REALIZAR UN UPDATE EN LA TABLA PIEZASPORTAFOLIO
UPDATE piezasportafolio
SET descripcion = 'Fotografía impresionante de un atardecer en la playa'
WHERE identificador = 1;
--BORRAR UNA PIEZA DEL PORTAFOLIO
DELETE FROM piezasportafolio WHERE identificador = 1;
DELETE FROM piezasportafolio WHERE identificador = 2;
--Verifiar que las piezas han sido eliminadas
SELECT * FROM piezasportafolio;
--DESCRIBIMOS LA TABLA CATEGORIASPORTAFOLIO
DESCRIBE categoriasportafolio;
--DESCRIBIMOS LA TABLA PIEZASPORTAFOLIO
DESCRIBE piezasportafolio;
--HACEMOS UN JOIN ENTRE LAS DOS TABLAS
SELECT p.identificador, p.titulo AS pieza_titulo, p.descripcion AS pieza_descripcion, p.fecha, c.nombre AS categoria_nombre
FROM piezasportafolio p
LEFT JOIN categoriasportafolio c ON p.id_categoria = c.identificador;
--HACEMOS UN JOIN ENTRE LAS DOS TABLAS Y CREAMOS UNA VISTA
CREATE VIEW vista_piezas_categoriasportafolio AS
SELECT p.identificador, p.titulo AS pieza_titulo, p.descripcion AS pieza_descripcion, p.fecha, c.nombre AS categoria_nombre
FROM piezasportafolio p
LEFT JOIN categoriasportafolio c ON p.id_categoria = c.identificador;
--CONSULTAMOS LA VISTA
SELECT * FROM vista_piezas_categoriasportafolio;
--CREAR USUARIO CON PERMISOS PARA ACCEDER A LA BASE DE DATOS
CREATE USER
'usuarioexamen'@'localhost'
IDENTIFIED  BY 'Constraseña_Segura123!';
--Permitir acceso al usuario
GRANT USAGE ON *.* TO 'usuarioexamen'@'localhost';
--Quitarle todos los limites que tenga
ALTER USER 'usuarioexamen'@'localhost'
REQUIRE NONE
WITH MAX_QUERIES_PER_HOUR 0
MAX_CONNECTIONS_PER_HOUR 0
MAX_UPDATES_PER_HOUR 0
MAX_USER_CONNECTIONS 0;
--Dale acceso a la base de datos
GRANT ALL PRIVILEGES ON portafolioexamen.*
TO 'usuarioexamen'@'localhost';
--Aplicar los cambios de privilegios
FLUSH PRIVILEGES;


