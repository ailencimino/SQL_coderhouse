DROP database libreria_guillermo; 
 
CREATE DATABASE libreria_guillermo;

USE libreria_guillermo;
-- CREACION DE LAS TABLAS CON LAS CORRECIONES 
CREATE TABLE AUTOR (
    ID_AUTOR INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE, 
    NOMBRE VARCHAR(50) NOT NULL DEFAULT 'Anonimo', 
    NACIONALIDAD VARCHAR(50),
    FECHA_NACIMIENTO DATE
);

CREATE TABLE EDITORIAL (
    ID_EDITORIAL INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(100),
    TELEFONO VARCHAR(100) NOT NULL DEFAULT 'OO-0000-0000',
    CORREO VARCHAR(100) NOT NULL 
);

CREATE TABLE PROVEEDOR (
    ID_PROVEEDOR INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(100),
    TELEFONO VARCHAR(100) NOT NULL DEFAULT 'OO-0000-0000',
    ID_EDITORIAL INT, 
    FOREIGN KEY (ID_EDITORIAL) REFERENCES EDITORIAL (ID_EDITORIAL) 
);

CREATE TABLE LIBRO (
    ID_LIBRO INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT, 
    TITULO VARCHAR(100) NOT NULL,
    ANO_PUBLICACION YEAR, 
    GENERO VARCHAR(100),
    PRECIO DECIMAL NOT NULL, 
    CANTIDAD_DISPONIBLE INT,
    ID_AUTOR INT, 
    FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR (ID_AUTOR), 
    ID_EDITORIAL INT, 
    FOREIGN KEY (ID_EDITORIAL) REFERENCES EDITORIAL (ID_EDITORIAL) 
);

CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT, 
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL, 
    DIRECCION VARCHAR(100),
    TELEFONO VARCHAR(100) NOT NULL DEFAULT 'OO-0000-0000',
    CORREO VARCHAR(100)
);
CREATE TABLE EMPLEADOS (
    ID_EMPLEADO INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT, 
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL, 
    CARGO VARCHAR(50) NOT NULL, 
    FECHA_CONTRATACION DATE NOT NULL, 
    TELEFONO VARCHAR(100) NOT NULL DEFAULT 'OO-0000-0000',
    CORREO VARCHAR(100)
);

CREATE TABLE VENTA (
    ID_VENTA INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT, 
    FECHA_VENTA DATE, 
    TOTAL_PRECIO DECIMAL, 
    ID_CLIENTE INT, 
    ID_LIBRO INT, 
    ID_EMPLEADO INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
    FOREIGN KEY (ID_LIBRO) REFERENCES LIBRO (ID_LIBRO),  -- Clave foránea para hacer referencia a la tabla LIBRO
    FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS (ID_EMPLEADO) -- Clave foránea para hacer referencia a la tabla EMPLEADOS
);

CREATE TABLE RESENIA (
    ID_RESENIA INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    CALIFICACION INT NOT NULL,
    COMENTARIO VARCHAR(500), 
    FECHA DATE, 
    ID_LIBRO INT, 
    ID_CLIENTE INT, 
    FOREIGN KEY (ID_LIBRO) REFERENCES LIBRO (ID_LIBRO), 
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);



-- recordar que las tablas intermedias las tengo que hacer para las relaciones de muchos a muchos 
CREATE TABLE LIBRO_AUTOR (
    ID_LIBRO INT,
    ID_AUTOR INT,
    PRIMARY KEY (ID_LIBRO, ID_AUTOR),
    FOREIGN KEY (ID_LIBRO) REFERENCES LIBRO(ID_LIBRO),
    FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR(ID_AUTOR)
);

CREATE TABLE CLIENTE_LIBRO (
    ID_CLIENTE INT,
    ID_LIBRO INT,
    PRIMARY KEY (ID_CLIENTE, ID_LIBRO),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ID_LIBRO) REFERENCES LIBRO(ID_LIBRO)
);


use libreria_guillermo;

