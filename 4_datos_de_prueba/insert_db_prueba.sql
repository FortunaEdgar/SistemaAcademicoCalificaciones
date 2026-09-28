------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--En esta parte nos auxiliamos de la IA para llenar la base de datos con la información necesaria.
------------------------------------------------------------------------------------------------------
-- Se agregan estudiantes, materias, maestros y todos los demás registros, que son básicamente estáticos.
-- Existen procedimientos más complejos para matricular estudiantes y calificarlos de forma automática. 
-- Con el fin de tener la base de datos con información, para fines demostrativos se dejarán a los 
-- estudiantes cursando grados en 2026 sin calificar.
------------------------------------------------------------------------------------------------------

INSERT INTO estudiantes (nombre, fecha_nacimiento) VALUES
-- Estudiantes mayores (para los años 2015-2020)
('Juan Perez', '2008-03-12'), ('Maria Rodriguez', '2008-07-25'), ('Carlos Gonzalez', '2008-11-05'),
('Ana Hernandez', '2009-01-15'), ('Luis Martinez', '2009-05-30'), ('Sofia Lopez', '2009-09-10'),
('Miguel Sanchez', '2009-12-22'), ('Laura Diaz', '2008-04-18'), ('Jose Torres', '2009-08-05'),
('Isabella Ramirez', '2009-02-28'), ('David Flores', '2008-10-12'), ('Camila Rivera', '2009-06-15'),
('Daniel Gomez', '2008-09-20'), ('Valentina Cruz', '2009-03-08'), ('Pedro Reyes', '2009-11-01'),
('Gabriela Morales', '2008-05-14'), ('Alejandro Ortiz', '2009-07-19'), ('Victoria Gutierrez', '2008-12-03'),
('Manuel Castro', '2009-04-25'), ('Martina Vargas', '2009-10-30'), ('Santiago Ramos', '2008-01-09'),
('Lucia Ruiz', '2009-05-17'), ('Diego Mendoza', '2008-08-22'), ('Elena Jimenez', '2009-12-11'),
('Sebastian Castillo', '2009-02-14'), ('Paula Romero', '2008-06-29'), ('Mateo Vasquez', '2009-09-05'),
('Daniela Espinoza', '2008-11-18'), ('Gabriel Guzman', '2009-01-22'), ('Valeria Lara', '2008-07-10'),
('Lucas Chavez', '2009-03-15'), ('Fernanda Silva', '2008-10-25'), ('Nicolas Delgado', '2009-06-08'),
('Mariana Guerrero', '2008-09-14'), ('Samuel Rojas', '2009-12-28'), ('Adriana Fernandez', '2008-04-05'),
('Emilio Mendez', '2009-08-12'), ('Carolina Alvarez', '2008-02-20'), ('Julian Aguilar', '2009-11-08'),
('Antonia Paredes', '2008-05-30'), ('Francisco Molina', '2009-09-25'), ('Ximena Miranda', '2008-12-15'),
('Andres Campos', '2009-01-10'), ('Natalia Leon', '2008-06-18'), ('Ricardo Herrera', '2009-10-05'),
('Clara Acosta', '2008-08-28'), ('Javier Medina', '2009-03-22'), ('Abril Vega', '2008-11-12'),
('Hector Suarez', '2009-07-02'), ('Lorena Cabrera', '2008-09-18'),

