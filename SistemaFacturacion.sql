DROP DATABASE IF EXISTS facturacion;
CREATE DATABASE facturacion;
USE facturacion;

CREATE TABLE tipo_usuario (
    id int not null auto_increment primary key,
    nombre varchar(25) not null
);
CREATE TABLE usuario (
id int not null auto_increment primary key,
nombre_usuario varchar (45) not null,
contraseña_usuario varchar (45) not null,
id_tipo_usuario int not null,
fecha_registro date,
foreign key (id_tipo_usuario) references tipo_usuario (id)
);
CREATE TABLE cliente (
id int not null auto_increment primary key,
nombre varchar (50) not null, 
DNI varchar (11) not null,
direccion varchar (20) not null,
telefono varchar (20) not null,
correo varchar (20) not null,
fecha_registro date,
id_usuario int not null,
habilitado boolean default 1,
foreign key (id_usuario) references usuario (id)
);
CREATE TABLE tipo_empleado (
id int not null primary key,
nombre varchar (45) not null
);
CREATE TABLE empleado (
id int not null auto_increment primary key,
nombre varchar (50) not null,
DNI varchar (11) not null,
direccion varchar (20) not null,
telefono varchar (20) not null,
correo varchar (20) not null,
legajo varchar (20) not null,
fecha_registro date,
id_tipo_empleado int not null,
id_usuario int not null,
habilitado boolean default 1,
foreign key (id_tipo_empleado) references tipo_empleado (id),
foreign key (id_usuario) references usuario(id)
);
CREATE TABLE tipo_proveedor (
id int not null primary key,
nombre varchar (45) not null
);
CREATE TABLE proveedores (
id int not null auto_increment primary key,
nombre varchar (50) not null,
DNI varchar (11) not null,
direccion varchar (20) not null,
telefono varchar (20) not null,
correo varchar (20) not null,
fecha_registro date,
id_usuario int not null,
id_tipo_proveedor int not null,
habilitado boolean default 1,
foreign key (id_usuario) references usuario(id),
foreign key (id_tipo_proveedor) references tipo_proveedor (id)
);
CREATE TABLE producto (
id int not null auto_increment primary key,
nombre varchar (50) not null,
precio double not null,
cant int not null,
descripcion varchar (500) not null,
id_proveedor int not null,
habilitado boolean default 1,
foreign key (id_proveedor) references proveedores(id)
);
CREATE TABLE factura (
id int not null auto_increment primary key,
id_cliente int not null,
id_empleado int not null,
id_producto int not null,
subtotal double not null,
descuento int not null,
total double not null,
fecha_registro date,
foreign key (id_cliente) references cliente(id),
foreign key (id_empleado) references empleado(id),
foreign key (id_producto) references producto(id)
);
