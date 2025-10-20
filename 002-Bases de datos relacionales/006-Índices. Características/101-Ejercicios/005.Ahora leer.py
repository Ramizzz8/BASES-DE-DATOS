#IMPORTAMOS LIBRERIA
import sqlite3

#Nos conectamos a la base de datos
conexion = sqlite3.connect("EmpresaBD")

#Creamos un cursor
cursor = conexion.cursor()

cursor.execute('''
SELECT * FROM clientes;
''')

#Ejecutamos una sentencia

#Lanzamos la peticion
conexion.commit()