-- Estudiantes intermedios (para los años 2018-2023)
('Martin Rios', '2010-02-15'), ('Sara Solis', '2010-06-20'), ('Leonardo Nunez', '2011-09-10'),
('Julia Montes', '2011-12-05'), ('Tomas Fuentes', '2010-04-30'), ('Olivia Valenzuela', '2011-08-15'),
('Bruno Pena', '2010-01-25'), ('Renata Cardenas', '2011-05-12'), ('Agustin Bravo', '2010-10-08'),
('Emma Figueroa', '2011-03-18'), ('Felipe Sandoval', '2010-07-22'), ('Mia Serrano', '2011-11-30'),
('Ignacio Blanco', '2010-09-14'), ('Alba Correa', '2011-02-10'), ('Matias Arroyo', '2010-05-28'),
('Zoe Villanueva', '2011-06-19'), ('Cristobal Mejia', '2010-11-25'), ('Alma Peralta', '2011-01-08'),
('Vicente Cabrera', '2010-08-02'), ('Luna Escobar', '2011-09-22'), ('Alonso Ponce', '2010-12-18'),
('Bianca Rivas', '2011-04-12'), ('Esteban Vidal', '2010-03-05'), ('Abril Duarte', '2011-07-28'),
('Rodrigo Ibarra', '2010-06-14'), ('Miranda Leal', '2011-10-20'), ('Pablo Navarrete', '2010-02-10'),
('Lola Orellana', '2011-05-25'), ('Simon Gallegos', '2010-09-08'), ('Pilar Rosales', '2011-12-12'),
('Angel Zuniga', '2012-01-30'), ('Mara Salas', '2012-08-14'), ('Gonzalo Parra', '2013-03-22'),
('Elisa Barrera', '2012-11-05'), ('Oscar Zavala', '2013-06-18'), ('Carmen Valencia', '2012-04-10'),
('Ramon Cisneros', '2013-09-28'), ('Juana Beltran', '2012-02-15'), ('Ivan Lozano', '2013-07-12'),
('Alicia Andrade', '2012-10-30'), ('Raul Portillo', '2013-01-20'), ('Irene Villegas', '2012-05-25'),
('Hugo Trujillo', '2013-11-08'), ('Elena Maldonado', '2012-09-02'), ('Emiliano Zamora', '2013-02-14'),
('Violeta Guevara', '2012-06-30'), ('Patricio Orozco', '2013-10-15'), ('Candela Benitez', '2012-03-12'),
('Arturo Cano', '2013-05-20'), ('Noemi Pacheco', '2012-12-05'), ('Cesar Bustamante', '2013-08-10'),
('Amalia Tapia', '2012-07-25'), ('Lorenzo Duran', '2013-04-05'), ('Guadalupe Sosa', '2012-11-22'),
('Roberto Aguirre', '2013-09-15'), ('Paulina Becerra', '2012-01-18'), ('Maximo Quintana', '2013-12-01'),
('Jimena Trejo', '2012-08-20'), ('Alberto Robles', '2013-03-10'), ('Constanza Velez', '2012-10-28'),

