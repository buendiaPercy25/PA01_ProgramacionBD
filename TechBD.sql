create database TechDB;
go

use TechDB;
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
