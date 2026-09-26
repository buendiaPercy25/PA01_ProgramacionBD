/* ------ ACTIVIDAD 3------*/

use TechDB;
go

-- INER JOIN ---
---Mostrar las ventas que tuvo la empresa. Nos mostrara las ventas que tiene un cliente y un producto relacionado ---
SELECT 
    dv.IdDetalleVenta,
    c.Nombre + ' ' + c.Apellidos AS Cliente,
    c.DNI,
    c.Distrito,
    p.Nombre AS Producto,
    p.Categoria,
    dv.FechaVenta,
    dv.Cantidad,
    p.Precio,
    dv.Cantidad * p.Precio AS TotalVenta
FROM detalleVenta dv
INNER JOIN Cliente c 
    ON dv.IdCliente = c.IdCliente
INNER JOIN Producto p 
    ON dv.IdProducto = p.IdProducto;
GO


-- CASE ---
--Usamos Case para identificar el tamaño de las ventas en base a la cantidad de artículos que se compraron
--Esto puede servir para poder seleccionar empaques para su envió
    SELECT 
    c.Nombre + ' ' + c.Apellidos AS Cliente,
    p.Nombre AS Producto,
    dv.Cantidad,
    CASE
        WHEN dv.Cantidad >= 5 THEN 'Compra grande'
        WHEN dv.Cantidad >= 3 THEN 'Compra mediana'
        ELSE 'Compra pequeña'
    END AS TipoCompra,
    dv.FechaVenta
FROM detalleVenta dv
INNER JOIN Cliente c
    ON dv.IdCliente = c.IdCliente
INNER JOIN Producto p
    ON dv.IdProducto = p.IdProducto;
GO

-- OUTER JOIN: LEFT JOIN ---
--El foco esta en la tabla Clientes. Lista de todos los clientes aunque no hayan realizado alguna compra--
SELECT 
    c.IdCliente,
    c.Nombre + ' ' + c.Apellidos AS Cliente,
    c.Correo,
    dv.IdDetalleVenta,
    dv.FechaVenta
FROM Cliente c
LEFT OUTER JOIN detalleVenta dv
    ON c.IdCliente = dv.IdCliente
ORDER BY c.IdCliente;
GO

-- Union ---
--De dos consultas que contiene campos en comun se unen. La segunda se añade a la primera--
SELECT 
    IdCliente,
    Nombre,
    Apellidos,
    Edad,
    'Menor de 50 años' AS Grupo
FROM Cliente
WHERE Edad < 50

UNION

SELECT 
    IdCliente,
    Nombre,
    Apellidos,
    Edad,
    'Mayor de 50 años' AS Grupo
FROM Cliente
WHERE Edad >= 50;
GO