-- INSERTAR DATOS CON LOS DATOS DE AUTORES

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
(25, 'Kwame Nkrumah', 'Ghanesa', '1909-09-21'),
(26, 'Voltaire', 'Francesa', '1694-11-21'),
(27, 'Niccolò Machiavelli', 'Italiana', '1469-05-03'),
    (28, 'Max Weber', 'Alemana', '1864-04-21'),
    (29, 'Alexis de Tocqueville', 'Francesa', '1805-07-29'),
    (30, 'Friedrich Engels', 'Alemán', '1820-11-28'),
    (31, 'Adam Smith', 'Escocesa', '1723-06-16'),
    (32, 'Jürgen Habermas', 'Alemán', '1929-06-18'),
    (33, 'Émile Durkheim', 'Francesa', '1858-04-15'),
    (34, 'Thomas Jefferson', 'Estadounidense', '1743-04-13'),
    (35, 'Noam Chomsky', 'Estadounidense', '1928-12-07'),
    (36, 'Rosa Luxemburgo', 'Polaca', '1871-03-05'),
    (37, 'Kwame Nkrumah', 'Ghanesa', '1909-09-21'),
    (38, 'Martin Luther King Jr.', 'Estadounidense', '1929-01-15'),
    (39, 'Mahatma Gandhi', 'Indio', '1869-10-02'),
    (40, 'Nelson Mandela', 'Sudafricana', '1918-07-18'),
    (41, 'Winston Churchill', 'Británica', '1874-11-30'),
    (42, 'Simone de Beauvoir', 'Francesa', '1908-01-09'),
    (43, 'Aristotle', 'Griega', '384-03-07'),
    (44, 'Plato', 'Griega', '427-04-02'),
    (45, 'Immanuel Kant', 'Alemana', '1724-04-22'),
    (46, 'Jean-Jacques Rousseau', 'Francesa', '1712-06-28'),
    (47, 'Mary Wollstonecraft', 'Británica', '1759-04-27'),
    (48, 'Sigmund Freud', 'Austriaca', '1856-05-06'),
    (49, 'Jean-Paul Sartre', 'Francesa', '1905-06-21'),
    (50, 'Michel Foucault', 'Francesa', '1926-10-15');


-- CONSULTA PARA VER SI ESTAN BIEN CARGADO 

SELECT * FROM libreria_guillermo.autor; 

-- INSERTAR DATOS DE LA EDITORIAL

INSERT INTO editorial (ID_EDITORIAL, NOMBRE, DIRECCION, TELEFONO, CORREO) VALUES
(1, 'Editorial A', 'Calle Principal 123', '123456789', 'info@editoriala.com'),
(2, 'Editorial B', 'Avenida Central 456', '987654321', 'info@editorialb.com'),
(3, 'Editorial C', 'Plaza Mayor 789', '456123789', 'info@editorialc.com'),
(4, 'Editorial D', 'Paseo de la Reforma 321', '789456123', 'info@editoriald.com'),
(5, 'Editorial E', 'Calle de la Estrella 567', '321654987', 'info@editoriale.com'),
(6, 'Editorial F', 'Avenida de la Libertad 890', '654987321', 'info@editorialf.com'),
(7, 'Editorial G', 'Calle del Sol 234', '987321654', 'info@editorialg.com'),
(8, 'Editorial H', 'Paseo del Prado 678', '741852963', 'info@editorialh.com'),
(9, 'Editorial I', 'Calle de la Luna 901', '852963741', 'info@editoriali.com'),
(10, 'Editorial J', 'Avenida de los Ángeles 234', '963741852', 'info@editorialj.com'),
(11, 'Editorial K', 'Calle de la Rosa 123', '456789123', 'info@editorialk.com'),
(12, 'Editorial L', 'Avenida del Bosque 456', '789123456', 'info@editoriall.com'),
(13, 'Editorial M', 'Calle de la Paz 789', '123456789', 'info@editorialm.com'),
(14, 'Editorial N', 'Avenida de la Victoria 321', '654987321', 'info@editorialn.com'),
(15, 'Editorial O', 'Calle de la Esperanza 567', '987321654', 'info@editorialo.com'),
(16, 'Editorial P', 'Avenida del Amor 890', '741852963', 'info@editorialp.com'),
(17, 'Editorial Q', 'Calle de la Alegría 234', '852963741', 'info@editorialq.com'),
(18, 'Editorial R', 'Avenida de la Paz 678', '963741852', 'info@editorialr.com'),
(19, 'Editorial S', 'Calle del Sol 901', '123456789', 'info@editorials.com'),
(20, 'Editorial T', 'Avenida de la Luna 234', '456789123', 'info@editorialt.com'),
(21, 'Editorial U', 'Calle del Mar 456', '789123456', 'info@editorialu.com'),
(22, 'Editorial V', 'Avenida del Río 789', '123456789', 'info@editorialv.com'),
(23, 'Editorial W', 'Calle del Bosque 321', '654987321', 'info@editorialw.com'),
(24, 'Editorial X', 'Avenida de la Montaña 567', '987321654', 'info@editorialx.com'),
(25, 'Editorial Y', 'Calle de la Playa 890', '741852963', 'info@editorialy.com');


-- INSERTAR DATSO DE CLIENTE

