
-- 			MODULO DE MANTENIMIENTO CON PROCEDIMIENTOS ALMACENADOS

use Mibasededatos;

-- DESCRIPCION:			ACTUALIZAR_NOMBRE DE USUARIO:
		-- 	Este procedimiento almacenado realiza la actualizacion del nombre de usuario de un cliente, solicita el id, contraseña y el nombre que desea actualizar,
        --  Una vez ingresada esta informacion, el procedimiento comrpueba si el usuairo y la contraseña con correctas, y si es asi, se actualiza el nombre de usuario 
        --  del cliente. Si las credenciales no son correctas, envia un mensaje de error y no realiza la actualizacion del nombre de usuario.

-- 		PASO 1: EJECUTAR EL CODIGO PARA CREAR EL PROCEDIMIENTO ALMACENADO:
DELIMITER $$

CREATE PROCEDURE ACTUALIZAR_NOMBRE(
    IN P_ID_USUARIO INT,
    IN P_CONTRASEÑA VARCHAR(15), 
    IN NOMBRE_ACTUALIZADO VARCHAR(30)
)
BEGIN
    DECLARE v_contraseña VARCHAR(15);
    
    -- OBTENER CONTRASEÑA 
    SELECT CONTRASEÑA INTO v_contraseña 
    FROM INFORMACION_USUARIO 
    WHERE ID_USUARIO = P_ID_USUARIO;
    
    -- COMPROBAR SI LA CONTRASEÑA INGRESADA POR EL USUARIO CORRESPONDE AL ID
    IF v_contraseña = P_CONTRASEÑA THEN
        -- ACTUALIZAR EL NOMBRE DE USUARIO QUE INGRESÓ POR PARAMETRO:
        UPDATE INFORMACION_USUARIO 
        SET NOMBRE = NOMBRE_ACTUALIZADO
        WHERE ID_USUARIO = P_ID_USUARIO;
        SELECT 'NOMBRE DE USUARIO ACTUALIZADO' AS MENSAJE;
    ELSE 
        SELECT 'LA CONTRASEÑA ES INCORRECTA' AS MENSAJE;
    END IF;
END $$

DELIMITER ;

-- 			   PASO 2:
--  	LLAMAR AL PROCEDIMIENTO ALMACENADO PARA ACTUALIZAR NOMBRE, PASANDOLE EL ID, CONTRASEÑA Y EL NOMBRE DE USUARUIO NUEVO QUE DESEAMOS COLOCAR:
CALL ACTUALIZAR_NOMBRE(1, '12345', 'JOSÉ ALFREDO HERMANDEZ ');


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 	DESCRIPCION: 				ACTUALIZAR_CONTRASEÑA:
		-- Este procedimiento almacenado realiza el cambio de contraseña de un usuario. Solicita su id, contraseña actual y la nueva contraseña. Primero comprueba que el id y 
        -- la contraseña sean correctas, si son correctas realiza el cambio de contraseña, y si no son correctas manda un mensaje de error indicando que la contraseña 
        -- es incorrecta y no se realza ningun cambio. 
        
-- 		PASO 1:  EJECUTAR EL CODIGO PARA CREAR EL PROCEDIMIENTO ALMACENADO:
DROP PROCEDURE ACTUALIZAR_CONTRASEÑA;

DELIMITER $$
CREATE PROCEDURE ACTUALIZAR_CONTRASEÑA(
		IN P_ID_USUARIO INT,
        IN P_CONTRASEÑA VARCHAR(15),
        IN P_NUEVA_CONTRASEÑA VARCHAR(15)
	)
    BEGIN 
		DECLARE V_CONTRASEÑA varchar(15);
        
        -- OBTENER LA CONTRASEÑA DEL USUARIO
        SELECT CONTRASEÑA INTO V_CONTRASEÑA 
        FROM INFORMACION_USUARIO 
        WHERE ID_USUARIO = P_ID_USUARIO;
        
        -- COMPROBAR SI LA CONTRASEÑA ES CORRECTA
        IF V_CONTRASEÑA =  P_CONTRASEÑA THEN
			UPDATE INFORMACION_USUARIO 
            SET CONTRASEÑA = P_NUEVA_CONTRASEÑA
            WHERE ID_USUARIO = P_ID_USUARIO;
            SELECT 'CONTRASEÑA ACTUALIZADA CON EXITO' AS MENSAJE;
		ELSE
			SELECT 'CONTRASEÑA INCORRECTA, NO ES POSIBLE ACTUALIZAR LA CONTRASEÑA' AS MENSAJE;
		END IF;
END $$
DELIMITER ;

-- 			PASO 2:
-- 		LLAMAR AL PROCEDIMEINTO Y PASAR EL ID, CONTRASEÑA Y NUEVA CONTRASEÑA:
CALL ACTUALIZAR_CONTRASEÑA(2, 56789, 98765);

