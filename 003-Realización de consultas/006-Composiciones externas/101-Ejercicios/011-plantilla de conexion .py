import pymysql

conexion = pymysql.connect(
    host="localhost",
    user="composiciones",
    password="Composiciones123$",
    database="composiciones",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

cursor = conexion.cursor(dict=True)
cursor.execute('''SELECT * FROM matriculas_join;
''')

filas = cursor.fetchall()
print(filas)