-- Estudiantes recientes (para los años 2021-2026, actuales grados 1-6)
('Thiago Salinas', '2014-02-10'), ('Aitana Munoz', '2014-06-15'), ('Ian Paredes', '2015-09-20'),
('Lia Dominguez', '2015-12-08'), ('Gael Gil', '2014-04-25'), ('Manuela Varela', '2015-07-30'),
('Salvador Ramos', '2014-01-12'), ('Regina Mota', '2015-05-18'), ('Bautista Caceres', '2014-10-05'),
('Celeste Rey', '2015-03-22'), ('Facundo Galvan', '2014-08-14'), ('Julieta Colon', '2015-11-10'),
('Amadeo Reyes', '2014-05-30'), ('Delfina Serrano', '2015-02-05'), ('Dante Leon', '2014-11-25'),
('Macarena Marin', '2015-06-12'), ('Elias Franco', '2014-09-18'), ('Guillermina Soler', '2015-10-22'),
('Oliver Costa', '2014-03-08'), ('Amparo Guerra', '2015-08-01'), ('Milo Santana', '2016-01-15'),
('Charo Roman', '2016-07-20'), ('Teo Pastor', '2017-09-10'), ('Begoña Fuentes', '2017-12-05'),
('Enzo Nieto', '2016-04-18'), ('Triana Carrasco', '2017-08-25'), ('Ciro Bernal', '2016-10-12'),
('Gala Saenz', '2017-03-30'), ('Luca Hidalgo', '2016-05-22'), ('Ona Escobar', '2017-11-15'),
('Noa Mendez', '2016-02-28'), ('Vera Ferrer', '2017-06-08'), ('Izan Caballero', '2016-08-30'),
('Laia Lozano', '2017-01-10'), ('Leo Vicente', '2016-11-05'), ('Cloe Cabrera', '2017-04-15'),
('Axel Santos', '2016-12-20'), ('Iris Herrera', '2017-07-12'), ('Joel Gimenez', '2016-09-25'),
('Ada Iglesias', '2017-02-18'), ('Eric Garrido', '2016-06-05'), ('Lara Diez', '2017-10-28'),
('Adam Montero', '2016-03-14'), ('Elsa Prieto', '2017-05-20'), ('Asier Calvo', '2016-07-08'),
('Maia Rubio', '2017-12-22'), ('Iker Gallego', '2016-01-25'), ('Chloe Vidal', '2017-09-02'),
('Pol Marin', '2018-04-10'), ('Lola Ortega', '2018-08-15'), ('Alex Castro', '2019-02-20'),
('Mia Santiago', '2019-06-25'), ('Pau Guerrero', '2018-11-12'), ('Nora Cano', '2019-09-05'),
('Jan Molina', '2018-05-08'), ('Eva Roldan', '2019-12-18'), ('Nil Vega', '2018-09-30'),
('Zoe Mendez', '2019-03-15'), ('Marc Flores', '2018-02-22'), ('Lia Aguilar', '2019-07-10'),
('Saul Suarez', '2018-06-18'), ('Noa Torres', '2019-10-25'), ('Aleix Romero', '2018-12-05'),
('Alma Navarro', '2019-04-30'), ('Yago Gil', '2018-08-22'), ('Abril Serrano', '2019-01-12'),
('Aitor Ramos', '2018-03-28'), ('Gala Hidalgo', '2019-05-20'), ('Unai Vargas', '2018-10-14'),
('Elia Jimenez', '2019-08-08'), ('Marco Castillo', '2018-01-18'), ('Dalia Cortes', '2019-11-30'),
('Eloy Pena', '2018-07-25'), ('Iris Medina', '2019-02-05'), ('Teo Guzman', '2018-09-08'),
('Jana Rojas', '2019-06-15'), ('Cayo Silva', '2018-11-20'), ('Ada Morales', '2019-12-10'),
('Roc Pineda', '2018-04-05'), ('Mar Munoz', '2019-09-22'), ('Lluc Cruz', '2018-12-15'),
('Arlet Campos', '2020-03-10'), ('Biel Reyes', '2020-07-28'), ('Ivet Fuentes', '2020-01-20'),
('Aran Herrera', '2020-05-12'), ('Sira Diez', '2020-10-05'), ('Jon Garrido', '2020-02-18'),
('Duna Prieto', '2020-06-25'), ('Ot Montero', '2020-11-15'), ('Ona Calvo', '2020-04-08'),
('Pol Rubio', '2020-08-30'), ('Lia Gallego', '2020-12-20'), ('Nil Vidal', '2020-09-12'),
('Jan Ortega', '2020-03-22'), ('Zoe Castro', '2020-07-05'), ('Marc Santiago', '2020-01-15'),
('Pau Cano', '2020-05-28'), ('Alex Roldan', '2020-10-10'), ('Mia Vega', '2020-02-08'),
('Leo Mendez', '2020-06-18'), ('Nora Flores', '2020-11-25'), ('Enzo Aguilar', '2020-04-15'),
('Eva Suarez', '2020-08-20'), ('Max Torres', '2020-12-05'), ('Ana Romero', '2020-09-28'),

