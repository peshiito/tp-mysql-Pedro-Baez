-- Ejercicio 1
CREATE DATABASE Veterinaria_patitas_felices;

USE Veterinaria_patitas_felices;

-- Ejercicio 2
CREATE TABLE duenos (
	id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    telelfono varchar(20) not null,
    direcccion varchar(100)

);

-- Ejercicio 3
CREATE TABLE mascotas (
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null,
    especie varchar(30) not null,
    fecha_nacimiento date,
    id_dueno int, 
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
);

-- Ejercicio 4
CREATE TABLE veterinarios (
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    matricula varchar(20) unique not null,
    especialidad varchar(50) not null
);

--Ejercicio 5
CREATE TABLE historial_clinico (
    id int AUTO_INCREMENT PRIMARY KEY,
    id_mascota int not null,
    id_veterinario int not null,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id),
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
);
