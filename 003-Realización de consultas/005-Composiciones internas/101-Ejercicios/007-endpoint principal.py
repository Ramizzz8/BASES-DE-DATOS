import pymysql
from flask import Flask, render_template
import json

conexion = pymysql.connect(
    host="localhost",
    user="tiendaclase",
    password="Tiendaclase123$",
    database="tiendaclase",
    cursorclass=pymysql.cursors.Cursor     # igual que mysql.connector
)

app = Flask(__name__)

@app.route("/")
def raiz():
    return render_template("index.html")

# http://127.0.0.1:5000/clientes
@app.route("/clientes")
def clientes():
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM clientes;")

    filas = cursor.fetchall()
    cursor.close()
    return json.dumps(filas)

# http://127.0.0.1:5000/tablas
@app.route("/tablas")
def tablas():
    cursor = conexion.cursor()
    cursor.execute("SHOW TABLES;")

    filas = cursor.fetchall()
    cursor.close()

    tablas = []
    for fila in filas:
        tablas.append(fila[0])
    return json.dumps(tablas)

if __name__ == "__main__":
    app.run(debug=True, use_reloader=False)