-- Relleno final para asegurar 300 con nombres mixtos
('Sofia Navarro', '2009-03-12'), ('Lucas Gil', '2009-07-22'), ('Isabella Serrano', '2010-01-15'),
('Mateo Ramos', '2010-05-18'), ('Camila Hidalgo', '2011-09-10'), ('Daniel Vargas', '2011-12-30'),
('Valeria Jimenez', '2012-04-05'), ('Santiago Castillo', '2012-08-25'), ('Victoria Cortes', '2013-02-14'),
('Sebastian Pena', '2013-06-20'), ('Mariana Medina', '2014-10-12'), ('Nicolas Guzman', '2014-11-08'),
('Lucia Rojas', '2015-03-28'), ('Alejandro Silva', '2015-07-15'), ('Paula Morales', '2016-01-22'),
('Diego Pineda', '2016-05-10'), ('Fernanda Munoz', '2017-09-18'), ('Samuel Cruz', '2017-12-02'),
('Gabriela Campos', '2018-04-20'), ('Joaquin Reyes', '2018-08-30'), ('Antonia Fuentes', '2019-02-12'),
('Emilio Herrera', '2019-06-25'), ('Ximena Diez', '2020-10-08'), ('Felipe Garrido', '2008-01-20'),
('Martina Prieto', '2008-05-15'), ('Andres Montero', '2009-09-05'), ('Clara Calvo', '2009-11-12'),
('Javier Rubio', '2010-03-30'), ('Abril Gallego', '2010-07-18'), ('Hector Vidal', '2011-11-22'),
('Lorena Ortega', '2011-02-08'), ('Ricardo Castro', '2012-06-14'), ('Adriana Santiago', '2012-10-25'),
('Julian Cano', '2013-01-10'), ('Natalia Roldan', '2013-05-22'), ('Francisco Vega', '2014-09-15'),
('Veronica Mendez', '2014-12-05'), ('Roberto Flores', '2015-04-18'), ('Alicia Aguilar', '2015-08-12'),
('Jorge Suarez', '2016-02-25'), ('Silvia Torres', '2016-06-30'), ('Raul Romero', '2017-10-14'),
('Beatriz Navarro', '2017-11-20'), ('Gustavo Gil', '2018-03-08'), ('Rosario Serrano', '2018-07-28'),
('Eduardo Ramos', '2019-01-15'), ('Monica Hidalgo', '2019-05-05'), ('Victor Vargas', '2020-09-22'),
('Pilar Jimenez', '2020-12-10'), ('Sergio Castillo', '2008-02-18'), ('Celia Cortes', '2008-06-22'),
('Oscar Pena', '2009-10-30'), ('Elisa Medina', '2009-12-15'), ('Ruben Guzman', '2010-04-25'),
('Teresa Rojas', '2010-08-10'), ('Alfonso Silva', '2011-01-28'), ('Raquel Morales', '2011-05-12'),
('Felix Pineda', '2012-09-20'), ('Ines Munoz', '2012-11-05'), ('Rafaela Cruz', '2013-03-15'),
('Cristina Campos', '2013-07-22'), ('Alberto Reyes', '2014-11-30'), ('Yolanda Fuentes', '2014-01-08'),
('Guillermo Herrera', '2015-05-25'), ('Lidia Diez', '2015-09-12'), ('Mauro Garrido', '2016-01-30'),
('Sonia Prieto', '2016-06-18'), ('Eugenio Montero', '2017-10-02'), ('Rebeca Calvo', '2017-02-14'),
('Marcos Rubio', '2018-07-05'), ('Noelia Gallego', '2018-11-18'), ('Dario Vidal', '2019-03-25'),
('Esther Ortega', '2019-08-02'), ('Salvador Castro', '2020-12-28'), ('Fabiola Santiago', '2020-04-12'),
('Ismael Cano', '2008-09-08'), ('Marta Roldan', '2008-01-22'), ('Jaime Vega', '2009-05-30'),
('Olga Mendez', '2009-10-15'), ('Vicente Flores', '2010-02-20'), ('Gloria Aguilar', '2010-06-28'),
('Arturo Suarez', '2011-11-10'), ('Angela Torres', '2011-03-05'), ('Ramon Romero', '2012-07-15'),
('Mercedes Navarro', '2012-12-01'), ('Ernesto Gil', '2013-04-22'), ('Consuelo Serrano', '2013-08-08'),
('Federico Ramos', '2014-01-18'), ('Amelia Hidalgo', '2014-05-10'), ('Humberto Vargas', '2015-09-25'),
('Luisa Jimenez', '2015-11-20'), ('Gregorio Castillo', '2016-03-12'), ('Aurora Cortes', '2016-07-28'),
('Ignacio Pena', '2017-12-05'), ('Irene Medina', '2017-04-15'), ('Lorenzo Guzman', '2018-08-25'),
('Paloma Rojas', '2018-12-30'), ('Mariano Silva', '2019-05-18'), ('Elvira Morales', '2019-09-10'),
('Benjamin Pineda', '2020-01-25'), ('Berta Munoz', '2020-06-02'), ('Ezequiel Cruz', '2008-10-22'),
('Adela Campos', '2008-03-05'), ('Joaquin Reyes', '2009-07-12'), ('Diana Fuentes', '2009-11-28'),
('Abel Herrera', '2010-04-10'), ('Miriam Diez', '2010-08-22'), ('Camilo Garrido', '2011-01-05'),
('Virginia Prieto', '2011-05-15'), ('Teodoro Montero', '2012-09-30'), ('Julia Calvo', '2012-12-12'),
('Leandro Rubio', '2013-04-28'), ('Susana Gallego', '2013-09-05'), ('Marcelo Vidal', '2014-01-20'),
('Roxana Ortega', '2014-06-02'), ('Fidel Castro', '2015-10-15'), ('Blanca Santiago', '2015-02-28'),
('Ulises Cano', '2016-07-10'), ('Flora Roldan', '2016-11-22'), ('Damian Vega', '2017-03-30'),
('Leticia Mendez', '2017-08-05'), ('Gervasio Flores', '2018-12-18'), ('Magdalena Aguilar', '2018-04-30'),
('Homero Suarez', '2019-09-14'), ('Priscila Torres', '2019-01-25'), ('Lazaro Romero', '2020-06-08'),
('Josefina Navarro', '2020-10-20'), ('Jacinto Gil', '2008-02-12'), ('Bernarda Serrano', '2008-06-25'),
('Gaspar Ramos', '2009-11-05'), ('Carlota Hidalgo', '2009-03-18'), ('Melchor Vargas', '2010-07-30'),
('Genoveva Jimenez', '2010-12-10'), ('Baltasar Castillo', '2011-04-25'), ('Teodora Cortes', '2011-09-05'),
('Eleuterio Pena', '2012-01-15'), ('Casandra Medina', '2012-05-28'), ('Isidro Guzman', '2013-10-10'),
('Leocadia Rojas', '2013-02-22'), ('Anibal Silva', '2014-06-30'), ('Macaria Morales', '2014-11-12'),
('Valentin Pineda', '2015-03-25'), ('Eulalia Munoz', '2015-08-05'), ('Bonifacio Cruz', '2016-12-18'),
('Feliciana Campos', '2016-04-30'), ('Hipolito Reyes', '2017-09-12'), ('Gumersinda Fuentes', '2017-01-25'),
('Tibursio Herrera', '2018-06-05'), ('Dorotea Diez', '2018-10-18'), ('Macario Garrido', '2019-02-28'),
('Hermenegilda Prieto', '2019-07-12'), ('Evaristo Montero', '2020-11-22'), ('Petra Calvo', '2020-04-05'),
('Severo Rubio', '2008-08-15'), ('Benita Gallego', '2008-12-28'), ('Carmelo Vidal', '2009-05-10'),
('Dionisia Ortega', '2009-09-22'), ('Cornelio Castro', '2010-02-05'), ('Agripina Santiago', '2010-06-15'),
('Inocencio Cano', '2011-10-28'), ('Domitila Roldan', '2011-03-12'), ('Saturnino Vega', '2012-07-22'),
('Nicolasa Mendez', '2012-12-05'), ('Ambrosio Flores', '2013-04-15'), ('Anastasia Aguilar', '2013-08-28'),
('Timoteo Suarez', '2014-01-08'), ('Gregoria Torres', '2014-05-20'), ('Fausto Romero', '2015-10-02'),
('Rufina Navarro', '2015-02-12'), ('Donato Gil', '2016-06-25'), ('Justina Serrano', '2016-11-05');