INSERT INTO cliente (ID_CLIENTE, NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO)
VALUES
    (1, 'Juan', 'Pérez', 'Calle Principal 123', '123456789', 'juan.perez@example.com'),
    (2, 'María', 'García', 'Avenida Central 456', '987654321', 'maria.garcia@example.com'),
    (3, 'Carlos', 'López', 'Plaza Mayor 789', '456123789', 'carlos.lopez@example.com'),
    (4, 'Laura', 'Martínez', 'Paseo de la Reforma 321', '789456123', 'laura.martinez@example.com'),
    (5, 'Pedro', 'Gómez', 'Calle de la Estrella 567', '321654987', 'pedro.gomez@example.com'),
    (6, 'Ana', 'Rodríguez', 'Avenida de la Libertad 890', '654987321', 'ana.rodriguez@example.com'),
    (7, 'Diego', 'Hernández', 'Calle del Sol 234', '987321654', 'diego.hernandez@example.com'),
    (8, 'Sofía', 'Díaz', 'Paseo del Prado 678', '741852963', 'sofia.diaz@example.com'),
    (9, 'Javier', 'Gutiérrez', 'Calle de la Luna 901', '852963741', 'javier.gutierrez@example.com'),
    (10, 'Elena', 'Sánchez', 'Avenida de los Ángeles 234', '963741852', 'elena.sanchez@example.com'),
    (11, 'Pablo', 'Fernández', 'Calle de la Rosa 123', '456789123', 'pablo.fernandez@example.com'),
    (12, 'Isabel', 'López', 'Avenida del Bosque 456', '789123456', 'isabel.lopez@example.com'),
    (13, 'Alejandro', 'Martínez', 'Calle de la Paz 789', '123456789', 'alejandro.martinez@example.com'),
    (14, 'Lucía', 'García', 'Avenida de la Victoria 321', '654987321', 'lucia.garcia@example.com'),
    (15, 'Miguel', 'Pérez', 'Calle de la Esperanza 567', '987321654', 'miguel.perez@example.com'),
    (16, 'Carmen', 'Rodríguez', 'Avenida del Amor 890', '741852963', 'carmen.rodriguez@example.com'),
    (17, 'Manuel', 'Hernández', 'Calle de la Alegría 234', '852963741', 'manuel.hernandez@example.com'),
    (18, 'Natalia', 'Díaz', 'Avenida de la Paz 678', '963741852', 'natalia.diaz@example.com'),
    (19, 'Raúl', 'Gómez', 'Calle del Sol 901', '123456789', 'raul.gomez@example.com'),
    (20, 'Sara', 'Fernández', 'Avenida de la Luna 234', '456789123', 'sara.fernandez@example.com'),
    (21, 'Daniel', 'López', 'Calle del Mar 456', '789123456', 'daniel.lopez@example.com'),
    (22, 'Marina', 'Martínez', 'Avenida del Río 789', '123456789', 'marina.martinez@example.com'),
    (23, 'Juan', 'García', 'Calle del Bosque 321', '654987321', 'juan.garcia@example.com'),
    (24, 'Laura', 'Pérez', 'Avenida de la Montaña 567', '987321654', 'laura.perez@example.com'),
    (25, 'Carlos', 'Rodríguez', 'Calle de la Playa 890', '741852963', 'carlos.rodriguez@example.com'),
    (26, 'Carlos', 'Rodríguez', 'Calle de la Playa 890', '741852963', 'carlos.rodriguez@example.com'),
    (27, 'Ana', 'González', 'Avenida del Parque 456', '987654321', 'ana.gonzalez@example.com'),
    (28, 'Javier', 'Martínez', 'Calle de la Luna 123', '654321987', 'javier.martinez@example.com'),
    (29, 'Laura', 'Hernández', 'Paseo de la Montaña 789', '321987654', 'laura.hernandez@example.com'),
    (30, 'Diego', 'Díaz', 'Avenida del Sol 234', '789456123', 'diego.diaz@example.com'),
    (31, 'Sofía', 'Pérez', 'Calle del Bosque 567', '456123789', 'sofia.perez@example.com'),
    (32, 'Manuel', 'Gómez', 'Plaza Mayor 901', '123789456', 'manuel.gomez@example.com'),
    (33, 'Natalia', 'Fernández', 'Calle de la Rosa 321', '852963741', 'natalia.fernandez@example.com'),
    (34, 'Elena', 'Sánchez', 'Avenida de la Libertad 678', '369258147', 'elena.sanchez@example.com'),
    (35, 'Pablo', 'López', 'Paseo de la Reforma 432', '147258369', 'pablo.lopez@example.com');
    
    INSERT INTO LIBRO (ID_LIBRO, TITULO, ANO_PUBLICACION, GENERO, PRECIO, CANTIDAD_DISPONIBLE, ID_AUTOR, ID_EDITORIAL)
