USE TiendaTechDB;
GO

-- ACTIVIDAD 2.
-- CONSULTAS DE SELECCIÓN, FILTROS Y AGRUPACIÓN

-- 1. CONSULTA WHERE

-- Identificar clientes que tienen 30 años o más.


SELECT
    IdCliente,
    Nombre,
    Apellidos,
    Edad
FROM Cliente
WHERE Edad >= 30;

-- 2. CONSULTA LIKE

-- Identificar clientes cuyo apellido empieza
-- con la letra R.

SELECT
    IdCliente,
    Nombre,
    Apellidos
FROM Cliente
WHERE Apellidos LIKE 'R%';

-- 3. CONSULTA BETWEEN

-- Identificar productos cuyo precio se encuentre
-- entre 200 y 600.

SELECT
    IdProducto,
    Nombre,
    Precio,
    Categoria
FROM Producto
WHERE Precio BETWEEN 200 AND 600;

-- 4. CONSULTA IN

-- Identificar productos de las categorías Cocina,
-- Limpieza y Personales.

SELECT
    IdProducto,
    Nombre,
    Precio,
    Categoria
FROM Producto
WHERE Categoria IN ('Cocina', 'Limpieza', 'Personales');

-- 5. FUNCIÓN DE CADENA

-- Mostrar los nombres de los productos en mayúsculas
-- para facilitar su visualización.

SELECT
    IdProducto,
    Nombre,
    UPPER(Nombre) AS NombreMayuscula,
    Categoria
FROM Producto;

-- 6. FUNCIÓN NUMÉRICA

-- Calcular el precio con un descuento del 10%
-- y mostrarlo con 2 decimales.

SELECT
    IdProducto,
    Nombre,
    Precio,
    ROUND(Precio * 0.90, 2) AS PrecioConDescuento
FROM Producto;

-- 7. FUNCIÓN DE FECHA

-- Identificar los clientes que nacieron desde
-- el año 2000 en adelante.

SELECT
    IdCliente,
    Nombre,
    Apellidos,
    FechaNacimiento,
    YEAR(FechaNacimiento) AS AnioNacimiento
FROM Cliente
WHERE YEAR(FechaNacimiento) >= 2000;

-- 8. FUNCIÓN DE AGREGACIÓN

-- Obtener la cantidad total de productos vendidos.

SELECT
    SUM(Cantidad) AS TotalProductosVendidos
FROM DetalleVenta;

-- 9. FUNCIONES DE AGREGACIÓN

-- Obtener el precio promedio, precio máximo
-- y precio mínimo de los productos.

SELECT
    AVG(Precio) AS PrecioPromedio,
    MAX(Precio) AS PrecioMaximo,
    MIN(Precio) AS PrecioMinimo
FROM Producto;

-- 10. GROUP BY

-- Identificar cuántos productos ha comprado
-- cada cliente.

SELECT
    IdCliente,
    SUM(Cantidad) AS TotalProductosComprados
FROM DetalleVenta
GROUP BY IdCliente;

-- 11. GROUP BY + HAVING

-- Identificar los clientes que hayan comprado
-- 3 productos o más.

SELECT
    IdCliente,
    SUM(Cantidad) AS TotalProductosComprados
FROM DetalleVenta
GROUP BY IdCliente
HAVING SUM(Cantidad) >= 3;

-- 12. GROUP BY + HAVING + AGREGACIÓN

-- Identificar las categorías cuyo precio promedio
-- sea superior a 1000.

SELECT
    Categoria,
    COUNT(*) AS CantidadProductos,
    AVG(Precio) AS PrecioPromedio
FROM Producto
GROUP BY Categoria
HAVING AVG(Precio) > 1000;
