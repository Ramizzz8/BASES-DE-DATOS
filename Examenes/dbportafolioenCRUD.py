import mysql.connector

# Conexión a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="portafoliaceac",
    password="portafolioceac",
    database="portafolio"
)

cursor = conexion.cursor()

def mostrar_menu():
    print("\n---#| MENÚ CRUD |#---")
    print("1. Ver piezas")
    print("2. Agregar pieza")
    print("3. Actualizar pieza")
    print("4. Eliminar pieza")
    print("5. Salir")

while True:
    mostrar_menu()
    opcion = int(input("Selecciona una opción: "))

    if opcion == "1":
        cursor.execute("SELECT * FROM pieza")
        piezas = cursor.fetchall()
        for pieza in piezas:
            print(pieza)

    elif opcion == "2":
        titulo = input("Título: ")
        descripcion = input("Descripción: ")
        imagen = input("Imagen: ")
        url = input("URL: ")
        categoria_id = input("ID de categoría: ")
        cursor.execute("""
            INSERT INTO pieza (titulo, descripcion, imagen, url, categoria_id)
            VALUES (%s, %s, %s, %s, %s)
        """, (titulo, descripcion, imagen, url, categoria_id))
        conexion.commit()
        print("✅ Pieza agregada.")

    elif opcion == "3":
        id_pieza = input("ID de la pieza a actualizar: ")
        nuevo_titulo = input("Nuevo título: ")
        cursor.execute("""
            UPDATE pieza SET titulo = %s WHERE identificador = %s
        """, (nuevo_titulo, id_pieza))
        conexion.commit()
        print("✅ Pieza actualizada.")

    elif opcion == "4":
        id_pieza = input("ID de la pieza a eliminar: ")
        cursor.execute("DELETE FROM pieza WHERE identificador = %s", (id_pieza,))
        conexion.commit()
        print("✅ Pieza eliminada.")

    elif opcion == "5":
        print("👋Saliendo del programa...")
        break

    else:
        print("❌Opción no válida. Intenta de nuevo.")

# Cierre de conexión
cursor.close()