VALUES
    (26, 'La sociedad contemporánea: Un análisis crítico', 2015, 'Sociología', 25.00, 30, 7, 6),
    (27, 'El impacto de la globalización', 2010, 'Economía', 30.00, 25, 8, 7),
    (28, 'Política y sociedad en América Latina', 2018, 'Ciencia Política', 23.00, 40, 9, 8),
    (29, 'Los desafíos del siglo XXI', 2022, 'Sociología', 28.00, 35, 10, 9),
    (30, 'Historia de las religiones', 2005, 'Historia', 20.00, 50, 11, 10),
    (31, 'Etnografía de las comunidades indígenas', 2017, 'Antropología', 24.00, 28, 12, 11),
    (32, 'La psicología del desarrollo', 2014, 'Psicología', 26.00, 33, 13, 12),
    (33, 'Educación y sociedad: Perspectivas contemporáneas', 2019, 'Educación', 22.00, 45, 14, 13),
    (34, 'Economía ambiental', 2016, 'Ecología', 29.00, 20, 15, 14),
    (35, 'La revolución tecnológica', 2023, 'Tecnología', 26.00, 38, 16, 15),
    (36, 'Filosofía del arte', 2011, 'Filosofía', 20.00, 42, 17, 16),
    (37, 'Teoría política contemporánea', 2013, 'Ciencia Política', 24.00, 36, 18, 17),
    (38, 'El futuro del trabajo', 2020, 'Economía', 27.00, 30, 19, 18),
    (39, 'Migraciones globales', 2012, 'Sociología', 23.00, 48, 20, 19),
    (40, 'Relaciones internacionales en el siglo XXI', 2016, 'Ciencia Política', 27.00, 25, 21, 20),
    (41, 'El arte de la negociación empresarial', 2018, 'Negocios', 25.00, 32, 22, 21),
    (42, 'Neurociencia cognitiva', 2015, 'Neurociencia', 30.00, 27, 23, 22),
    (43, 'Cultura y sociedad contemporánea', 2019, 'Antropología', 26.00, 35, 24, 23),
    (44, 'Psicología del deporte', 2017, 'Psicología', 22.00, 40, 25, 24),
    (45, 'Economía del desarrollo', 2014, 'Economía', 27.00, 22, 7, 25),
    (46, 'Literatura comparada', 2018, 'Literatura', 23.00, 48, 5, 6),
    (47, 'Teoría crítica', 2021, 'Filosofía', 29.00, 29, 18, 7),
    (48, 'Historia del arte moderno', 2016, 'Arte', 25.00, 34, 9, 8),
    (49, 'Sociología del género', 2013, 'Sociología', 21.00, 37, 3, 9),
    (50, 'Antropología cultural', 2010, 'Antropología', 27.00, 31, 1, 20);

-- TUVE UN ERROR EN EL ARMADO DE LA TABLA Y TUVE QUE ALTERAR 
ALTER TABLE LIBRO MODIFY COLUMN PRECIO DECIMAL(10, 2);
    
  --  TOMAR LOS ID CLIENTE Y DE LOS LIBROS PARA TENER ESOS DATOS ALMACENADOS
SELECT * FROM libreria_guillermo.cliente; 
INSERT INTO cliente_libro (ID_CLIENTE, ID_LIBRO)
SELECT c.ID_CLIENTE, l.ID_LIBRO
FROM cliente c
CROSS JOIN libro l;

-- datos  empleadosempleado_mas_ventas_2023
INSERT INTO empleados (ID_EMPLEADO, NOMBRE, APELLIDO, CARGO, FECHA_CONTRATACION, TELEFONO, CORREO) VALUES
(1, 'Juan', 'Pérez', 'Gerente de Ventas', '2023-05-10', '123456789', 'juan.perez@example.com'),
(2, 'María', 'García', 'Analista de Marketing', '2023-08-15', '987654321', 'maria.garcia@example.com'),
(3, 'Carlos', 'López', 'Especialista en Recursos Humanos', '2022-12-20', '456123789', 'carlos.lopez@example.com'),
(4, 'Laura', 'Martínez', 'Contador', '2023-02-28', '789456123', 'laura.martinez@example.com'),
(5, 'Pedro', 'Gómez', 'Desarrollador de Software', '2022-10-05', '321654987', 'pedro.gomez@example.com') 
;

