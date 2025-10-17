import sqlite3
conexion= sqlite3.connect("EmpresaBD")
cursor = conexion.cursor()
print("Programa agenda SQLite v0.1 Andres Ramirez")

while True:
    print("Escoge una opcion:\n1.-Crear cliente\n2.-Listar Clientes\n3.-Actualizar clientes\n4.-Eliminar clientes\n5.-SALIR")
    opcion = int(input("Selecciona una opcion: "))
    if opcion == 1:
        nombre = input("Introduce el nombre del cliente: ")
        apellidos = input("Introduce los apellidos del cliente: ")
        email = input("Introduce el email del cliente: ")
        cursor.execute("""
            INSERT INTO clientes VALUES(
                NULL, 
                '"""+nombre+"""',
                '"""+apellidos+"""',
                '"""+email+"""'
            );
            """)
        conexion.commit()
    elif opcion == 2:
        cursor.execute('''
            SELECT * FROM clientes;
        ''')
        filas = cursor.fetchall()
        for fila in filas:
            print(fila)
    
    elif opcion == 3:
        identificador = input("Introduce el identificador a actualizar: ")
        nombre = input("Introduce el nombre del cliente: ")
        apellidos = input("Introduce los apellidos del cliente: ")
        email = input("Introduce el email del cliente: ")
        cursor.execute("""
            UPDATE clientes SET 
                nombre = '"""+nombre+"""',
                apellidos = '"""+apellidos+"""',
                email = '"""+email+"""'
                WHERE identificador = """ +identificador+ """
            );
            """)
    elif opcion == 4:
        identificador = input("Introduce el identificador a eliminar: ")
        cursor.execute("""
            DELETE FROM clientes WHERE identificador = """+identificador+"""
            ;""")
    elif opcion == 5:
        print("Suerte Bro")
        exit()

        