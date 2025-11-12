--BASE DE DATOS SIMULACRO
--ANDRES RAMIREZ

--CREAR BASE DE DATOS PORTAFOLIO
CREATE DATABASE portafolio;

--USAR LA BASE DE DATOS
USE portafolio;

--CREAMOS LA TABLA CATEGORIA
CREATE TABLE categoria(
  identificador INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255)
);
--Insertamos datos en la tabla categoria
INSERT INTO categoria (titulo, descripcion)
VALUES
('Escultura', 'Obras tridimensionales'),
('Pintura', 'Obras sobre lienzo');
--DESCRIBIMOS LA TABLA CATEGORIA
DESCRIBE categoria;
```
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(100) | NO   |     | NULL    |                |
| descripcion   | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

```
--CREAMOS LA TABLA PIEZA
CREATE TABLE pieza(
  identificador INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  descripcion VARCHAR(255),
  imagen VARCHAR(255),
  url VARCHAR(255),
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES categoria(identificador)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
--INSERTAMOS DATOS EN LA TABLA PIEZA

INSERT INTO pieza (titulo, descripcion, imagen, url, categoria_id)
VALUES
('Cabeza de mármol', 'Escultura clásica', 'imagen1.jpg', 'url1.com', 1),
('Paisaje al óleo', 'Pintura de paisaje', 'imagen2.jpg', 'url2.com', 2);
--DESCRIBIMOS LA TABLA PIEZA
DESCRIBE pieza;
```
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| titulo        | varchar(200) | NO   |     | NULL    |                |
| descripcion   | varchar(255) | YES  |     | NULL    |                |
| imagen        | varchar(255) | YES  |     | NULL    |                |
| url           | varchar(255) | YES  |     | NULL    |                |
| categoria_id  | int          | YES  | MUL | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

```

--HACEMOS UN JOIN ENTRE LAS DOS TABLAS
SELECT p.identificador, p.titulo AS pieza_titulo, p.descripcion AS pieza_descripcion, p.imagen, p.url, c.titulo AS categoria_titulo, c.descripcion AS categoria_descripcion
FROM pieza p
LEFT JOIN categoria c ON p.categoria_id = c.identificador;

--CREAMOS UNA VISTA DEL JOIN
CREATE VIEW vista_piezas_categorias AS
SELECT p.identificador, p.titulo AS pieza_titulo, p.descripcion AS pieza_descripcion, p.imagen, p.url, c.titulo AS categoria_titulo, c.descripcion AS categoria_descripcion
FROM pieza p
LEFT JOIN categoria c ON p.categoria_id = c.identificador;

--CONSULTAMOS LA VISTA
SELECT * FROM vista_piezas_categorias;
```
+---------------+-------------------+--------------------+-------------+----------+------------------+------------------------+
| identificador | pieza_titulo      | pieza_descripcion  | imagen      | url      | categoria_titulo | categoria_descripcion  |
+---------------+-------------------+--------------------+-------------+----------+------------------+------------------------+
|             1 | Cabeza de mármol  | Escultura clásica  | imagen1.jpg | url1.com | Escultura        | Obras tridimensionales |
|             2 | Paisaje al óleo   | Pintura de paisaje | imagen2.jpg | url2.com | Pintura          | Obras sobre lienzo     |
+---------------+-------------------+--------------------+-------------+----------+------------------+------------------------+
```
