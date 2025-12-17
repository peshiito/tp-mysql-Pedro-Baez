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
