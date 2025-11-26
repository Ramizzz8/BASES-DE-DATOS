import pymysql

conexion = pymysql.connect(
    host="localhost",
    user="josevicente",
    password="JoseVicente123$",
    database="clientes",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor

)

cursor = conexion.cursor()
cursor.execute('''
  SELECT
  nombre AS "Nombre del cliente",
  apellidos AS "Apellidos del cliente",
  edad AS "Edad del cliente"
  FROM clientes
  ORDER BY edad DESC;
''')

filas = cursor.fetchall()

for fila in filas:
  print("Nombre: ",fila['Nombre del cliente'])
  print("Apellidos: ",fila['Apellidos del cliente'])
  print("Edad: ",fila['Edad del cliente'])
  print("##################")