-- DATO PROVEEDORES
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
(26, '2023-06-20', 55, 1, 26, 1),
(27, '2023-04-15', 70, 2, 27, 2),
(28, '2023-01-30', 40, 3, 28, 3),
(29, '2023-09-22', 65, 4, 29, 4),
(30, '2023-08-10', 30, 5, 30, 5),
(31, '2023-05-01', 45, 6, 31, 1),
(32, '2023-11-10', 50, 7, 32, 2),
(33, '2023-06-05', 65, 8, 33, 3),
(34, '2023-02-18', 35, 9, 34, 4),
(35, '2023-09-03', 25, 10, 35, 5),
(36, '2023-08-15', 50, 11, 36, 1),
(37, '2023-04-25', 60, 12, 37, 2),
(38, '2023-01-10', 45, 13, 38, 3),
(39, '2023-10-30', 55, 14, 39, 4),
(40, '2023-07-22', 35, 15, 40, 5),
(41, '2023-03-15', 40, 16, 41, 1),
(42, '2023-11-05', 65, 17, 42, 2),
(43, '2023-09-05', 45, 18, 43, 3),
(44, '2023-05-12', 30, 19, 44, 4),
(45, '2023-02-28', 50, 20, 45, 5),
(46, '2023-12-20', 70, 21, 46, 1),
(47, '2023-08-02', 55, 22, 47, 2),
(48, '2023-04-15', 35, 23, 48, 3),
(49, '2023-01-08', 25, 24, 49, 4),
(50, '2023-10-25', 40, 25, 50, 5),
(51, '2023-06-18', 60, 26, 26, 1),
(52, '2023-03-12', 45, 27, 27, 2),
(53, '2023-12-01', 55, 28, 28, 3),
(54, '2023-09-10', 35, 29, 29, 4),
(55, '2023-05-05', 40, 30, 30, 5),
(56, '2023-02-20', 65, 31, 31, 1),
(57, '2023-11-15', 45, 32, 32, 2),
(58, '2023-07-05', 30, 33, 33, 3),
(59, '2023-03-28', 50, 34, 34, 4),
(60, '2023-12-18', 70, 35, 35, 5),
(61, '2023-08-08', 55, 1, 36, 1),
(62, '2023-04-01', 35, 2, 37, 2),
(63, '2023-01-20', 25, 3, 38, 3),
(64, '2023-10-10', 40, 4, 39, 4),
(65, '2023-06-28', 50, 5, 40, 5),
(66, '2023-03-22', 60, 6, 41, 1),
(67, '2023-11-20', 45, 7, 42, 2),
(68, '2023-07-02', 30, 8, 43, 3),
(69, '2023-02-25', 50, 9, 44, 4),
(70, '2023-12-15', 70, 10, 45, 5),
(71, '2023-09-05', 55, 11, 46, 1),
(72, '2023-05-30', 35, 12, 47, 2),
(73, '2023-03-05', 25, 13, 48, 3),
(74, '2023-10-25', 40, 14, 49, 4),
(75, '2023-06-16', 65, 15, 50, 5),
(76, '2023-02-10', 55, 16, 26, 1),
(77, '2023-11-01', 35, 17, 27, 2),
(78, '2023-07-20', 25, 18, 28, 3),
(79, '2023-04-12', 40, 19, 29, 4),
(80, '2023-01-05', 50, 20, 30, 5),
(81, '2023-09-28', 70, 21, 31, 1),
(82, '2023-06-25', 55, 22, 32, 2),
(83, '2023-03-18', 35, 23, 33, 3),
(84, '2023-11-10', 25, 24, 34, 4),
(85, '2023-08-02', 40, 25, 35, 5),
(86, '2023-04-25', 60, 26, 36, 1),
(87, '2023-01-18', 45, 27, 37, 2),
(88, '2023-10-10', 55, 28, 38, 3),
(89, '2023-07-02', 35, 29, 39, 4),
(90, '2023-02-23', 30, 30, 40, 5),
(91, '2023-12-15', 50, 31, 41, 1),
(92, '2023-09-08', 70, 32, 42, 2),
(93, '2023-05-30', 55, 33, 43, 3),
(94, '2023-02-03', 35, 34, 44, 4),
(95, '2023-10-25', 25, 35, 45, 5),
(96, '2023-06-16', 40, 1, 46, 1),
(97, '2023-03-10', 65, 2, 47, 2),
(98, '2023-12-05', 55, 3, 48, 3),
(99, '2023-08-28', 35, 4, 49, 4),
(100, '2023-05-20', 30, 5, 50, 5),
(101, '2023-01-13', 50, 6, 26, 1),
(102, '2023-09-03', 70, 7, 27, 2),
(103, '2023-05-27', 55, 8, 28, 3),
(104, '2023-02-20', 35, 9, 29, 4),
(105, '2023-11-12', 25, 10, 30, 5),
(106, '2023-07-05', 40, 11, 31, 1),
(107, '2023-03-30', 50, 12, 32, 2),
(108, '2023-12-20', 70, 13, 33, 3),
(109, '2023-09-15', 55, 14, 34, 4),
(110, '2023-06-10', 35, 15, 35, 5),
(111, '2023-03-03', 25, 16, 36, 1),
(112, '2023-10-26', 40, 17, 37, 2),
(113, '2023-06-18', 60, 18, 38, 3),
(114, '2023-02-10', 45, 19, 39, 4),
(115, '2023-11-05', 55, 20, 40, 5),
(116, '2023-08-29', 35, 21, 41, 1),
(117, '2023-05-22', 25, 22, 42, 2),
(118, '2023-01-15', 40, 23, 43, 3),
(119, '2023-10-08', 50, 24, 44, 4),
(120, '2023-07-01', 70, 25, 45, 5),
(121, '2023-03-25', 55, 26, 46, 1),
(122, '2023-12-18', 35, 27, 47, 2),
(123, '2023-08-11', 25, 28, 48, 3),
(124, '2023-05-05', 40, 29, 49, 4),
(125, '2023-01-27', 65, 30, 50, 5),
(126, '2023-10-20', 55, 31, 26, 1),
(127, '2023-07-14', 35, 32, 27, 2),
(128, '2023-04-07', 25, 33, 28, 3),
(129, '2023-12-28', 40, 34, 29, 4),
(130, '2023-09-20', 50, 35, 30, 5),
(131, '2023-06-12', 70, 1, 31, 1),
(132, '2023-02-03', 55, 2, 32, 2),
(133, '2023-11-25', 35, 3, 33, 3),
(134, '2023-08-18', 25, 4, 34, 4),
(135, '2023-05-12', 40, 5, 35, 5),
(136, '2023-01-05', 60, 6, 36, 1),
(137, '2023-09-28', 45, 7, 37, 2),
(138, '2023-06-21', 55, 8, 38, 3),
(139, '2023-03-15', 35, 9, 39, 4),
(140, '2023-12-08', 30, 10, 40, 5),
(141, '2023-08-01', 50, 11, 41, 1),
(142, '2023-04-25', 70, 12, 42, 2),
(143, '2023-01-18', 55, 13, 43, 3),
(144, '2023-10-11', 35, 14, 44, 4),
(145, '2023-07-04', 25, 15, 45, 5),
(146, '2023-03-28', 40, 16, 46, 1),
(147, '2023-12-21', 60, 17, 47, 2),
(148, '2023-09-13', 45, 18, 48, 3),
(149, '2023-06-06', 55, 19, 49, 4),
(150, '2023-02-28', 35, 20, 50, 5);


