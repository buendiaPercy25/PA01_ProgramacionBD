create database TiendaTechDB;
go

use TiendaTechDB;
go 


create table Cliente(
IdCliente int primary key identity(1,1),
Nombre varchar(50) not null,
Apellidos varchar(100) not null,
Correo varchar(100) unique not null,
Edad int not null,
Telefono varchar(9) unique not null,
FechaNacimiento date not null,
Distrito varchar not null,
DNI varchar(8) unique not null
)
go

create table Producto(
IdProducto int primary key identity(1,1),
Nombre varchar(100) not null,
Precio decimal(10,2) not null,
Categoria varchar(30) not null check(Categoria in('Cocina','Refrigeracion','Lavado','Climatizacon','Limpieza','Personales')),
Cantidad int not null check(Cantidad >= 0)
)
go

create table detalleVenta(
IdDetalleVenta int primary key identity(1,1),
IdCliente int not null,
IdProducto int not null,
Cantidad int not null check(Cantidad > 0),
FechaVenta date not null,
foreign key (IdCliente) references Cliente(IdCliente),
foreign key (IdProducto) references Producto(IdProducto)
)
go

INSERT INTO Cliente (Nombre, Apellidos, Correo, Edad, Telefono, FechaNacimiento, Distrito, DNI)
VALUES
('Juan','Pérez','juanperez@gmail.com',30,'987654321','1996-05-10','Lima','12345678'),
('Ana','Ramírez','ana@gmail.com',25,'912345678','2001-03-15','Lima','87654321'),
('Luis','Torres','luis@gmail.com',40,'934567890','1986-07-20','Callao','23456789'),
('María','Gómez','maria@gmail.com',35,'945678901','1991-09-12','Lima','34567890'),
('Pedro','Sánchez','pedro@gmail.com',28,'956789012','1998-11-05','Cusco','45678901'),
('Carla','Fernández','carla@gmail.com',32,'967890123','1994-02-18','Arequipa','56789012'),
('José','Martínez','jose@gmail.com',29,'978901234','1997-04-25','Lima','67890123'),
('Lucía','Vargas','lucia@gmail.com',27,'989012345','1999-06-30','Piura','78901234'),
('Miguel','Rojas','miguel@gmail.com',33,'990123456','1993-08-14','Lima','89012345'),
('Rosa','Castro','rosa@gmail.com',31,'991234567','1995-10-22','Trujillo','90123456'),
('Diego','Flores','diego@gmail.com',26,'992345678','2000-12-01','Lima','11223344'),
('Sofía','Morales','sofia@gmail.com',24,'993456789','2002-01-10','Lima','22334455'),
('Andrés','Reyes','andres@gmail.com',36,'994567890','1990-03-19','Lima','33445566'),
('Paola','Salazar','paola@gmail.com',29,'995678901','1997-05-27','Lima','44556677'),
('Fernando','Cruz','fernando@gmail.com',38,'996789012','1988-07-04','Lima','55667788');

INSERT INTO Producto (Nombre, Precio, Categoria, Cantidad)
VALUES
('Refrigeradora LG',1200.50,'Refrigeracion',10),
('Cocina Mabe',850.00,'Cocina',15),
('Lavadora Samsung',950.75,'Lavado',12),
('Aire acondicionado Daikin',1500.00,'Climatizacion',8),
('Microondas Panasonic',400.00,'Cocina',20),
('Secadora Whirlpool',700.00,'Lavado',9),
('Ventilador Imaco',120.00,'Climatizacion',30),
('Aspiradora Electrolux',350.00,'Limpieza',25),
('Plancha Oster',90.00,'Personales',40),
('Refrigeradora Samsung',1350.00,'Refrigeracion',7),
('Cocina Indurama',780.00,'Cocina',18),
('Lavadora LG',980.00,'Lavado',11),
('Purificador de aire Xiaomi',500.00,'Climatizacion',14),
('Escoba electrica Imaco',150.00,'Limpieza',22),
('Secadora LG',800.00,'Lavado',10);


INSERT INTO detalleVenta (IdCliente, IdProducto, Cantidad, FechaVenta)
VALUES
-- Ventas en septiembre 2026
(1,1,2,'2026-09-23'),
(2,2,1,'2026-09-23'),
(3,3,1,'2026-09-24'),
(4,4,2,'2026-09-24'),
(5,5,1,'2026-09-25'),
(6,6,1,'2026-09-25'),
(7,7,3,'2026-09-26'),
(8,8,1,'2026-09-26'),
(9,9,2,'2026-09-27'),
(10,10,1,'2026-09-27'),

-- Ventas en octubre 2026
(11,11,1,'2026-10-01'),
(12,12,2,'2026-10-02'),
(13,13,1,'2026-10-03'),
(14,14,2,'2026-10-04'),
(15,15,1,'2026-10-05'),
(1,2,1,'2026-10-06'),
(2,3,2,'2026-10-07'),
(3,4,1,'2026-10-08'),
(4,5,3,'2026-10-09'),
(5,6,1,'2026-10-10'),

-- Ventas en noviembre 2026
(6,7,2,'2026-11-01'),
(7,8,1,'2026-11-02'),
(8,9,2,'2026-11-03'),
(9,10,1,'2026-11-04'),
(10,11,2,'2026-11-05'),
(11,12,1,'2026-11-06'),
(12,13,2,'2026-11-07'),
(13,14,1,'2026-11-08'),
(14,15,2,'2026-11-09'),
(15,1,1,'2026-11-10'),

-- Ventas en años anteriores (2024 y 2025)
(1,3,1,'2024-05-15'),
(2,4,2,'2024-06-20'),
(3,5,1,'2024-07-10'),
(4,6,2,'2025-03-12'),
(5,7,1,'2025-04-18'),
(6,8,2,'2025-05-25'),
(7,9,1,'2025-06-30'),
(8,10,2,'2025-07-22'),
(9,11,1,'2025-08-14'),
(10,12,2,'2025-09-05');
