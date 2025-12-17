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

DELETE FROM duenos WHERE id = 3;
DELETE FROM mascotas WHERE id = 1;
SELECT * FROM historial_clinico;