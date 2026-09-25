use TiendaTechDB;
go

/* ------ ACTIVIDAD 4------*/

--SUBCONSULTA---
--Productos con precio mayor al promedio--
--Busca identificar los electrodomésticos cuyo precio está por encima del precio promedio de todos los productos registrados

SELECT 
    IdProducto,
    Nombre,
    Categoria,
    Precio
FROM Producto
WHERE Precio > (
    SELECT AVG(Precio)
    FROM Producto
);
GO

-- Una alternativa sería calcular el promedio mediante una consulta separada y después utilizar manualmente ese valor
--Pero no seria dinamico, si se añaden mas productos, este calculo cambiaria. Por lo que es mejor poner la subconsulta


--EXIST--
--Este query permite identificar los clientes que tienen al menos una venta registrada en detalleVenta---
--Para cada cliente se comprueba si existe algun registro en detalleVenta
SELECT 
    c.IdCliente,
    c.Nombre,
    c.Apellidos,
    c.Correo
FROM Cliente c
WHERE EXISTS (
    SELECT 1
    FROM detalleVenta dv
    WHERE dv.IdCliente = c.IdCliente
);
GO
