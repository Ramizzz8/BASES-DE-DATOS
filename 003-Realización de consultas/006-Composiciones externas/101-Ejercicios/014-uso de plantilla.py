import pymysql
from flask import Flask, render_template


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
    cursor = conexion.cursor()
    cursor.execute('''SELECT * FROM matriculas_join;
    ''')
    filas = cursor.fetchall()
    return render_template('index.html', filas=filas)


if __name__ == '__main__':
    app.run(debug=True)
    