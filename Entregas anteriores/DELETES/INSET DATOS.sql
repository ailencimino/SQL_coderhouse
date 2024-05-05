use libreria_guillermo;

INSERT INTO autor (ID_AUTOR, NOMBRE, NACIONALIDAD, FECHA_NACIMIENTO) VALUES
(1, 'George Orwell', 'Británica', '1903-06-25'),
(2, 'Karl Marx', 'Alemán', '1818-05-05'),
(3, 'John Stuart Mill', 'Británica', '1806-05-20'),
(4, 'Jean-Jacques Rousseau', 'Suiza', '1712-06-28'),
(5, 'Hannah Arendt', 'Alemana', '1906-10-14'),
(6, 'Friedrich Nietzsche', 'Alemán', '1844-10-15'),
(7, 'Michel Foucault', 'Francesa', '1926-10-15'),
(8, 'John Locke', 'Británica', '1632-08-29'),
(9, 'Thomas Hobbes', 'Británica', '1588-04-05'),
(10, 'Platón', 'Griega', '0427-04-01'),
(11, 'Aristóteles', 'Griega', '0384-05-01'),
(12, 'Immanuel Kant', 'Alemán', '1724-04-22'),
(13, 'Simone de Beauvoir', 'Francesa', '1908-01-09'),
(14, 'Voltaire', 'Francesa', '1694-11-21'),
(15, 'Niccolò Machiavelli', 'Italiana', '1469-05-03'),
(16, 'Max Weber', 'Alemana', '1864-04-21'),
(17, 'Alexis de Tocqueville', 'Francesa', '1805-07-29'),
(18, 'Friedrich Engels', 'Alemán', '1820-11-28'),
(19, 'Adam Smith', 'Escocesa', '1723-06-16'),
(20, 'Jürgen Habermas', 'Alemán', '1929-06-18'),
(21, 'Émile Durkheim', 'Francesa', '1858-04-15'),
(22, 'Thomas Jefferson', 'Estadounidense', '1743-04-13'),
(23, 'Noam Chomsky', 'Estadounidense', '1928-12-07'),
(24, 'Rosa Luxemburgo', 'Polaca', '1871-03-05'),
(25, 'Kwame Nkrumah', 'Ghanesa', '1909-09-21');

ALTER TABLE libro MODIFY COLUMN PRECIO DECIMAL(10, 2);

SELECT * FROM libreria_guillermo.libro;
SELECT * FROM libreria_guillermo.autor;
SELECT * FROM libreria_guillermo.cliente;

INSERT INTO cliente_libro (ID_CLIENTE, ID_LIBRO)
SELECT c.ID_CLIENTE, l.ID_LIBRO
FROM cliente c
CROSS JOIN libro l;

INSERT INTO empleados (ID_EMPLEADO, NOMBRE, APELLIDO, CARGO, FECHA_CONTRATACION, TELEFONO, CORREO) VALUES
(1, 'Juan', 'Pérez', 'Gerente de Ventas', '2023-05-10', '123456789', 'juan.perez@example.com'),
(2, 'María', 'García', 'Analista de Marketing', '2023-08-15', '987654321', 'maria.garcia@example.com'),
(3, 'Carlos', 'López', 'Especialista en Recursos Humanos', '2022-12-20', '456123789', 'carlos.lopez@example.com'),
(4, 'Laura', 'Martínez', 'Contador', '2023-02-28', '789456123', 'laura.martinez@example.com'),
(5, 'Pedro', 'Gómez', 'Desarrollador de Software', '2022-10-05', '321654987', 'pedro.gomez@example.com'),
(6, 'Ana', 'Rodríguez', 'Diseñador Gráfico', '2023-07-18', '654987321', 'ana.rodriguez@example.com'),
(7, 'Diego', 'Hernández', 'Analista de Datos', '2022-11-30', '987321654', 'diego.hernandez@example.com'),
(8, 'Sofía', 'Díaz', 'Especialista en Finanzas', '2023-04-25', '741852963', 'sofia.diaz@example.com'),
(9, 'Javier', 'Gutiérrez', 'Ejecutivo de Ventas', '2022-09-12', '852963741', 'javier.gutierrez@example.com'),
(10, 'Elena', 'Sánchez', 'Gerente de Marketing', '2023-03-15', '963741852', 'elena.sanchez@example.com'),
(11, 'Andrés', 'Fernández', 'Analista de Sistemas', '2022-06-20', '159263748', 'andres.fernandez@example.com'),
(12, 'Luis', 'López', 'Consultor de Negocios', '2023-01-18', '357951846', 'luis.lopez@example.com'),
(13, 'Carmen', 'Martín', 'Especialista en Recursos Humanos', '2022-08-28', '258147369', 'carmen.martin@example.com'),
(14, 'Rosa', 'González', 'Analista de Marketing Digital', '2023-06-10', '654789123', 'rosa.gonzalez@example.com'),
(15, 'Mario', 'Ruiz', 'Gerente de Proyectos', '2022-11-05', '369852741', 'mario.ruiz@example.com'),
(16, 'Natalia', 'Hernández', 'Analista de Datos', '2023-04-30', '963258741', 'natalia.hernandez@example.com'),
(17, 'Alejandro', 'Díaz', 'Desarrollador de Software', '2022-10-15', '147258369', 'alejandro.diaz@example.com'),
(18, 'Paula', 'Sánchez', 'Ejecutivo de Ventas', '2023-03-20', '258369147', 'paula.sanchez@example.com'),
(19, 'Ricardo', 'Gómez', 'Analista de Marketing', '2022-09-25', '369147258', 'ricardo.gomez@example.com'),
(20, 'Silvia', 'Torres', 'Gerente de Recursos Humanos', '2023-02-18', '741963852', 'silvia.torres@example.com'),
(21, 'Gabriel', 'Alvarez', 'Analista de Sistemas', '2022-07-10', '852741963', 'gabriel.alvarez@example.com'),
(22, 'Verónica', 'Morales', 'Contador', '2023-05-28', '963852741', 'veronica.morales@example.com'),
(23, 'Hugo', 'Fernández', 'Especialista en Finanzas', '2022-12-10', '123789456', 'hugo.fernandez@example.com'),
(24, 'Valeria', 'García', 'Analista de Marketing Digital', '2023-08-05', '147369852', 'valeria.garcia@example.com'),
(25, 'Roberto', 'Martínez', 'Consultor de Negocios', '2022-11-22', '369852147', 'roberto.martinez@example.com');

