-- UNIVERSIDAD ESTATAL AMAZONICA
-- DENISIS PORTILLA
-- MEGACOMPU GESTION DE INVENTARIOS
CREATE DATABASE IF NOT EXISTS megacompu_gestion_inventario11;
USE megacompu_gestion_inventario11;



CREATE TABLE proveedor (
    id_proveedor int AUTO_INCREMENT,
    nombre_proveedor varchar(100),
    telefono varchar(20),
    direccion varchar(200),
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE empleado (
    id_empleado int AUTO_INCREMENT,
    nombres varchar(100),
    apellidos varchar(100),
    cargo varchar(150),
    telefono varchar(15),
    PRIMARY KEY (id_empleado)
);

CREATE TABLE cliente (
    id_cliente int AUTO_INCREMENT,
    nombre varchar(100),
    telefono varchar(20),
    direccion varchar(200),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE producto (
    id_producto int AUTO_INCREMENT,
    nombre_producto varchar(100),
    precio decimal(10,2),
    stock int,
    PRIMARY KEY (id_producto)
);


CREATE TABLE factura_compra (
    id_facturacompra int AUTO_INCREMENT,
    fecha date,
    subtotal decimal(10,2),
    iva decimal(10,2),
    total decimal(10,2),
    id_proveedor int,
    id_empleado int,
    PRIMARY KEY (id_facturacompra),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);


create table detalle_compra_producto (
	id_detalle_compra int auto_increment,
	cantidad int,
	precio decimal(10,2),
    subtotal decimal(10,2),
    descuento decimal(10,2),
    iva decimal(10,2),
    id_facturacompra int,
    id_producto int,
    primary key (id_detalle_compra),
    FOREIGN KEY (id_facturacompra) REFERENCES factura_compra(id_facturacompra),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);


create table factura_venta (
	id_facturaventa int auto_increment,
	fecha date,
	subtotal decimal(10,2),
    iva decimal(10,2),
    total decimal(10,2),
    id_cliente int,
    id_empleado int,
    primary key (id_facturaventa),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)	
);


create table detalle_venta_producto(
	id_detalle_venta int auto_increment,
    cantidad int,
    precio decimal(10,2),
    subtotal decimal(10,2),
    id_producto int,
    id_facturaventa int,
    primary key (id_detalle_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_facturaventa) REFERENCES factura_venta(id_facturaventa)
);




insert into empleado values
	(1, 'DenisiS','Portilla', 'Vendedora', '0982723301'),
	(2, 'Andrea', 'Ramirez','Cajera', '09922334411' ),
	(3, 'Derlyn', 'Aguinda', 'Gerente de Ventas', '094821490'),
	(4, 'Brigitte', 'Rosillo', 'Bodeguero', '0924344454'),
	(5, 'Luis', 'Mora', 'Administrador', '097333444'),
	(6, 'Diana', 'Castillo', 'Soporte Técnico', '096444555'),
	(7, 'Jorge', 'Ramirez', 'Administrador', '0994150447');


insert into cliente values
	(1, 'Pedro Sánchez', '098111111', 'Av. Quito 123'),
	(2, 'Lucía Vargas', '098222222', 'Calle Bolívar 456'),
	(3, 'Miguel Castro', '098333333', 'Av. Amazonas 789'),
	(4, 'Fernanda Ruiz', '098444444', 'Calle Sucre 321'),
	(5, 'Jorge Medina', '098555555', 'Av. 10 de Agosto 654'),
	(6, 'Paola Herrera', '098666666', 'Calle Colombia 987'),
	(7, 'Gabriela Ortiz', '098777777', 'Av. Naciones Unidas 111');


insert into producto values
	(1, 'Laptop Lenovo', 700.00, 10),
	(2, 'Laptop HP', 750.00, 15),
	(3, 'Mouse Logitech', 20.00, 30),
	(4, 'Teclado Genius', 25.00, 25),
	(5, 'Monitor Samsung', 180.00, 12),
	(6, 'Impresora Epson', 150.00, 8),
	(7, 'Disco Duro 1TB', 60.00, 20);


insert into Proveedor values
	(1, 'TechWorld', '097111111', 'Av. Universitaria 100'),
	(2, 'CompuCenter', '097222222', 'Calle Central 200'),
	(3, 'ElectroPC', '097333333', 'Av. Principal 300'),
	(4, 'MegaPC', '097444444', 'Calle Secundaria 400'),
	(5, 'ByteStore', '097555555', 'Av. Libertad 500'),
	(6, 'DigitalPlus', '097666666', 'Calle Moderna 600'),
	(7, 'InnovaTech', '097777777', 'Av. América 700');


insert into factura_Compra values
	(1, '2025-08-01', 700.00, 105.00, 805.00, 1, 3),
	(2, '2025-08-02', 1500.00, 225.00, 1725.00, 2, 6),
	(3, '2025-08-03', 400.00, 60.00, 460.00, 3, 2),
	(4, '2025-08-04', 200.00, 30.00, 230.00, 4, 5),
	(5, '2025-08-05', 1200.00, 180.00, 1380.00, 5, 1),
	(6, '2025-08-06', 500.00, 75.00, 575.00, 6, 7),
	(7, '2025-08-07', 300.00, 45.00, 345.00, 7, 4);


INSERT INTO factura_Venta VALUES
	(1, '2025-08-10', 700.00, 105.00, 805.00, 1, 2),
	(2, '2025-08-11', 150.00, 22.50, 172.50, 2, 1),
	(3, '2025-08-12', 400.00, 60.00, 460.00, 3, 4),
	(4, '2025-08-13', 250.00, 37.50, 287.50, 4, 5),
	(5, '2025-08-14', 600.00, 90.00, 690.00, 5, 6),
	(6, '2025-08-15', 1000.00, 150.00, 1150.00, 6, 7),
	(7, '2025-08-16', 200.00, 30.00, 230.00, 7, 3);



INSERT INTO detalle_compra_producto VALUES
	(1, 5, 700.00, 3500.00, 0.00, 525.00, 1, 1),
	(2, 10, 20.00, 200.00, 0.00, 30.00, 2, 3),
	(3, 8, 25.00, 200.00, 0.00, 30.00, 3, 4),
	(4, 3, 180.00, 540.00, 0.00, 81.00, 4, 5),
	(5, 4, 150.00, 600.00, 0.00, 90.00, 5, 6),
	(6, 6, 60.00, 360.00, 0.00, 54.00, 6, 7),
	(7, 2, 750.00, 1500.00, 0.00, 225.00, 7, 2);

INSERT INTO detalle_venta_producto VALUES
	(1, 1, 700.00, 700.00, 1, 1),
	(2, 2, 20.00, 40.00, 3, 2),
	(3, 1, 25.00, 25.00, 4, 3),
	(4, 1, 180.00, 180.00, 5, 4),
	(5, 2, 150.00, 300.00, 6, 5),
	(6, 5, 60.00, 300.00, 7, 6),
	(7, 1, 750.00, 750.00, 2, 7);

-- TAREA SEMANA 11
-- 1. Consulta de clientes y sus facturas de venta
SELECT c.id_cliente, c.nombre, c.telefono, f.id_facturaventa, f.total
FROM Cliente c
INNER JOIN Factura_venta f ON c.id_cliente = f.id_cliente
WHERE f.total > 100;

-- 2. Consulta de productos con stock bajo
SELECT id_producto, nombre_producto, precio, stock
FROM Producto
WHERE stock < 10;

-- 3. Consulta de compras realizadas a proveedores
SELECT f.id_facturacompra, f.fecha, f.total, p.nombre_proveedor
FROM Factura_Compra f
INNER JOIN Proveedor p ON f.id_proveedor = p.id_proveedor
WHERE f.fecha BETWEEN '2025-01-01' AND '2025-12-31';

-- 4. Consulta de ventas realizadas por empleados
SELECT e.id_empleado, e.nombres, e.apellidos, COUNT(f.id_facturaventa) AS total_ventas
FROM Empleado e
INNER JOIN Factura_venta f ON e.id_empleado = f.id_empleado
GROUP BY e.id_empleado, e.nombres, e.apellidos;