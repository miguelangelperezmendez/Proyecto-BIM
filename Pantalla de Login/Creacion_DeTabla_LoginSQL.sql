
--    		PASO 1:
--   	CREAMOS LA BASE DE DATOS PARA EL PROYECTO:
Create database MiBaseDeDatos;

use Mibasededatos;

-- 				PASO 2:
-- 			CREACION DE TABLA 'LOGIN':
-- 		Esta es la tabla que utilizaremos para el proyecto de la creacion de una ventana de login en java con la libreria Swing 
create table login (nombreUsuario varchar(40) primary key, contraseña varchar(40) ) ; 

-- 				PASO 3:
-- 			INSERTAR DATOS DE USUARIO:
-- 		Estos son los datos de usuario que utilizaremos de ejemplo:
insert into login (nombreUsuario, contraseña) values('AlejandroRamirez', '12345' ); 
insert into login (nombreUsuario, contraseña) values('CarlosTorres', '123456' ); 
insert into login (nombreUsuario, contraseña) values('MisaelLopez', '1234567' ); 
insert into login (nombreUsuario, contraseña) values('YadiraJimenez', '12345678' ); 
insert into login (nombreUsuario, contraseña) values('KarlaZacarias', '123456789' ); 

commit;