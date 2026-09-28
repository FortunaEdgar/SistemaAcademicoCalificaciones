
-- procedimientos almacenados

-------------------------------------------------
--matricular estudiante en una ceccion
----------------------------------------------
CREATE OR REPLACE PROCEDURE sp_inscribir_estudiante(
    p_id_estudiante INT, 
    p_id_seccion INT
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO matriculas (id_estudiante, id_seccion)
    VALUES (p_id_estudiante, p_id_seccion);
    

    RAISE NOTICE 'Estudiante % inscrito correctamente en sección %', p_id_estudiante, p_id_seccion;
END;
$$;


------------------------------
--calificar estudiante
-------------------------------
CREATE OR REPLACE PROCEDURE sp_calificar_estudiante(
    p_id_estudiante INT,  -- ID del estudiante
    p_id_materia    INT, -- ID de la materia
    p_year          INT,  -- Año 
    p_num_periodo   INT,  -- Trimestre (1, 2 o 3)
    p_id_criterio   INT,  -- Criterio (1=Examen, 2=Tarea, etc.)
    p_nota          FLOAT -- La nota (0 a 100)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_matricula INT;
    v_id_carga     INT;
    v_id_periodo   INT;
    v_id_year      INT;
BEGIN
    -- 1. Validar que la nota sea válida
    IF p_nota < 0 OR p_nota > 100 THEN
        RAISE EXCEPTION 'La nota debe estar entre 0 y 100. Valor enviado: %', p_nota;
    END IF;

    -- 2. Obtener el ID interno del Año Académico
    SELECT id_year INTO v_id_year FROM year_academico WHERE year_academico = p_year;
    
    IF v_id_year IS NULL THEN
        RAISE EXCEPTION 'El año académico % no existe.', p_year;
    END IF;

    -- 3. Obtener el ID del Trimestre
    SELECT id_periodo INTO v_id_periodo 
    FROM periodos 
    WHERE id_year = v_id_year AND numero_periodo = p_num_periodo;

    IF v_id_periodo IS NULL THEN
        RAISE EXCEPTION 'El periodo % para el año % no existe.', p_num_periodo, p_year;
    END IF;

    -- 4. Buscar la Matrícula del Estudiante y su Sección

    SELECT m.id_matricula
    INTO v_id_matricula
    FROM matriculas m
    JOIN seccion s ON m.id_seccion = s.id_seccion
    WHERE m.id_estudiante = p_id_estudiante AND s.id_year = v_id_year;

    IF v_id_matricula IS NULL THEN
        RAISE EXCEPTION 'El estudiante % no está matriculado en el año %.', p_id_estudiante, p_year;
    END IF;

    -- 5. Buscar la Carga Académica (id_carga)
    --    IMPORTANTE: Como una materia puede tener varios horarios (Lun, Mie, Vie),
    --    usamos LIMIT 1 para obtener cualquiera de los registros válidos de esa materia en esa sección.
    --    Esto es necesario para asociar la nota a la "clase" y no a un día específico.
    SELECT csm.id_carga 
    INTO v_id_carga
    FROM carga_seccion_materia csm
    JOIN matriculas m ON m.id_seccion = csm.id_seccion
    WHERE m.id_matricula = v_id_matricula 
      AND csm.id_materia = p_id_materia
    LIMIT 1;

    IF v_id_carga IS NULL THEN
        RAISE EXCEPTION 'El estudiante no tiene la materia % inscrita en su carga académica.', p_id_materia;
    END IF;

    -- 6. INSERTAR O ACTUALIZAR LA NOTA (Upsert)
    --    Gracias al Trigger que creamos antes, esto actualizará automáticamente el promedio final.
    INSERT INTO notas_criterios (id_matricula, id_carga, id_periodo, id_criterio, valor)
    VALUES (v_id_matricula, v_id_carga, v_id_periodo, p_id_criterio, p_nota)
    ON CONFLICT (id_matricula, id_carga, id_periodo, id_criterio)
    DO UPDATE SET valor = EXCLUDED.valor;

    RAISE NOTICE 'Calificación registrada exitosamente para el Estudiante ID: %', p_id_estudiante;

END;
$$;


-- Sintaxis: CALL sp_calificar_estudiante(id_est, id_mat, año, periodo, id_criterio, nota);

-- CALL sp_calificar_estudiante(5, 2, 2026, 1, 1, 90);