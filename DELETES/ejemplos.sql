CREATE FUNCTION verificar_disponibilidad_libro(titulo VARCHAR(100))
RETURNS BOOLEAN
READS SQL DATA
BEGIN
     DECLARE disponible BOOLEAN;

     SELECT COUNT(*) INTO disponibilidad FROM libro WHERE TITULO = titulo AND CANTIDAD_DISPONIBLE > 0;

     RETURN disponible;
END;


