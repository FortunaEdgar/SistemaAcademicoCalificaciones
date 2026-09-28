------------------------------------------------------------------------------------------------------
-- En este apartado generamos una transacción complejo que busca a un estudiante de 2026 
-- que aún no se ha calificado, se califica de forma automática e imprime cada etapa del proceso. 
-- Esto hace uso del procedimiento almacenado para agregar los registros a nota_criterios, del 
-- TRIGGER al momento de modificar nota_criterios y posteriormente de la función para consultar 
-- el resultado haciendo uso del ID y el año en cuestión, que para mayor facilidad es 2026.
--------------------------------------------------------------------------------------------------------

DO $$
DECLARE
    -- Variables para almacenar al estudiante encontrado
    v_id_estudiante INT;
    v_nombre_estudiante VARCHAR;
    
    -- Variables para los bucles
    rec_materia RECORD;   -- Para recorrer materias
    rec_criterio RECORD;  -- Para recorrer criterios
    v_periodo INT;        -- Para recorrer trimestres (1, 2, 3)
    
    -- Variables para la calificación
    v_nota_generada FLOAT;
    
BEGIN
    -- ---------------------------------------------------------
    -- PASO 1: Buscar un estudiante "virgen" de notas en 2026
    -- ---------------------------------------------------------
    SELECT e.id_estudiante, e.nombre
    INTO v_id_estudiante, v_nombre_estudiante
    FROM matriculas m
    JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
    JOIN seccion s ON m.id_seccion = s.id_seccion
    JOIN year_academico y ON s.id_year = y.id_year
    WHERE y.year_academico = 2026
    AND NOT EXISTS (
        -- Subconsulta: Que NO tenga registros en la tabla de calificaciones
        SELECT 1 FROM calificaciones_trimestre ct 
        WHERE ct.id_matricula = m.id_matricula
    )
    LIMIT 1; -- Solo queremos uno

    -- Si no encuentra a nadie, avisar y salir
    IF v_id_estudiante IS NULL THEN
        RAISE NOTICE '¡Todos los estudiantes del 2026 ya tienen calificaciones! No se hizo nada.';
        RETURN;
    END IF;

    RAISE NOTICE '>>> Iniciando proceso de calificación para: % (ID: %)', v_nombre_estudiante, v_id_estudiante;

    -- ---------------------------------------------------------
    -- PASO 2: Recorrer las Materias de ese estudiante
    -- ---------------------------------------------------------
    FOR rec_materia IN 
        SELECT DISTINCT m.id_materia, m.materia
        FROM carga_seccion_materia csm
        JOIN matriculas mat ON mat.id_seccion = csm.id_seccion
        JOIN materias m ON csm.id_materia = m.id_materia
        WHERE mat.id_estudiante = v_id_estudiante
    LOOP
        RAISE NOTICE '   > Asignando notas en materia: %', rec_materia.materia;

        -- -----------------------------------------------------
        -- PASO 3: Recorrer los 3 Periodos (Trimestres)
        -- -----------------------------------------------------
        FOR v_periodo IN 1..3 LOOP
            
            -- -------------------------------------------------
            -- PASO 4: Recorrer los Criterios (Examen, Tarea...)
            -- -------------------------------------------------
            FOR rec_criterio IN SELECT id_criterio, criterio FROM criterios LOOP
                
                -- Generar nota aleatoria entre 70 y 100 para aprobarlo
                v_nota_generada := floor(random() * (100 - 70 + 1) + 70);
                
                -- ---------------------------------------------
                -- PASO 5: LLAMAR AL PROCEDIMIENTO ALMACENADO
                -- ---------------------------------------------
                -- sp_calificar_estudiante(id_est, id_mat, año, periodo, id_criterio, nota)
                CALL sp_calificar_estudiante(
                    v_id_estudiante, 
                    rec_materia.id_materia, 
                    2026, 
                    v_periodo, 
                    rec_criterio.id_criterio, 
                    v_nota_generada
                );
                
            END LOOP; -- Fin Criterios
        END LOOP; -- Fin Periodos
    END LOOP; -- Fin Materias

    RAISE NOTICE '>>> PROCESO COMPLETADO. El estudiante % ha sido calificado exitosamente.', v_nombre_estudiante;

END $$;


-- cambia id_estudiante por el id que te de el NOTICE anterior
-- SELECT * FROM fn_ver_boletin_estudiante(id_estudiante, 2024);

