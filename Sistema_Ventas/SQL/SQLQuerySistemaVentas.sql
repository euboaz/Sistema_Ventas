/*CREACION DE LA BASE DE DATOS SISTEMA DE VENTAS*/

create database Sistema_Ventas


/*CREACION DE TABLA CAJEROS*/

create table Mae_Cajeros
(
Codigo_Cajero int identity (1000,1),
Nombre_Cajero nvarchar(50) not null,
Apellidos_Cajero nvarchar(50) not null
CONSTRAINT PK_Codigo_Cajero Primary Key(Codigo_Cajero)
)

/*QUERY PARA AGREGAR 2 CAJEROS*/

insert into Mae_Cajeros values ('Eusebio','Bogantes Azofeifa')
insert into Mae_Cajeros values ('Maria','Fernandez Gomez')

/*QUERY REVISAR DATOS INGRESADOS*/
select * from Mae_Cajeros


/*CREACION DE TABLA PRODUCTOS*/
create table Mae_Productos
(
Codigo_Producto int identity (2000,1),
Nombre_Producto nvarchar (100) not null,
Precio_Producto float default 0
CONSTRAINT PK_Codigo_Producto Primary Key (Codigo_Producto),
)

/*QUERY PARA AGREGAR 3 PRODUCTOS*/
insert into Mae_Productos values ('Celular',850),('Estuche',150),('Cargador',200)
/*QUERY REVISAR DATOS INGRESADOS*/
select * from Mae_Productos


/*CREACION DE TABLA MAQUINAS REGISTRADORAS*/
create table Mae_Maquinas_Registradoras
(
Codigo_MaqRegis int identity (3000,1),
Piso_MaqRegis int,
CONSTRAINT PK_Codigo_MaqRegis Primary Key (Codigo_MaqRegis),
)

/*QUERY PARA AGREGAR 2 MAQUINAS REGISTRADORAS*/
insert into Mae_Maquinas_Registradoras values (1),(2)
/*QUERY REVISAR DATOS INGRESADOS*/
select * from Mae_Maquinas_Registradoras

/*CREACION DE TABLA VENTAS*/
create table Ventas
(
Codigo_Venta int identity (4000,1),
Fecha_Venta date default GETDATE(),
Codigo_Cajero int,
Codigo_Producto int,
Codigo_MaqRegis int
CONSTRAINT PK_Codigo_Venta Primary Key (Codigo_Venta)
FOREIGN KEY (Codigo_Cajero) REFERENCES Mae_Cajeros(Codigo_Cajero),FOREIGN KEY (Codigo_Producto) REFERENCES Mae_Productos(Codigo_Producto),FOREIGN KEY (Codigo_MaqRegis) REFERENCES Mae_Maquinas_Registradoras(Codigo_MaqRegis)
)

/*QUERY PARA INGRESAR VENTAS*/

insert into ventas (Codigo_Cajero,Codigo_Producto,Codigo_MaqRegis)values (1000,2000,3000)
insert into ventas (Codigo_Cajero,Codigo_Producto,Codigo_MaqRegis)values (1001,2000,3001)


/*QUERY REVISAR DATOS INGRESADOS*/
select * from Ventas

/*QUERY PARA ACTUALIZAR DATOS*/

Update Mae_Cajeros set Nombre_Cajero = 'Keylor', Apellidos_Cajero = 'Navas Gamboa' where Codigo_Cajero = 1000
Update Mae_Productos set Precio_Producto = 900 where Nombre_Producto = 'Celular'

select * from Mae_Cajeros
select * from Mae_Productos

/*QUERY PARA INFORME DE DATOS*/

select C.Nombre_Cajero,C.Apellidos_Cajero,P.Nombre_Producto,P.Precio_Producto,MR.Piso_MaqRegis,MR.Codigo_MaqRegis from Ventas v inner join Mae_Cajeros C on C.Codigo_Cajero=V.Codigo_Cajero inner join Mae_Productos P on P.Codigo_Producto = V.Codigo_Producto inner join Mae_Maquinas_Registradoras MR on MR.Codigo_MaqRegis = V.Codigo_MaqRegis