INSERT INTO libro_autor (ID_LIBRO, ID_AUTOR)
SELECT l.ID_LIBRO, a.ID_AUTOR
FROM libro l
CROSS JOIN autor a;


--  LISTADO DE VISTAS
-- 1. Vista: libro_mas_vendido_anio

-- En esta priemra  vista me muestra  el título del libro más vendido del año 2023, junto con la cantidad total de unidades vendidas. Lo quiero encontrar el libro mas vendido del año 2023 para que el equipo de marketing de la libreria pueda hacer un posteo comercial con este libro. 
--  El objetivo principal de esta vista es proporcionar información sobre el libro más vendido del año 2023 para su uso en estrategias de marketing y promoción. Al conocer cuál es el libro más popular entre los clientes durante ese período, el equipo de marketing puede dirigir sus esfuerzos.
-- Tablas involucradas: La vista está basada en las tablas de "venta" y "libro". 

CREATE VIEW libro_mas_vendido_anio AS
SELECT l.TITULO AS libro_mas_vendido, COUNT(*) AS cantidad_vendida
FROM venta v
JOIN libro l ON v.ID_LIBRO = l.ID_LIBRO
WHERE YEAR(v.FECHA_VENTA) = 2023
GROUP BY v.ID_LIBRO
ORDER BY cantidad_vendida DESC
LIMIT 1;

-- 2. Vista: clientes_con_mas_compras_ultimo_mes

-- Esta vista muestra los clientes que han realizado más compras durante el último mes, considerando específicamente los meses de noviembre y diciembre. Se utiliza para identificar a los clientes más activos en el período previo a las vacaciones de verano y recompensarlos con un voucher del 50% de descuento para vacaciones de verano.
-- Tablas involucradas: Esta vista se basa principalmente en la tabla de "venta" para obtener datos sobre las transacciones de compra de los clientes. Además, puede requerir información adicional de la tabla "cliente" para identificar a los clientes por su nombre u otros detalles de contacto.

CREATE VIEW clientes_mas_compras_ultimo_mes AS
SELECT c.NOMBRE AS nombre_cliente, c.APELLIDO AS apellido_cliente, c.TELEFONO, c.CORREO, COUNT(*) AS total_compras
FROM venta v
JOIN cliente c ON v.ID_CLIENTE = c.ID_CLIENTE
WHERE YEAR(v.FECHA_VENTA) = 2023
AND MONTH(v.FECHA_VENTA) IN (11, 12) -- Filtrar por noviembre (mes 11) y diciembre (mes 12) del año 2023
GROUP BY v.ID_CLIENTE
ORDER BY total_compras DESC;

-- 3 Vista: empleado_mas_ventas_2023
-- Esta vista le permite a recursos humanos identificar al empleado que realizó más ventas en el año 2023 para diseñar una campaña de incentivos.
-- Tablas involucradas: venta: Contiene los registros de las ventas realizadas y la tabla de empleados. 

CREATE VIEW empleado_mas_ventas_2023 AS
SELECT e.NOMBRE AS nombre_empleado, e.APELLIDO AS apellido_empleado, e.CARGO, e.TELEFONO, e.CORREO, COUNT(*) AS total_ventas
FROM venta v
JOIN empleados e ON v.ID_EMPLEADO = e.ID_EMPLEADO
WHERE YEAR(v.FECHA_VENTA) = 2023
GROUP BY v.ID_EMPLEADO
ORDER BY total_ventas DESC
LIMIT 1;


-- LISTADO DE FUNCIONES 

