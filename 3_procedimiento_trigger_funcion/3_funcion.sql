CREATE OR REPLACE FUNCTION fn_ver_boletin_estudiante(
    p_id_estudiante INT, 
    p_year INT
)
RETURNS TABLE (
    asignatura VARCHAR,
    nota_trimestre_1 NUMERIC,
    nota_trimestre_2 NUMERIC,
    nota_trimestre_3 NUMERIC,
    promedio_final   NUMERIC,
    letra            VARCHAR(2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.materia,
        -- Obtenemos la nota del Periodo 1
        ROUND(MAX(CASE WHEN p.numero_periodo = 1 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END), 2) AS t1,
        
        -- Obtenemos la nota del Periodo 2
        ROUND(MAX(CASE WHEN p.numero_periodo = 2 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END), 2) AS t2,
        
        -- Obtenemos la nota del Periodo 3
        ROUND(MAX(CASE WHEN p.numero_periodo = 3 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END), 2) AS t3,
        
        -- Calculamos el Promedio Anual (Sumando los maximos encontrados y dividiendo entre 3)
        -- Nota: Usamos NULLIF para evitar división por cero si algo falla
        ROUND(
            (
              MAX(CASE WHEN p.numero_periodo = 1 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 2 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 3 THEN COALESCE(ct.promedio::numeric, 0) ELSE 0 END)
            ) / 3.0, 
        2) AS final_avg,

        -- Literal
        CASE 
            WHEN (
              MAX(CASE WHEN p.numero_periodo = 1 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 2 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 3 THEN COALESCE(ct.promedio, 0) ELSE 0 END)
            ) / 3.0 >= 90 THEN 'A'
            
            WHEN (
              MAX(CASE WHEN p.numero_periodo = 1 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 2 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 3 THEN COALESCE(ct.promedio, 0) ELSE 0 END)
            ) / 3.0 >= 80 THEN 'B'
            
            WHEN (
              MAX(CASE WHEN p.numero_periodo = 1 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 2 THEN COALESCE(ct.promedio, 0) ELSE 0 END) +
              MAX(CASE WHEN p.numero_periodo = 3 THEN COALESCE(ct.promedio, 0) ELSE 0 END)
            ) / 3.0 >= 70 THEN 'C'
            
            ELSE 'F'
        END::VARCHAR(2) AS letra

    FROM matriculas mat
    JOIN estudiantes e ON mat.id_estudiante = e.id_estudiante
    JOIN seccion s ON mat.id_seccion = s.id_seccion
    JOIN year_academico y ON s.id_year = y.id_year
 
    JOIN carga_seccion_materia csm ON s.id_seccion = csm.id_seccion
    JOIN materias m ON csm.id_materia = m.id_materia
 
    JOIN periodos p ON p.id_year = y.id_year
   
    LEFT JOIN calificaciones_trimestre ct ON 
        ct.id_matricula = mat.id_matricula AND 
        ct.id_carga = csm.id_carga AND 
        ct.id_periodo = p.id_periodo
    WHERE 
        mat.id_estudiante = p_id_estudiante 
        AND y.year_academico = p_year
    GROUP BY m.materia
    ORDER BY m.materia;
END;
$$;


--SELECT * FROM fn_ver_boletin_estudiante(50, 2024);