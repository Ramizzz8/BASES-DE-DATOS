import pymysql
from flask import Flask, render_template, request
import json


conexion = pymysql.connect(
    host="localhost",
    user="tiendaclase",
    password="Tiendaclase123$",
    database="tiendaclase",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

app = Flask(__name__)

@app.route("/clientes")
def clientes():
	cursor = conexion.cursor() 
	cursor.execute("SELECT * FROM clientes;")  

	filas = cursor.fetchall()
	return json.dumps(filas)

@app.route("/tablas")
def tablas():
	cursor = conexion.cursor() 
	cursor.execute("SHOW TABLES;")  

	filas = cursor.fetchall()
	tablas = []
	for fila in filas:
		tablas.append(fila['Tables_in_tiendaclase'])
	return json.dumps(tablas)

if __name__ == "__main__":
	app.run(debug=True) 
    
# http://127.0.0.1:5000/clientes