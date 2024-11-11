--          CREACION DE LA BASE DE DATOS QUE UTULIZAREMOS PARA EL EJERCICIO:

-- 		PASO 1
-- CREAMOS LA BASE DE DATOS CON LA QUE TRABAJAREMOS EN ESTE EJERCICIO 
CREATE DATABASE Mibasededatos;

use Mibasededatos;

-- 		PASO 2
	-- CREACION DE LA TABLA QUE UTILIZAREMOS CON LOS SIGUIENTES CAMPOS: 
CREATE TABLE INFORMACION_USUARIO (ID_USUARIO int(10) PRIMARY KEY AUTO_INCREMENT, NOMBRE VARCHAR(30), CONTRASEÑA VARCHAR(15), DINERO_DISPONIBLE decimal(10, 2));

-- 		PASO 3
	-- INSERTAMOS LOS VALORES DE EJEMPLO PARA PODER INTERACTUAR: 
INSERT INTO INFORMACION_USUARIO (CONTRASEÑA, NOMBRE, DINERO_DISPONIBLE) VALUES ( '12345', 'Juan Alfredo Ramirez Tepoz', 50000);
INSERT INTO INFORMACION_USUARIO (CONTRASEÑA, NOMBRE, DINERO_DISPONIBLE) VALUES ('56789', 'Tomás Luna Perez', 70000);