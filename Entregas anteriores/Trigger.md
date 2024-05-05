
## TRIGGERS

### PRIMER TRIGGER
#### Quiero implementar un trigger que registre los cambios en el precio de un libro, por lo que necesito un tabla donde se registre esta informacion.  El trigger `registrar_cambio_precio` se activa después de que se actualiza un registro en la tabla `LIBRO`. Para cada fila actualizada, verifica si el precio anterior (`OLD.PRECIO`) es diferente al nuevo precio (`NEW.PRECIO`). Si hay un cambio de precio, registra los detalles del cambio, incluyendo el ID del libro, el precio anterior y el nuevo precio, en la tabla de auditoría `AuditoriaCambiosPrecio`. Esto permite mantener un historial de todos los cambios de precios realizados en los libros, lo que proporciona una trazabilidad completa de las modificaciones de precios en la base de datos.


```CREATE TABLE AuditoriaCambiosPrecio (
    ID_AUDITORIA INT AUTO_INCREMENT PRIMARY KEY,
    ID_LIBRO INT,
    PRECIO_ANTERIOR DECIMAL(10, 2),
    NUEVO_PRECIO DECIMAL(10, 2),
    FECHA_CAMBIO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);```


```DELIMITER //

CREATE TRIGGER registrar_cambio_precio
AFTER UPDATE ON LIBRO
FOR EACH ROW
BEGIN
    IF OLD.PRECIO != NEW.PRECIO THEN
        INSERT INTO AuditoriaCambiosPrecio (ID_LIBRO, PRECIO_ANTERIOR, NUEVO_PRECIO)
        VALUES (NEW.ID_LIBRO, OLD.PRECIO, NEW.PRECIO);
    END IF;
END//

DELIMITER ;```