INSERT INTO year_academico (year_academico, descripcion) VALUES
(2015, '2015-2016'),
(2016, '2016-2017'),
(2017, '2017-2018'),
(2018, '2018-2019'),
(2019, '2019-2020'),
(2020, '2020-2021'),
(2021, '2021-2022'),
(2022, '2022-2023'),
(2023, '2023-2024'),
(2024, '2024-2025'),
(2025, '2025-2026'),
(2026, '2026-2027');

INSERT INTO grados (grados) VALUES
('1er Grado'),
('2do Grado'),
('3er Grado'),
('4to Grado'),
('5to Grado'),
('6to Grado');


INSERT INTO seccion (seccion, id_year, id_grado)
SELECT 
    letra, 
    y.id_year, 
    g.id_grado
FROM 
    year_academico y,
    grados g,
    (VALUES ('A'), ('B'), ('C')) as letras(letra)
ORDER BY y.year_academico, g.id_grado, letra;


INSERT INTO matriculas (id_estudiante, id_seccion)
SELECT 
    e.id_estudiante,
    s.id_seccion
FROM 
    estudiantes e
    CROSS JOIN year_academico y -- Combinamos todos los estudiantes con todos los años
    JOIN grados g ON g.id_grado = (y.year_academico - CAST(EXTRACT(YEAR FROM e.fecha_nacimiento) AS INTEGER) - 5)
    JOIN seccion s ON s.id_year = y.id_year AND s.id_grado = g.id_grado