INSERT INTO proveedor (ID_PROVEEDOR, NOMBRE, DIRECCION, TELEFONO, ID_EDITORIAL) VALUES
(1, 'Proveedor A', 'Calle 123, Ciudad A', '123-456-789', 1),
(2, 'Proveedor B', 'Avenida Principal, Ciudad B', '987-654-321', 2),
(3, 'Proveedor C', 'Calle Principal, Ciudad C', '456-789-123', 3),
(4, 'Proveedor D', 'Avenida Central, Ciudad D', '789-123-456', 4),
(5, 'Proveedor E', 'Avenida Norte, Ciudad E', '321-654-987', 5),
(6, 'Proveedor F', 'Calle Sur, Ciudad F', '654-987-321', 1),
(7, 'Proveedor G', 'Avenida Oeste, Ciudad G', '987-321-654', 2),
(8, 'Proveedor H', 'Calle Este, Ciudad H', '741-852-963', 3),
(9, 'Proveedor I', 'Avenida Este, Ciudad I', '852-963-741', 4),
(10, 'Proveedor J', 'Calle Oeste, Ciudad J', '963-741-852', 5),
(11, 'Proveedor K', 'Avenida Sur, Ciudad K', '159-263-748', 1),
(12, 'Proveedor L', 'Calle Norte, Ciudad L', '357-951-846', 2),
(13, 'Proveedor M', 'Avenida Principal, Ciudad M', '258-147-369', 3),
(14, 'Proveedor N', 'Calle Principal, Ciudad N', '654-789-123', 4),
(15, 'Proveedor O', 'Avenida Central, Ciudad O', '369-852-741', 5),
(16, 'Proveedor P', 'Calle Norte, Ciudad P', '963-258-741', 1),
(17, 'Proveedor Q', 'Avenida Oeste, Ciudad Q', '147-258-369', 2),
(18, 'Proveedor R', 'Calle Este, Ciudad R', '258-369-147', 3),
(19, 'Proveedor S', 'Avenida Sur, Ciudad S', '369-147-258', 4),
(20, 'Proveedor T', 'Calle Oeste, Ciudad T', '741-963-852', 5),
(21, 'Proveedor U', 'Avenida Norte, Ciudad U', '852-741-963', 1),
(22, 'Proveedor V', 'Calle Principal, Ciudad V', '963-852-741', 2),
(23, 'Proveedor W', 'Avenida Principal, Ciudad W', '123-789-456', 3),
(24, 'Proveedor X', 'Calle 123, Ciudad X', '147-369-852', 4),
(25, 'Proveedor Y', 'Avenida Central, Ciudad Y', '369-852-147', 5);

