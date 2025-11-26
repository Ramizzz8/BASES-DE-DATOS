import pymysql
from flask import Flask

conexion = pymysql.connect(
    host="localhost",
    user="composiciones",
    password="Composiciones123$",
    database="composiciones",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

app = Flask(__name__)
@app.route('/')
def index():
    cursor = conexion.cursor(dictionary=True)
    cursor.execute('''SELECT * FROM matriculas_join;
    ''')
    filas = cursor.fetchall()
    return str(filas)

if __name__ == '__main__':
    app.run(debug=True)
    