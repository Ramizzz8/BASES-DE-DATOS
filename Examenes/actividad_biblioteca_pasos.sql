--BASE DE DATOS BIBLIOTECA
--ANDRES JULIAN RAMIREZ GUERRERO
CREATE DATABASE biblioteca25; --Creamos la base de datos

SHOW DATABASES; --Le pedimos que nho smuestre las bases de datos para segurarnos de que se crea correctamente

CREATE TABLE autores(      --Creamos la tabla autores
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL, --añadimos nombres
    pais VARCHAR(80)
    );

--Instertar autor para proximos pasos
INSERT INTO autores (nombre) VALUES ('Gabriel García Márquez');

DESCRIBE autores; -- Esto nos enseña la tabla autores

--TABLA LIBROS
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    precio DECIMAL(8,2) NOT NULL CHECK (precio >= 0),
    autor_id INT NOT NULL,
    autor VARCHAR(255) NOT NULL, --Esta columna se tiene que añadir posteriormente para poder añadir un libro
    FOREIGN KEY (autor_id) REFERENCES autores(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

--INSERCION LIBRO

INSERT INTO libros (titulo, isbn, precio, autor_id)
VALUES ('Cien años de soledad', '978-3-16-148410-0', 19.99, 1);


DESCRIBE libros; --Mostrar la subtabla libros

--CREAR INDICE
CREATE INDEX idx_titulo ON
libros(titulo);

--TABLA SOCIOS

CREATE TABLE socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    fecha_alta DATE NOT NULL DEFAULT (CURRENT_DATE),
    CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
);

--INSERCION SOCIOS INVALIDA
ERROR 3819 (HY000): Check constraint 'socios_chk_1' is violated.

--INSERCION SOCIOS VALIDA

INSERT INTO socios (nombre, email) VALUES ('Ana Torres', 'ana.torres@example.com');
INSERT INTO socios (nombre, email) VALUES ('Luis Gómez', 'luis.gomez@correo.org');

--Mostrar la tabla socios
DESCRIBE socios;

--CREAR TABLA PRESTAMOS

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_prestamo DATE NOT NULL DEFAULT (CURRENT_DATE),
    fecha_devolucion DATE NULL,
    CHECK (fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo),
    FOREIGN KEY (socio_id) REFERENCES socios(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (libro_id) REFERENCES libros(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);--Suele presentarse un error en el CHECK cuándo MySQL evalúa las restricciones CHECK, especialmente en versiones anteriores o configuraciones específicas.

--Crear Indice

CREATE INDEX idx_socio_libro ON prestamos(socio_id, libro_id);

-- Verificación del índice
SHOW INDEX FROM prestamos;


-- Inserción de préstamo activo (sin devolución)
INSERT INTO prestamos (socio_id, libro_id) VALUES (1, 2);

-- Inserción de préstamo devuelto (fecha_devolución >= fecha_prestamo)

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES (1, 2, '2025-10-30', '2025-10-31');

--EEVIDENCIAR PRESTAMOS
DESCRIBE prestamos;

--mostrar index de prestamos
SHOW INDEX FROM prestamos;

--PONER BASE DE DATOS EN ESTADO FUNCIONAL

--INSERTAR 3 AUTORES

INSERT INTO autores (nombre) VALUES
('Isabel Allende'),
('Gabriel García Márquez'),
('Haruki Murakami');

--INSERTAR 3 LIBROS

INSERT INTO libros (titulo, isbn, precio, autor_id) VALUES
('La casa de los espíritus', '9788401352836', 18.50, 1),
('Cien años de soledad', '9780307474728', 20.00, 2),
('Kafka en la orilla', '9788499082478', 22.00, 3);

--INSERTAR 2 SOCIOS

INSERT INTO socios (nombre, email) VALUES
('Ana Ruiz', 'ana.ruiz@example.com'),
('Luis Pérez', 'luis.perez@example.com');

--VALIDAR INSERCIONES

SELECT * FROM autores;

SELECT * FROM libros;

SELECT * FROM socios;

SELECT * FROM prestamos;


--Resumen de comprobaciones finales
SHOW TABLES;

DESCRIBE autores;

DESCRIBE libros;

DESCRIBE socios;


