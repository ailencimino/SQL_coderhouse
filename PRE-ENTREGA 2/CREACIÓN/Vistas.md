# SEGUNDA ENTREGA

## CONSIGNAS: 
### Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.

## LISTADO DE VISTAS
### 1. Vista: libro_mas_vendido_anio

### En esta priemra  vista me muestra  el título del libro más vendido del año 2023, junto con la cantidad total de unidades vendidas. Lo quiero encontrar el libro mas vendido del año 2023 para que el equipo de marketing de la libreria pueda hacer un posteo comercial con este libro.   El objetivo principal de esta vista es proporcionar información sobre el libro más vendido del año 2023 para su uso en estrategias de marketing y promoción. Al conocer cuál es el libro más popular entre los clientes durante ese período, el equipo de marketing puede dirigir sus esfuerzos.
### Tablas involucradas: La vista está basada en las tablas de "venta" y "libro". 

`CREATE VIEW libro_mas_vendido_anio AS
SELECT l.TITULO AS libro_mas_vendido, COUNT(*) AS cantidad_vendida
FROM venta v
JOIN libro l ON v.ID_LIBRO = l.ID_LIBRO
WHERE YEAR(v.FECHA_VENTA) = 2023
GROUP BY v.ID_LIBRO
ORDER BY cantidad_vendida DESC
LIMIT 1;`

### 2. Vista: clientes_con_mas_compras_ultimo_mes

### Esta vista muestra los clientes que han realizado más compras durante el último mes, considerando específicamente los meses de noviembre y diciembre. Se utiliza para identificar a los clientes más activos en el período previo a las vacaciones de verano y recompensarlos con un voucher del 50% de descuento para vacaciones de verano.
### Tablas involucradas: Esta vista se basa principalmente en la tabla de "venta" para obtener datos sobre las transacciones de compra de los clientes. Además, puede requerir información adicional de la tabla "cliente" para identificar a los clientes por su nombre u otros detalles de contacto.

`CREATE VIEW clientes_mas_compras_ultimo_mes AS
SELECT c.NOMBRE AS nombre_cliente, c.APELLIDO AS apellido_cliente, c.TELEFONO, c.CORREO, COUNT(*) AS total_compras
FROM venta v
JOIN cliente c ON v.ID_CLIENTE = c.ID_CLIENTE
WHERE YEAR(v.FECHA_VENTA) = 2023
AND MONTH(v.FECHA_VENTA) IN (11, 12) -- Filtrar por noviembre (mes 11) y diciembre (mes 12) del año 2023
GROUP BY v.ID_CLIENTE
ORDER BY total_compras DESC;`


### 3 Vista: empleado_mas_ventas_2023
### Esta vista le permite a recursos humanos identificar al empleado que realizó más ventas en el año 2023 para diseñar una campaña de incentivos.
### Tablas involucradas: venta: Contiene los registros de las ventas realizadas y la tabla de empleados. 

`CREATE VIEW empleado_mas_ventas_2023 AS
SELECT e.NOMBRE AS nombre_empleado, e.APELLIDO AS apellido_empleado, e.CARGO, e.TELEFONO, e.CORREO, COUNT(*) AS total_ventas
FROM venta v
JOIN empleados e ON v.ID_EMPLEADO = e.ID_EMPLEADO
WHERE YEAR(v.FECHA_VENTA) = 2023
GROUP BY v.ID_EMPLEADO
ORDER BY total_ventas DESC
LIMIT 1;`