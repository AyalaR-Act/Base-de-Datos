-- Creamos una nueva base de datos llamada Gestion_Surectro
create database Gestion_Surectro;
use Gestion_surectro;
-- Creación de las tablas
-- Tabla categorias con sus atributos
Create table categorias (
id int primary key not null,
nombre varchar(45) not null,
descripcion varchar(45)
);
-- Tabla de productos con sus atributos
create table productos (
id_producto int primary key not null,
nombre varchar(45) not null,
precio decimal(10,2) not null,
stock int not null
);
-- Asignamos la relación entre las tablas
-- Alteramos la tabla productos y sobre de ella creamos la llave foranea 
-- Este paso puede ser descartado desde la creación de las tablas
ALTER TABLE productos
ADD COLUMN categorias_id int not null,
ADD CONSTRAINT fk_categorias_id FOREIGN KEY (categorias_id) REFERENCES categorias(id);
-- Creamos la tabla de proveedores
create table proveedores(
id_proveedor int primary key not null,
nombre varchar(45) not null,
telefono varchar(20),
pagina_web varchar(45)
);
-- Altermaos la tabla de proveedores, creación de la llave foranea
ALTER TABLE productos
ADD COLUMN proveedores_id int not null,
ADD CONSTRAINT fk_proveedores_id FOREIGN KEY (proveedores_id) REFERENCES proveedores(id_proveedor);

-- Existe una tabla relacional 1 a 1 con Proveedores 
-- Atributo multivalor 
CREATE TABLE direccion_proveedor (
    proveedores_id INT PRIMARY KEY,
    calle VARCHAR(100) not null,
    numero VARCHAR(20),
    colonia VARCHAR(50),
    ciudad VARCHAR(50) not null,
    FOREIGN KEY (proveedores_id) REFERENCES proveedores(id_proveedor) ON DELETE CASCADE
);
-- Creación de la tabla de clientes
Create table clientes(
id_cliente int primary key not null,
nombre varchar(45) not null
);
-- Creación de una tabla adicional para el atributo multivalor dirección_cliente
-- En ella solo podrá ingresar una unica dirección por cliente

CREATE TABLE direccion_clientes (
    clientes_id INT PRIMARY KEY,
    calle VARCHAR(100) not null,
    numero VARCHAR(20),
    colonia VARCHAR(50),
    ciudad VARCHAR(50) not null,
    FOREIGN KEY (clientes_id) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);
-- Creación de tabla telefonos para el atributo multivalor
CREATE TABLE telefonos (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL
);
-- Hacemos la vinculación entre las tablas con la llave foranea
ALTER TABLE telefonos
ADD COLUMN clientes_id int not null,
ADD CONSTRAINT fk_clientes_id FOREIGN KEY (clientes_id) REFERENCES clientes(id_cliente);

-- Creamos la tabla de ventas 
create table ventas (
id_venta int primary key not null,
fecha date not null,
descuento decimal(10,2)
);
-- Existe una relacion entre cliente y venta de 1 a n
-- Asignamos la llave foranea
ALTER TABLE ventas
ADD COLUMN clientes_id_v int not null,
ADD CONSTRAINT fk_clientes_id_v FOREIGN KEY (clientes_id_v) REFERENCES clientes(id_cliente);

-- La relacion de venta y productos es de n a n 
-- Muchos a muchos
create table detalle_venta(
id_detalle int primary key not null,
precio decimal (10,2) not null,
cantidad int not null
);

-- Elaboramos la relación muchos a muchos
-- Creamos una tabla sobre las ventas
CREATE TABLE detalle_venta (
    id_detalle INT PRIMARY KEY NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    ventas_id_ac INT,
    productos_id_ac INT,
    FOREIGN KEY (ventas_id_ac) REFERENCES ventas(id_venta),
    FOREIGN KEY (productos_id_ac) REFERENCES productos(id_producto)
);
