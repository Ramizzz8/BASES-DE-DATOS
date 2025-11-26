import pymysql

conexion = pymysql.connect(
    host="localhost",
    user="usuario_clientes",
    password="Clientes123$",
    database="clientes",
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

cursor = conexion.cursor()
cursor.execute('''
SELECT 
COUNT(color) AS numero,
color
FROM productos
GROUP BY color
ORDER BY color ASC;
''')

filas = cursor.fetchall()
cantidades = []
etiquetas = []
for fila in filas:
    cantidades.append(fila['numero'])
    etiquetas.append(fila['color'])
print(cantidades)
print(etiquetas)
