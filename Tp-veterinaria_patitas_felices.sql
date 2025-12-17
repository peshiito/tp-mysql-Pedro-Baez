-- Ejercicio 1
CREATE DATABASE IF NOT EXISTS Veterinaria_patitas_felices;
USE Veterinaria_patitas_felices;

-- Ejercicio 2
CREATE TABLE duenos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);

-- Ejercicio 3 (Modificado con CASCADE desde el inicio)
CREATE TABLE mascotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT, 
    CONSTRAINT fk_dueno_mascota FOREIGN KEY (id_dueno) 
        REFERENCES duenos(id) ON DELETE CASCADE
);

-- Ejercicio 4
CREATE TABLE veterinarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

-- Ejercicio 5 (Modificado con CASCADE desde el inicio)
CREATE TABLE historial_clinico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL,
    CONSTRAINT fk_mascota_historial FOREIGN KEY (id_mascota) 
        REFERENCES mascotas(id) ON DELETE CASCADE,
    CONSTRAINT fk_veterinario_historial FOREIGN KEY (id_veterinario) 
        REFERENCES veterinarios(id)
);

-- Ejercicio 6

-- Dueños datos
INSERT INTO duenos (nombre, apellido, telefono, direccion)
VALUES
('Florencia', 'Bargas', '1128947318', 'Fray Mocho 1309'),
('Tomasito', 'Gomez','112479832987', 'Bequer 1292'),
('Pedro', 'Baez', '1155648450', '13 de diciembre 1820');

-- Mascotas datos
INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES 
('Chipi', 'salchica-random', '2024-12-09', 1),
('Loconaso', 'PitBull', '2022-02-12', 2),
('Furfru', 'Legendario', '2005-07-16', 3);

-- Veterinarios datos
INSERT INTO veterinarios (nombre, apellido, matricula, especialidad)
VALUES 
('Lucas', 'Martinez', '123456', 'Gatologo'),
('Natalia', 'Bargas', '1234567', 'Perrologo'),
('GUGU', 'GAGA', '7654321', 'Todo los animales');

-- Historial clinico
INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) 
VALUES 
(1, 1, 'Control anual de vacunación'),
(2, 1, 'Chequeo por tos persistente'),
(3, 2, 'Cirugía de esterilización');

-- Ejercicio 7

-- Update dueños
UPDATE duenos 
SET direccion = '13 de diciembre 1820'
WHERE id = 1;

-- Update veterinario
UPDATE veterinarios 
SET especialidad = 'gatologo'
WHERE matricula = '7654321';

-- Update registro
UPDATE historial_clinico
SET descripcion = 'Limpieza de pulgas'
WHERE id = 2;

-- Ejercicio 8

-- Al eliminar el dueño, se eliminan sus mascotas automáticamente por el CASCADE inicial
DELETE FROM duenos WHERE id = 3;

-- Al eliminar la mascota, se elimina su historial automáticamente por el CASCADE inicial
DELETE FROM mascotas WHERE id = 1;

-- Como ver los historiales pero no se deberia ver el eliminado
SELECT * FROM historial_clinico;

-- Cargo nuevos datos para que no quede vacia la base de datos
INSERT INTO duenos (nombre, apellido, telefono, direccion)
VALUES 
('Ana', 'Martinez', '1122334455', 'Calle Falsa 123'),
('Luis', 'Rodriguez', '5566778899', 'Avenida Siempre Viva 742'),
('Maria', 'Gonzalez', '9988776655', 'Boulevard Central 456'),
('Carlos', 'Lopez', '4433221100', 'Camino Real 789');

INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES 
('Rex', 'Perro', '2020-05-10', 4),
('Mimi', 'Gato', '2019-08-15', 5),
('Buddy', 'Perro', '2021-11-20', 6),
('Luna', 'Gato', '2018-03-25', 7);

INSERT INTO veterinarios (nombre, apellido, matricula, especialidad)
VALUES 
('Sofia', 'Fernandez', '112233', 'Perros'),
('Diego', 'Sanchez', '445566', 'Gatos'),
('Elena', 'Ramirez', '778899', 'Animales Exóticos'),
('Javier', 'Torres', '990011', 'Aves');

INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion)
VALUES 
(2, 4, 'Vacunación anual'),
(3, 5, 'Chequeo general'),
(4, 6, 'Tratamiento antipulgas'),
(5, 7, 'Revisión postoperatoria');


-- Ejercicio 9

SELECT 
    m.nombre AS nombre_mascota, 
    m.especie, 
    CONCAT(d.nombre, ' ', d.apellido) AS nombre_completo_dueno
FROM mascotas m
JOIN duenos d ON m.id_dueno = d.id;