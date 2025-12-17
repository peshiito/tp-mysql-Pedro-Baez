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
    descripcion VARCHAR(250) NOT NULL,  -- ¡Falta esta línea!
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
INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES 
    ('Chipi', 'salchica-random', '2024-12-09', 1),
    ('Loconaso', 'PitBull', '2022-02-12', 2),
    ('Furfru', 'Legendario', '2005-07-16', 3);


--Veterinarios datos
-- CREATE TABLE veterinarios (
--     id int AUTO_INCREMENT PRIMARY KEY,
--     nombre varchar(50) not null,
--     apellido varchar(50) not null,
--     matricula varchar(20) unique not null,
--     especialidad varchar(50) not null
-- );


INSERT INTO veterinarios (nombre, apellido, matricula, especialidad)
VALUES 
    ('Lucas', 'Martinez', 123456 , "Gatologo" ),
    ('Natalia', 'Bargas', 1234567, "Perrologo"),
    ('GUGU', 'GAGA', 7654321, "Todo los animales");


--Historial clinico


-- CREATE TABLE historial_clinico (
--     id int AUTO_INCREMENT PRIMARY KEY,
--     id_mascota int not null,
--     id_veterinario int not null,
--     fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (id_mascota) REFERENCES mascotas(id),
--     FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
-- );

INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) 
VALUES 
    (1, 1, 'Control anual de vacunación'),
    (2, 1, 'Chequeo por tos persistente'),
    (3, 2, 'Cirugía de esterilización');

--Ejercicio 7

-- Ejercicio 7 – Actualizar registros 
-- Realizar las siguientes actualizaciones: 
-- 1.  Cambiar la dirección de un dueño (por ID o nombre).  
-- 2.  Actualizar la especialidad de un veterinario (por ID o matrícula).  
-- 3.  Editar la descripción de un historial clínico (por ID).


-- CREATE TABLE duenos (
-- 	id int AUTO_INCREMENT PRIMARY KEY,
--     nombre varchar(50) not null,
--     apellido varchar(50) not null,
--     telefono varchar(20) not null,
--     direccion varchar(100)

-- );

-- Update dueños

update duenos 
set direccion = "13 de diciembre 1820"
where id = 1;


-- Update veterinario


-- INSERT INTO veterinarios (nombre, apellido, matricula, especialidad)
-- VALUES 
--     ('Lucas', 'Martinez', 123456 , "Gatologo" ),
--     ('Natalia', 'Bargas', 1234567, "Perrologo"),
--     ('GUGU', 'GAGA', 7654321, "Todo los animales");

update veterinarios 
set especialidad = "gatologo"
where matricula = 7654321;

-- Update registro

-- INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) 
-- VALUES 
--     (1, 1, 'Control anual de vacunación'),
--     (2, 1, 'Chequeo por tos persistente'),
--     (3, 2, 'Cirugía de esterilización');

update historial_clinico
set descripcion = "Limpieza de pulgas"
where id = 2;

-- Ejercicio 8

delete from duenos
where id = 3;

delete from duenos
where nombre = "Pedro" and apellido = "Baez";

alter table historial_clinico drop FOREIGN KEY historial_clinico_ibfk_1;


alter table historial_clinico 
add FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE;

delete from mascotas 
where id = 1;

-- Como ver los historiales pero n se deberia ver el eliminado
select * from historial_clinico;


-- Cargo nuevos datos para que no quede vacia la base de datos
INSERT into duenos (nombre, apellido, telefono, direccion)
values ('Ana', 'Martinez', '1122334455', 'Calle Falsa 123'),
         ('Luis', 'Rodriguez', '5566778899', 'Avenida Siempre Viva 742'),
        ('Maria', 'Gonzalez', '9988776655', 'Boulevard Central 456');
        ('Carlos', 'Lopez', '4433221100', 'Camino Real 789');

INSERT into mascotas (nombre, especie, fecha_nacimiento, id_dueno)
values ('Rex', 'Perro', '2020-05-10', 4 ),
       ('Mimi', 'Gato', '2019-08-15', 5),
       ('Buddy', 'Perro', '2021-11-20', 6),
       ('Luna', 'Gato', '2018-03-25', 7);

INSERT into veterinarios (nombre, apellido, matricula, especialidad)
values ('Sofia', 'Fernandez', '112233', 'Perros'),  
       ('Diego', 'Sanchez', '445566', 'Gatos'),
       ('Elena', 'Ramirez', '778899', 'Animales Exóticos'),
       ('Javier', 'Torres', '990011', 'Aves');

INSERT into historial_clinico (id_mascota, id_veterinario, descripcion)
values (2, 1, 'Vacunación anual'),
       (3, 2, 'Chequeo general'),
       (4, 3, 'Tratamiento antipulgas'),
       (1, 4, 'Revisión postoperatoria');