#IMPORTAMOS LIBRERIA
import sqlite3

#Nos conectamos a la base de datos
conexion = sqlite3.connect("EmpresaBD")

#Creamos un cursor
cursor = conexion.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS "clientes"(
"Identificador" INTEGER,
"Nombre" TEXT,
"Apellidos" TEXT,
"Email" TEXT,
PRIMARY KEY("Identificador" AUTOINCREMENT)
)
''')

#Ejecutamos una sentencia
cursor.execute('''
INSERT INTO clientes VALUES(
    NULL,'Daniel', 'Calve Pardo','dani@infoceac.com'
);
''')
#Lanzamos la peticion
conexion.commit()

