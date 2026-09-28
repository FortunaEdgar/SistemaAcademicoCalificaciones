-- 1. AÑO ACADÉMICO
CREATE TABLE year_academico (
    id_year        SERIAL PRIMARY KEY,
    year_academico           SMALLINT NOT NULL UNIQUE CHECK (year_academico BETWEEN 1900 AND 2100),
    descripcion    VARCHAR(100)
);


-- 2. GRADOS
CREATE TABLE grados (
    id_grado    SERIAL PRIMARY KEY,
    grados      VARCHAR(100) NOT NULL UNIQUE
);

-- 3. seccion
CREATE TABLE seccion (
    id_seccion   SERIAL PRIMARY KEY,
    seccion    VARCHAR(20) NOT NULL,
    id_year    INT NOT NULL,
    id_grado   INT NOT NULL,

    UNIQUE (id_year, id_grado, seccion),

    FOREIGN KEY (id_year) REFERENCES year_academico(id_year),
    FOREIGN KEY (id_grado) REFERENCES grados(id_grado)
);

-- 4. ESTUDIANTES
CREATE TABLE estudiantes (
    id_estudiante      SERIAL PRIMARY KEY,
    nombre             VARCHAR(150) NOT NULL,
    fecha_nacimiento   DATE NOT NULL CHECK (fecha_nacimiento < CURRENT_DATE)
);

-- 5. MATRICULAS
CREATE TABLE matriculas (
    id_matricula  SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_seccion      INT NOT NULL,

    UNIQUE (id_estudiante, id_seccion),

    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_seccion) REFERENCES seccion(id_seccion)
);

-- 6. PROFESORES
CREATE TABLE profesores (
    id_profesor  SERIAL PRIMARY KEY,
    nombre       VARCHAR(150) NOT NULL
);

-- 7. MATERIAS
CREATE TABLE materias (
    id_materia  SERIAL PRIMARY KEY,
    materia      VARCHAR(100) NOT NULL UNIQUE
);

-- 8. HORARIO
CREATE TABLE horrario (
    id_horario    SERIAL PRIMARY KEY,
    hora_inicio   TIME  NOT NULL,
    hora_final    TIME  NOT NULL,
    descriccion   VARCHAR(150)
);

-- 9. CARGA ACADÉMICA

CREATE TABLE carga_seccion_materia (
    id_carga      SERIAL PRIMARY KEY,
    id_profesor   INT NOT NULL,
    id_materia    INT NOT NULL,
    id_seccion    INT NOT NULL,
    id_horario    INT NOT NULL,
    dia_semana    VARCHAR(15) NOT NULL CHECK (dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')),

    -- RESTRICCIONES LÓGICAS IMPORTANTES:

    -- 1. Choque de Aulas: Una sección no puede tener dos materias a la misma hora el mismo día.
    UNIQUE (id_seccion, id_horario, dia_semana),



    -- Relaciones (Foreign Keys)
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor),
    FOREIGN KEY (id_materia)  REFERENCES materias(id_materia),
    FOREIGN KEY (id_seccion)  REFERENCES seccion(id_seccion),
    FOREIGN KEY (id_horario)  REFERENCES horrario(id_horario)
);



-- 10. PERIODOS (TRIMESTRES)
CREATE TABLE periodos (
    id_periodo      SERIAL PRIMARY KEY,
    periodo          VARCHAR(50) NOT NULL,
    numero_periodo  INT NOT NULL CHECK (numero_periodo BETWEEN 1 AND 3),
    id_year         INT NOT NULL,

    UNIQUE (periodo, id_year),
    UNIQUE (numero_periodo, id_year),

    FOREIGN KEY (id_year) REFERENCES year_academico(id_year)
);

-- 11. CRITERIOS
CREATE TABLE criterios (
    id_criterio   SERIAL PRIMARY KEY,
    criterio        VARCHAR(100) NOT NULL,
    porcentaje    FLOAT NOT NULL CHECK (porcentaje BETWEEN 0 AND 100)
);

-- 12. NOTAS POR CRITERIO
CREATE TABLE notas_criterios (
    id_nota_criterio  SERIAL PRIMARY KEY,
    id_matricula      INT NOT NULL,
    id_carga          INT NOT NULL,
    id_periodo        INT NOT NULL,
    id_criterio       INT NOT NULL,
    valor             FLOAT NOT NULL CHECK (valor BETWEEN 0 AND 100),

    UNIQUE (id_matricula, id_carga, id_periodo, id_criterio),

    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_carga) REFERENCES carga_seccion_materia(id_carga),
    FOREIGN KEY (id_periodo) REFERENCES periodos(id_periodo),
    FOREIGN KEY (id_criterio) REFERENCES criterios(id_criterio)
);

-- 13. CALIFICACIONES POR TRIMESTRE
CREATE TABLE calificaciones_trimestre (
    id_calificacion_trimestre SERIAL PRIMARY KEY,
    id_matricula     INT NOT NULL,
    id_carga         INT NOT NULL,
    id_periodo       INT NOT NULL,
    promedio         FLOAT NOT NULL CHECK (promedio BETWEEN 0 AND 100),

    UNIQUE (id_matricula, id_carga, id_periodo),

    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_carga) REFERENCES carga_seccion_materia(id_carga),
    FOREIGN KEY (id_periodo) REFERENCES periodos(id_periodo)
);

