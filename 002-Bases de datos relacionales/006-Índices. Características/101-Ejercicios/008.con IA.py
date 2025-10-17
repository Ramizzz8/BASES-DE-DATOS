import sqlite3

# Conexión y cursor
conexion = sqlite3.connect("EmpresaBD")
cursor = conexion.cursor()

# Crear tabla si no existe
cursor.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    identificador INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellidos TEXT NOT NULL,
    email TEXT NOT NULL
);
""")
conexion.commit()

print("="*40)
print("📒 Programa Agenda SQLite v0.2 - Andrés Ramírez")
print("="*40)

def reasignar_identificadores():
    cursor.execute("SELECT * FROM clientes ORDER BY identificador")
    clientes = cursor.fetchall()
    cursor.execute("DELETE FROM clientes")
    for i, cliente in enumerate(clientes, start=1):
        cursor.execute("""
            INSERT INTO clientes (identificador, nombre, apellidos, email)
            VALUES (?, ?, ?, ?)
        """, (i, cliente[1], cliente[2], cliente[3]))
    conexion.commit()

while True:
    print("\nOpciones disponibles:")
    print("1️⃣  Crear cliente")
    print("2️⃣  Listar clientes")
    print("3️⃣  Actualizar cliente")
    print("4️⃣  Eliminar cliente")
    print("5️⃣  Salir")
    
    try:
        opcion = int(input("Selecciona una opción (1-5): "))
    except ValueError:
        print("⚠️  Por favor, introduce un número válido.")
        continue

    if opcion == 1:
        nombre = input("Nombre: ")
        apellidos = input("Apellidos: ")
        email = input("Email: ")
        cursor.execute("""
            INSERT INTO clientes (nombre, apellidos, email)
            VALUES (?, ?, ?)
        """, (nombre, apellidos, email))
        conexion.commit()
        print("✅ Cliente creado correctamente.")

    elif opcion == 2:
        cursor.execute("SELECT * FROM clientes ORDER BY identificador")
        filas = cursor.fetchall()
        print("\n📋 Lista de clientes:")
        for fila in filas:
            print(f"ID: {fila[0]} | Nombre: {fila[1]} {fila[2]} | Email: {fila[3]}")

    elif opcion == 3:
        try:
            identificador = int(input("ID del cliente a actualizar: "))
        except ValueError:
            print("⚠️  ID inválido.")
            continue
        nombre = input("Nuevo nombre: ")
        apellidos = input("Nuevos apellidos: ")
        email = input("Nuevo email: ")
        cursor.execute("""
            UPDATE clientes SET nombre = ?, apellidos = ?, email = ?
            WHERE identificador = ?
        """, (nombre, apellidos, email, identificador))
        conexion.commit()
        print("🔄 Cliente actualizado.")

    elif opcion == 4:
        try:
            identificador = int(input("ID del cliente a eliminar: "))
        except ValueError:
            print("⚠️  ID inválido.")
            continue
        cursor.execute("DELETE FROM clientes WHERE identificador = ?", (identificador,))
        conexion.commit()
        reasignar_identificadores()
        print("🗑️ Cliente eliminado y IDs reasignados.")

    elif opcion == 5:
        print("👋 ¡Hasta luego, Andrés!")
        break

    else:
        print("❌ Opción no válida. Intenta de nuevo.")