WHERE 
    -- Filtramos solo los años académicos que nos interesan
    y.year_academico BETWEEN 2015 AND 2026
    
    -- Aseguramos que el grado calculado esté entre 1 y 6 (Primaria)
    AND (y.year_academico - CAST(EXTRACT(YEAR FROM e.fecha_nacimiento) AS INTEGER) - 5) BETWEEN 1 AND 6
    
    -- Lógica de distribución de secciones (Pares a la A, Impares a la B)
    AND s.seccion = (CASE WHEN e.id_estudiante % 2 = 0 THEN 'A' ELSE 'B' END)

ORDER BY y.year_academico, g.id_grado, e.nombre;



INSERT INTO materias (materia) VALUES
('Lengua Española'),
('Matemáticas'),
('Ciencias Sociales'),
('Ciencias de la Naturaleza'), -- Nombre oficial en RD
('Inglés'),
('Educación Artística'),
('Educación Física'),
('Formación Integral, Humana y Religiosa');



INSERT INTO profesores (nombre) VALUES
('Altagracia Guzmán'),
('Ramón Antonio Veras'),
('Yocasta Méndez'),
('Wellington Castillo'),
('Marisol Tavárez'),
('Radhamés Polanco'),
('Xiomara Batista'),
('Fausto Rosario'),
('Carmen Luisa De los Santos'),
('Eddy Alcántara'),
('Santa Martínez'),
('Rafaelito Cruz'),
('Milagros Ortiz'),
('Diógenes Céspedes'),
('Lidiana Marte'),
('Bolívar Núñez'),
('Claritza Peña'),
('Junior De la Cruz'),
('Soraya Medina'),
('Francisco Alberto Caamaño'),
('Alejandro Martínez'),
('Beatriz Castillo'),
('Carlos Velásquez'),
('Diana Morales'),
('Eduardo Santos'),
('Fernanda Gómez'),
('Gabriel Herrera'),
('Héctor Ramírez'),
('Isabel Torres'),
('Javier Méndez'),
('Karla Vargas'),
('Luis Ortega'),
('Mónica Silva'),
('Néstor Guzmán'),
('Olivia Cabrera'),
('Pablo Rivas'),
('Quintín Flores'),
('Rosa Cordero'),
('Sergio Navarro'),
('Teresa Delgado'),
('Ulises Pacheco'),
('Valeria Cruz'),
('Walter Espinoza'),
('Ximena Reyes'),
('Yolanda Peña'),
('Zacarías Montes'),
('Andrés Solano'),
('Bianca Ríos'),
('César León'),
('Daniela Fuentes'),
('Esteban Miranda'),
('Fabiola Serrano'),
('Gustavo Salinas'),
('Hilda Campos'),
('Ignacio Vega'),
('Julia Maldonado'),
('Kevin Rosales'),
('Lorena Aguilar'),
('Manuel Ibarra'),
('Natalia Orozco');-- Un guiño histórico, aunque sea profesor aquí



