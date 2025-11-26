import pymysql

conexion = pymysql.connect(
    host="localhost",
    user="tiendaclase",
    password="Tiendaclase123$",
    database="tiendaclase",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

cursor = conexion.cursor()
cursor.execute('''SELECT * FROM clientes;
''')

filas = cursor.fetchall()
print(filas)