-- PRIMERA FUNCION 
-- La primera función que pense fue una que le permita a los empleados y los clientes verificar si un Titulo está disponible. Para ello creo una función que lea los datos de la BD y particularmente la tabla "Libro". Se crea una variable local llamada "disponibilidad" que es un tipo boolean que devuelve el valor : TRUE si hay al menos un libro disponible con el título proporcionado, o FALSE si no hay libros disponibles con ese título.
-- Por lo tanto, cuando llamo a la  función con el título de un libr, la función realiza una consulta en la tabla libro para verificar si hay al menos un libro disponible con ese título y devuelve un0 valor booleano que indica su disponibilidad.

DELIMITER //

CREATE FUNCTION verificar_disponibilidad_libro (titulo VARCHAR(100))
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE disponibilidad BOOLEAN;
    
    SELECT COUNT(*) INTO disponibilidad 
    FROM libro 
    WHERE TITULO = titulo AND CANTIDAD_DISPONIBLE > 0;

    RETURN disponibilidad;
END//



DELIMITER ;

SELECT verificar_disponibilidad_libro('La Odisea');
 

-- SEGUNDA FUNCIÓN
-- La función obtener_promedio_calificacion_libro fue pensada  para dar a empleados y clientes una manera fácil de obtener el promedio de calificación de un libro en particular. Para lograr esto, la función accede a los datos de la base de datos, específicamente en la tabla "Reseña".
-- Al llamar a esta función con el ID de un libro específico, la función realiza una consulta en la tabla "Reseña" para encontrar todas las calificaciones asociadas a ese libro. Luego, calcula el promedio de estas calificaciones y lo devuelve como un valor decimal.
-- La variable local promedio se declara como un decimal y se inicializa en 0.0. Luego, se utiliza una consulta SQL para calcular el promedio de las calificaciones para el libro especificado mediante la función AVG(). El resultado de esta consulta se almacena en la variable promedio.
-- Finalmente, la función devuelve el promedio calculado como resultado.

DELIMITER //

CREATE FUNCTION obtener_promedio_calificacion_libro(
    libro_id INT
)
RETURNS DECIMAL(3, 2)
READS SQL DATA -- porque consulta data local de la BD
BEGIN
    DECLARE promedio DECIMAL(3, 2) DEFAULT 0.0;
    
    -- Calculamos el promedio de las calificaciones
    SELECT AVG(CALIFICACION) INTO promedio
    FROM RESENIA
    WHERE ID_LIBRO = libro_id;
    
    RETURN promedio;
END //

DELIMITER ;

SELECT obtener_promedio_calificacion_libro(26) AS promedio_calificacion;


-- LISTA DE STORED PROCEDURE 
-- PRIMER STORED PROCEDURE

-- El STORED PROCEDURE de  sp_registrar_resenia se crea con el propósito de registrar una reseña de un libro realizada por un cliente en la base de datos. Para lograr esto, toma varios parámetros de entrada, incluyendo la calificación, el texto del comentario, la fecha de la reseña, el ID del libro y el ID del cliente.
-- Dentro del procedimiento, se declara una variable local llamada resultado, que se inicializa en FALSE. Luego, se realiza una inserción en la tabla RESENIA con los datos proporcionados. Si la inserción se lleva a cabo correctamente (indicado por la función ROW_COUNT() que devuelve el número de filas afectadas por la última instrucción SQL), se establece resultado en TRUE.
-- Finalmente, se selecciona resultado como 'Resultado de la operación' y se devuelve como parte de la salida del procedimiento.

DELIMITER //

CREATE PROCEDURE sp_registrar_resenia(
    IN calificacion INT,
    IN comentario_texto VARCHAR(500),
    IN fecha DATE,
    IN id_libro INT,
    IN id_cliente INT
)
BEGIN
    DECLARE resultado BOOLEAN DEFAULT FALSE;

    -- Insertar la reseña en la tabla RESENIA
    INSERT INTO RESENIA (CALIFICACION, COMENTARIO, FECHA, ID_LIBRO, ID_CLIENTE)
    VALUES (calificacion, comentario_texto, fecha, id_libro, id_cliente);

    -- Si se realiza la inserción correctamente, establecer el resultado en TRUE
    IF ROW_COUNT() > 0 THEN
        SET resultado = TRUE;
    END IF;

    -- Devolver el resultado
    SELECT resultado AS 'Resultado de la operación';
END//

DELIMITER ;

CALL sp_registrar_resenia(5, 'Me encantó este libro, definitivamente lo recomendaría.', '2024-03-31', 29, 35);


-- SEGUNDO STORED PROCEDURE

-- El STORED PROCEDURE realizar_compra se encarga de llevar a cabo una transacción de compra de libros. Toma como parámetros de entrada el ID del cliente que realiza la compra, el ID del libro que se está comprando y la cantidad de libros que se desean comprar.
-- Dentro del procedimiento, se calcula el precio total de la compra multiplicando el precio unitario del libro por la cantidad deseada. También se obtiene la fecha actual y el stock actual del libro.
-- Luego, se verifica si hay suficiente stock disponible para realizar la compra. Si es así, se registra la transacción de compra en la tabla TRANSACCIONES, se actualiza el inventario de libros disponibles. En caso contrario, se devuelve un mensaje indicando que no hay suficiente stock disponible.
-- En resumen, este procedimiento maneja todo el proceso de compra de libros, desde el registro de la transacción hasta la actualización del inventario.
DELIMITER //