INSERT INTO horrario (hora_inicio, hora_final, descriccion) VALUES
('08:00', '08:45', 'Primera Hora de Clases'),
('08:45', '09:30', 'Segunda Hora de Clases'),
('09:30', '10:00', 'Recreo / Merienda Escolar'),
('10:00', '10:45', 'Tercera Hora de Clases'),
('10:45', '11:30', 'Cuarta Hora de Clases'),
('11:30', '12:15', 'Quinta Hora de Clases');








DO $$
DECLARE
    -- Variables
    year_iter INT;
    curr_id_year INT;
    sec RECORD;
    dia TEXT;
    h_id INT;
    prof_id INT;
    mat_id INT;
    
    -- Arrays
    dias_semana TEXT[] := ARRAY['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'];
    
    -- Contadores
    contador_profesores INT;
    total_profesores INT;
    
BEGIN
    -- Contamos cuántos profes hay ahora (deberían ser unos 60 con los nuevos)
    SELECT Count(*) INTO total_profesores FROM profesores;

    -- BUCLE AÑOS
    FOR year_iter IN 2015..2026 
    LOOP
        SELECT id_year INTO curr_id_year FROM year_academico WHERE year_academico = year_iter;
        
        -- Reiniciar contador de asignación por año
        contador_profesores := 0;

        -- BUCLE SECCIONES
        FOR sec IN 
            SELECT id_seccion, seccion, id_grado 
            FROM seccion 
            WHERE id_year = curr_id_year
            ORDER BY id_grado, seccion
        LOOP
            -- Asignamos profesor rotativo
            contador_profesores := contador_profesores + 1;
            
            -- Fórmura segura para rotar ID de profesor
            -- (Si count es 60, devuelve 60, no 0)
            prof_id := ((contador_profesores - 1) % total_profesores) + 1;

            -- BUCLE DÍAS
            FOREACH dia IN ARRAY dias_semana
            LOOP
                -- BUCLE HORAS
                FOR h_id IN 1..6 
                LOOP
                    -- Saltar recreo
                    IF h_id <> 3 THEN
                        
                        -- Lógica Materias
                        IF h_id = 1 THEN
                            IF dia IN ('Lunes', 'Miércoles', 'Viernes') THEN mat_id := 2; -- Mate
                            ELSE mat_id := 1; END IF; -- Lengua
                        
                        ELSIF h_id = 2 THEN
                            IF dia IN ('Lunes', 'Miércoles', 'Viernes') THEN mat_id := 1; 
                            ELSE mat_id := 2; END IF;

                        ELSIF h_id = 4 THEN
                            IF dia IN ('Lunes', 'Miércoles') THEN mat_id := 3; -- Sociales
                            ELSIF dia IN ('Martes', 'Jueves') THEN mat_id := 4; -- Naturales
                            ELSE mat_id := 8; END IF; -- Formacion

                        ELSIF h_id = 5 THEN
                             IF dia IN ('Lunes', 'Miércoles') THEN mat_id := 5; -- Ingles
                             ELSE mat_id := 6; END IF; -- Arte

                        ELSIF h_id = 6 THEN
                             IF dia = 'Viernes' THEN mat_id := 7; -- Deporte
                             ELSIF dia = 'Lunes' THEN mat_id := 8;
                             ELSE mat_id := 3; END IF;
                        END IF;

                        -- INSERTAR (Ahora seguro porque prof_id será diferente para cada sección)
                        INSERT INTO carga_seccion_materia (id_profesor, id_materia, id_seccion, id_horario, dia_semana)
                        VALUES (prof_id, mat_id, sec.id_seccion, h_id, dia);
                        
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        
        RAISE NOTICE 'Año % completado exitosamente.', year_iter;
        
    END LOOP;
