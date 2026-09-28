-- TRIGGER
------------------------------------------------------------------------------------------------------------------
-- Este TRIGGER actualizará automáticamente el promedio final cada vez que se modifique la nota de un criterio
------------------------------------------------------------------------------------------------------------------

-- 1. CREAR LA FUNCIÓN 
CREATE OR REPLACE FUNCTION fn_actualizar_nota_trimestre()
RETURNS TRIGGER AS $$
DECLARE
    v_promedio_trimestral FLOAT;
BEGIN
    -- Calculamos la nota ponderada del trimestre para ese estudiante, carga y periodo
    -- (Suma de: valor de la nota * porcentaje del criterio / 100)
    SELECT SUM(nc.valor * (c.porcentaje / 100))
    INTO v_promedio_trimestral
    FROM notas_criterios nc
    JOIN criterios c ON nc.id_criterio = c.id_criterio
    WHERE nc.id_matricula = NEW.id_matricula
      AND nc.id_carga = NEW.id_carga
      AND nc.id_periodo = NEW.id_periodo;

    -- Si es NULL (primera nota), lo convertimos a 0 para evitar errores
    IF v_promedio_trimestral IS NULL THEN
        v_promedio_trimestral := 0;
    END IF;

    -- Insertamos o actualizamos (Upsert) en calificaciones_trimestre
    INSERT INTO calificaciones_trimestre (id_matricula, id_carga, id_periodo, promedio)
    VALUES (NEW.id_matricula, NEW.id_carga, NEW.id_periodo, v_promedio_trimestral)
    ON CONFLICT (id_matricula, id_carga, id_periodo)
    DO UPDATE SET promedio = EXCLUDED.promedio;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. CREAR EL TRIGGER 
-- Para que Cada vez que alguien toque la tabla notas_criterios ejecute la función fn_actualizar_nota_trimestre()"

CREATE TRIGGER trg_actualizar_promedio
AFTER INSERT OR UPDATE ON notas_criterios
FOR EACH ROW
EXECUTE FUNCTION fn_actualizar_nota_trimestre();