INSERT INTO resenia (ID_RESENIA, CALIFICACION, COMENTARIO, FECHA, ID_LIBRO, ID_CLIENTE) VALUES
(1, 4, 'Me encantó este libro, definitivamente lo recomendaría a otros lectores.', '2023-05-10', 26, 1),
(2, 5, 'Una obra maestra de la literatura, no pude dejar de leerlo.', '2023-02-15', 28, 2),
(3, 3, 'Interesante, pero un poco difícil de seguir en algunos puntos.', '2022-11-30', 30, 3),
(4, 4, 'Una lectura fascinante, me sumergí completamente en la historia.', '2023-08-22', 36, 4),
(5, 5, 'Increíble libro, no puedo esperar para leer más del autor.', '2022-10-05', 35, 5),
(6, 2, 'No era lo que esperaba, me decepcionó un poco.', '2023-04-18', 46, 6),
(7, 4, 'Muy bien escrito y con personajes memorables.', '2022-12-10', 37, 7),
(8, 5, 'Definitivamente uno de mis libros favoritos de todos los tiempos.', '2023-01-05', 28, 8),
(9, 3, 'Una lectura decente, pero nada extraordinario.', '2023-07-17', 49, 9),
(10, 4, 'Me gustó mucho la trama y el desarrollo de los personajes.', '2023-03-25', 50, 10),
(11, 5, '¡Qué libro tan emocionante! No pude soltarlo hasta que lo terminé.', '2023-09-12', 41, 11),
(12, 3, 'Una historia interesante, pero el final me dejó un poco insatisfecho.', '2022-08-30', 32, 12),
(13, 4, 'Lo disfruté mucho, especialmente la forma en que está escrito.', '2023-06-05', 43, 13),
(14, 5, 'No puedo esperar para leer más del autor, este libro me dejó queriendo más.', '2022-07-20', 40, 14),
(15, 2, 'No fue lo que esperaba, me costó conectar con la historia.', '2023-11-18', 50, 15),
(16, 4, 'Una lectura interesante que me mantuvo intrigado de principio a fin.', '2023-04-02', 36, 16),
(17, 5, 'Lo amé, definitivamente lo releería en el futuro.', '2022-12-15', 47, 17),
(18, 3, 'Algunas partes fueron un poco aburridas, pero en general fue bueno.', '2023-08-08', 38, 18),
(19, 4, 'Una historia conmovedora que me hizo reflexionar sobre la vida.', '2023-02-28', 50, 19),
(20, 5, 'Absolutamente brillante, no puedo encontrar nada de qué quejarme.', '2022-11-05', 27, 20),
(21, 2, 'No me gustó mucho, la trama era predecible.', '2023-05-15', 28, 21),
(22, 4, 'Me encantó este libro, fue una experiencia de lectura emocionante.', '2023-01-30', 29, 22),
(23, 5, 'Una obra maestra que recomendaría a cualquier amante de la literatura.', '2022-09-22', 33, 23),
(24, 3, 'Una lectura decente, pero no memorable.', '2023-07-10', 28, 24),
(25, 4, 'Interesante y bien escrito, aunque un poco largo.', '2023-03-01',35, 25);

INSERT INTO venta (ID_VENTA, FECHA_VENTA, TOTAL_PRECIO, ID_CLIENTE, ID_LIBRO, ID_EMPLEADO) VALUES
(1, '2023-05-10', 50, 1, 26, 1),
(2, '2023-02-15', 60, 2, 27, 2),
(3, '2022-11-30', 45, 3, 28, 3),
(4, '2023-08-22', 55, 4, 29, 4),
(5, '2022-10-05', 65, 5, 30, 5),
(6, '2023-04-18', 40, 6, 31, 6),
(7, '2022-12-10', 70, 7, 32, 7),
(8, '2023-01-05', 30, 8, 33, 8),
(9, '2023-07-17', 25, 9, 34, 9),
(10, '2023-03-25', 35, 10, 35, 10),
(11, '2023-09-12', 20, 11, 36, 11),
(12, '2022-08-30', 40, 12, 37, 12),
(13, '2023-06-05', 55, 13, 38, 13),
(14, '2022-07-20', 45, 14, 39, 14),
(15, '2023-11-18', 30, 15, 40, 15),
(16, '2023-04-02', 70, 16, 41, 16),
(17, '2022-12-15', 35, 17, 42, 17),
(18, '2023-08-08', 25, 18, 43, 18),
(19, '2023-02-28', 50, 19, 44, 19),
(20, '2022-11-05', 60, 20, 45, 20),
(21, '2023-05-15', 45, 21, 46, 21),
(22, '2023-01-30', 55, 22, 47, 22),
(23, '2022-09-22', 35, 23, 48, 23),
(24, '2023-07-10', 40, 24, 49, 24),
(25, '2023-03-01', 65, 25, 50, 25);


INSERT INTO libro_autor (ID_LIBRO, ID_AUTOR)
SELECT l.ID_LIBRO, a.ID_AUTOR
FROM libro l
CROSS JOIN autor a;
