#IMPORTAMOS LIBRERIA
import sqlite3

#Nos conectamos a la base de datos
conexion = sqlite3.connect("EmpresaBD")

#Creamos un cursor
cursor = conexion.cursor()

nombre = input("Introduce el nombre del cliente: ")
apellidos = input("Introduce los apellidos del cliente: ")
email = input("Introduce el email del cliente: ")

#Ejecutamos una sentencia
cursor.execute("""
    INSERT INTO clientes VALUES(
    NULL, '"""+nombre+"""','"""+apellidos+"""','"""+email+"""'
    );
    """)
#Lanzamos la peticion
conexion.commit()

cursor.execute('''
    SELECT * FROM clientes;
''')

filas = cursor.fetchall()

for fila in filas:
    print(fila)