CREATE PROCEDURE realizar_compra(
    IN cliente_id INT,
    IN libro_id INT,
    IN cantidad INT
)
BEGIN
    DECLARE total_precio DECIMAL(10, 2);
    DECLARE fecha_actual DATE;
    DECLARE stock_actual INT;
    
    -- Obtener el precio del libro, multiplicando precio x cantidad 
    SELECT PRECIO * cantidad INTO total_precio
    FROM LIBRO
    WHERE ID_LIBRO = libro_id;
    
    -- Obtener la fecha actual
    SET fecha_actual = CURDATE();
    
    -- Obtener el stock actual del libro
    SELECT CANTIDAD_DISPONIBLE INTO stock_actual
    FROM LIBRO
    WHERE ID_LIBRO = libro_id;
    
    -- Verificar si hay suficiente stock
    IF stock_actual >= cantidad THEN
        -- Registrar la transacción de compra
        INSERT INTO TRANSACCIONES (FECHA, CLIENTE_ID, TOTAL)
        VALUES (fecha_actual, cliente_id, total_precio);
        
        -- Actualizar el inventario de libros disponibles, imoprtante para que se mantenga actualizada la base 
        UPDATE LIBRO
        SET CANTIDAD_DISPONIBLE = stock_actual - cantidad
        WHERE ID_LIBRO = libro_id;
        
    
        SELECT 'Compra realizada con éxito.' AS Mensaje;
    ELSE
        SELECT 'No hay suficiente stock disponible para realizar la compra.' AS Mensaje;
    END IF;
END//

DELIMITER ;


-- TERCER STORED PROCEDURE
--  El procedimiento almacenado buscar_libros_por_categoria permite obtener una lista de libros según una categoría especificada. Funciona de la siguiente manera:

-- Crea una tabla temporal llamada temp_libros para almacenar los resultados de la consulta.
-- Inserta en la tabla temporal los libros que coinciden con la categoría especificada.
-- Selecciona y devuelve los resultados de la tabla temporal.
-- Elimina la tabla temporal creada para evitar acumulación de datos.


DELIMITER //

CREATE PROCEDURE buscar_libros_por_categoria(
    IN categoria VARCHAR(100)
)
BEGIN
    -- Crea una tabla temporal para almacenar los resultados
    CREATE TEMPORARY TABLE temp_libros (
        ID_LIBRO INT,
        TITULO VARCHAR(100),
        AUTOR VARCHAR(100),
        CATEGORIA VARCHAR(100)
    );

    -- Inserta los resultados en la tabla temporal
    INSERT INTO temp_libros (ID_LIBRO, TITULO, AUTOR, CATEGORIA)
    SELECT ID_LIBRO, TITULO, AUTOR, CATEGORIA
    FROM LIBRO
    WHERE CATEGORIA = categoria;

    -- Selecciona los resultados de la tabla temporal
    SELECT * FROM temp_libros;
    
    -- Elimina la tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_libros;
END//

DELIMITER ;

-- LISTA DE TRIGGERS

-- PRIMER TRIGGER
-- Quiero implementar un trigger que registre los cambios en el precio de un libro, por lo que necesito un tabla donde se registre esta informacion: 

CREATE TABLE AuditoriaCambiosPrecio (
    ID_AUDITORIA INT AUTO_INCREMENT PRIMARY KEY,
    ID_LIBRO INT,
    PRECIO_ANTERIOR DECIMAL(10, 2),
    NUEVO_PRECIO DECIMAL(10, 2),
    FECHA_CAMBIO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- El trigger `registrar_cambio_precio` se activa después de que se actualiza un registro en la tabla `LIBRO`. Para cada fila actualizada, verifica si el precio anterior (`OLD.PRECIO`) es diferente al nuevo precio (`NEW.PRECIO`). Si hay un cambio de precio, registra los detalles del cambio, incluyendo el ID del libro, el precio anterior y el nuevo precio, en la tabla de auditoría `AuditoriaCambiosPrecio`. Esto permite mantener un historial de todos los cambios de precios realizados en los libros, lo que proporciona una trazabilidad completa de las modificaciones de precios en la base de datos.
DELIMITER //

CREATE TRIGGER registrar_cambio_precio
AFTER UPDATE ON LIBRO
FOR EACH ROW
BEGIN
    IF OLD.PRECIO != NEW.PRECIO THEN
        INSERT INTO AuditoriaCambiosPrecio (ID_LIBRO, PRECIO_ANTERIOR, NUEVO_PRECIO)
        VALUES (NEW.ID_LIBRO, OLD.PRECIO, NEW.PRECIO);
    END IF;
END//

DELIMITER ;


