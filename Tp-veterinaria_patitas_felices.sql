-- Ejercicio 1
CREATE DATABASE Veterinaria_patitas_felices;

USE Veterinaria_patitas_felices;

-- Ejercicio 2
CREATE TABLE duenos (
	id int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    telefono varchar(20) not null,
    direccion varchar(100)

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
--Ejercicio 6


--Dueños datos
    INSERT INTO duenos (nombre, apellido, telefono, direccion)
VALUES
('Florencia', 'Bargas', '1128947318', 'Fray Mocho 1309'),
('Tomasito', 'Gomez','112479832987', 'Bequer 1292'),
('Pedro', 'Baez', '1155648450', '13 de diciembre 1820');

--Mascotas datos

    -- id int AUTO_INCREMENT PRIMARY KEY,
    -- nombre varchar(50) not null,
    -- especie varchar(30) not null,
    -- fecha_nacimiento date,
    -- id_dueno int, 
    -- FOREIGN KEY (id_dueno) REFERENCES duenos(id)
    
    insert into mascotas () 

--Veterinarios datos


--Historial clinico