END $$;





INSERT INTO periodos (periodo, numero_periodo, id_year)
SELECT 
    'Trimestre ' || t.n,  -- Genera "Trimestre 1", "Trimestre 2"...
    t.n,
    y.id_year
FROM year_academico y
CROSS JOIN generate_series(1, 3) AS t(n) -- Multiplica cada año por 3
ORDER BY y.id_year, t.n;


INSERT INTO criterios (criterio, porcentaje) VALUES
('Exámenes Parciales', 40),
('Prácticas y Tareas', 30),
('Participación Oral', 20),
('Asistencia y Valores', 10);


DO $$
DECLARE
    -- Cursor para recorrer cada estudiante y sus materias UNICAS por año
    cur_asignaciones CURSOR FOR 
        SELECT DISTINCT ON (m.id_matricula, csm.id_materia, p.id_periodo)
            m.id_matricula,
            csm.id_carga, -- Usamos una de las cargas para asociar la nota
            p.id_periodo,
            y.year_academico
        FROM matriculas m
        JOIN seccion s ON m.id_seccion = s.id_seccion
        JOIN year_academico y ON s.id_year = y.id_year
        JOIN carga_seccion_materia csm ON csm.id_seccion = s.id_seccion
        JOIN periodos p ON p.id_year = y.id_year
        WHERE y.year_academico < 2026 -- EXCLUYE EL ÚLTIMO AÑO
        ORDER BY m.id_matricula, csm.id_materia, p.id_periodo, csm.id_carga;

    -- Variables para el bucle
    reg RECORD;
    crit RECORD;
    nota_base FLOAT;
    nota_final FLOAT;
    factor_aleatorio FLOAT;
    
BEGIN
    -- Recorremos cada combinación Estudiante-Materia-Periodo
    FOR reg IN cur_asignaciones LOOP
        
        -- Generamos un "Perfil de rendimiento" aleatorio para este estudiante en esta materia
        -- Esto decide si en este trimestre le irá bien, regular o mal.
        factor_aleatorio := random();

        -- Recorremos los 4 criterios (Examen, Tareas, etc.)
        FOR crit IN SELECT id_criterio, porcentaje FROM criterios LOOP
            
            -- LÓGICA DE NOTAS REALISTAS
            IF factor_aleatorio > 0.80 THEN
                -- Estudiante Excelente (Notas entre 90 y 100)
                nota_base := 90 + floor(random() * 11);
            ELSIF factor_aleatorio > 0.30 THEN
                -- Estudiante Promedio (Notas entre 70 y 89)
                nota_base := 70 + floor(random() * 20);
            ELSE
                -- Estudiante con dificultades (Notas entre 50 y 69)
                nota_base := 50 + floor(random() * 20);
            END IF;

            -- Pequeña variación por criterio (para que no saque lo mismo en examen que en asistencia)
            nota_final := nota_base + floor(random() * 5) - 2; 
            
            -- Asegurar que no pase de 100 ni baje de 0
            IF nota_final > 100 THEN nota_final := 100; END IF;
            IF nota_final < 0 THEN nota_final := 0; END IF;

            -- INSERTAR LA NOTA
            -- El trigger se disparará automáticamente aquí calculando el promedio
            INSERT INTO notas_criterios (id_matricula, id_carga, id_periodo, id_criterio, valor)
            VALUES (reg.id_matricula, reg.id_carga, reg.id_periodo, crit.id_criterio, nota_final);
            
        END LOOP;
    END LOOP;
END $$;