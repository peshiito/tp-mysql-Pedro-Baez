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
(4, 4, 'Vacunación anual'),
(5, 5, 'Chequeo general'),
(6, 6, 'Tratamiento antipulgas'),
(7, 7, 'Revisión postoperatoria');

-- Ejercicio 9

SELECT 
    m.nombre AS nombre_mascota, 
    m.especie, 
    CONCAT(d.nombre, ' ', d.apellido) AS nombre_completo_dueno
FROM mascotas m
JOIN duenos d ON m.id_dueno = d.id;


-- Ejercicio 10

SELECT 
    m.nombre AS nombre_mascota,
    m.especie,
    CONCAT(d.nombre, ' ', d.apellido) AS nombre_completo_dueno,
    CONCAT(v.nombre, ' ', v.apellido) AS nombre_completo_veterinario,
    h.fecha_registro,
    h.descripcion
FROM historial_clinico h
JOIN mascotas m ON h.id_mascota = m.id
JOIN duenos d ON m.id_dueno = d.id
JOIN veterinarios v ON h.id_veterinario = v.id
ORDER BY h.fecha_registro DESC;