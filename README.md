# tp-mysql-Pedro-Baez

Repositorio correspondiente a la **entrega del Trabajo Práctico de MySQL** del área **Back-End**.

---

## 📌 Descripción del trabajo práctico

El presente trabajo práctico tiene como objetivo el **diseño e implementación de una base de datos relacional** utilizando **MySQL**, aplicando los contenidos vistos en la cursada del área Back-End.

La base de datos desarrollada se denomina **Veterinaria Patitas Felices** y permite gestionar la información básica de una veterinaria, incluyendo:

- Dueños de mascotas
- Mascotas
- Veterinarios
- Historial clínico de las mascotas

Durante su desarrollo se aplicaron conceptos como **claves primarias**, **claves foráneas**, **integridad referencial** y el uso de **ON DELETE CASCADE**.

---

## 📂 Archivos SQL incluidos

Para facilitar la corrección y revisión del trabajo práctico, los scripts SQL se encuentran separados **por ejercicio** dentro del repositorio:

- 📄 **CreateBD.sql**
  Contiene la creación de la base de datos y de todas las tablas solicitadas (**Ejercicios 1 al 5**).

- 📄 **InsertData.sql**
  Incluye la carga de datos de prueba en todas las tablas (**Ejercicio 6**).

- 📄 **Update&Delete.sql**
  Contiene las sentencias de actualización y eliminación de registros, incluyendo pruebas de borrado en cascada (**Ejercicios 7 y 8**).

- 📄 **Joins.sql**
  Incluye las consultas que utilizan `JOIN` para relacionar múltiples tablas (**Ejercicios 9 y 10**).

Esta organización permite identificar fácilmente qué archivo corresponde a cada ejercicio del trabajo práctico.

---

## 🗄️ Base de datos

**Nombre:** `Veterinaria_patitas_felices`

Script de creación:

```sql
CREATE DATABASE IF NOT EXISTS Veterinaria_patitas_felices;
USE Veterinaria_patitas_felices;
```

---

## 📊 Estructura de tablas

### 🧑‍💼 Tabla: `duenos`

Almacena los datos de los dueños de las mascotas.

**Campos:**

- `id` (INT, clave primaria, AUTO_INCREMENT)
- `nombre` (VARCHAR)
- `apellido` (VARCHAR)
- `telefono` (VARCHAR)
- `direccion` (VARCHAR)

---

### 🐶 Tabla: `mascotas`

Contiene la información de las mascotas registradas.

**Campos:**

- `id` (INT, clave primaria, AUTO_INCREMENT)
- `nombre` (VARCHAR)
- `especie` (VARCHAR)
- `fecha_nacimiento` (DATE)
- `id_dueno` (INT, clave foránea)

**Relación:**

- Cada mascota está asociada a un dueño.
- Al eliminar un dueño, sus mascotas se eliminan automáticamente mediante **ON DELETE CASCADE**.

---

### 🧑‍⚕️ Tabla: `veterinarios`

Registra la información de los veterinarios.

**Campos:**

- `id` (INT, clave primaria, AUTO_INCREMENT)
- `nombre` (VARCHAR)
- `apellido` (VARCHAR)
- `matricula` (VARCHAR, UNIQUE)
- `especialidad` (VARCHAR)

---

### 📋 Tabla: `historial_clinico`

Registra las atenciones médicas realizadas a las mascotas.

**Campos:**

- `id` (INT, clave primaria, AUTO_INCREMENT)
- `id_mascota` (INT, clave foránea)
- `id_veterinario` (INT, clave foránea)
- `fecha_registro` (DATETIME, DEFAULT CURRENT_TIMESTAMP)
- `descripcion` (VARCHAR)

**Relaciones:**

- Cada registro corresponde a una mascota y a un veterinario.
- Al eliminar una mascota, su historial clínico se elimina automáticamente.

---

## 🧪 Datos de prueba

Se incluyen datos de prueba mediante sentencias **INSERT** para todas las tablas, lo que permite:

- Verificar las relaciones entre tablas
- Comprobar el funcionamiento del borrado en cascada
- Ejecutar consultas con JOIN

---

## ✏️ Operaciones implementadas

En el trabajo práctico se desarrollaron las siguientes operaciones:

- Inserción de datos (`INSERT`)
- Modificación de registros (`UPDATE`)
- Eliminación de datos (`DELETE`) con uso de CASCADE
- Consultas relacionales (`JOIN`)

---

## 🔍 Consultas realizadas

### 🔹 Mascotas y sus dueños

Consulta que muestra el nombre de la mascota, su especie y el nombre completo del dueño.

### 🔹 Historial clínico completo

Consulta que lista:

- Mascota
- Dueño
- Veterinario
- Fecha de atención
- Descripción

Ordenado por fecha de registro de forma descendente.

---

## 👤 Alumno

**Pedro Baez**
Trabajo Práctico de MySQL – Back-End

---

## ✅ Estado del trabajo

✔ Trabajo práctico finalizado y funcional
