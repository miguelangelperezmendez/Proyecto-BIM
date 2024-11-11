	
    -- 			CREACION DEL PROCEDIMIENTO ALMACENADO
    
drop procedure retirar_saldo;

	-- DESCRIPCION:			RETIRAR_SALDO: 
    --      Este procedimiento almacenado simula un retiro de dinero de un cajero automatico:
    -- 		Solicita al usuario su id, contraseña y el monto que desea retirar, si el id y usuario son correctos procede a verificar si existe la cantidad de dinero 
    -- 		que se desea retirar y posteriormente despachar al usuario la cantidad solicitada y actualizar el saldo disponible. Si la contraseña no coincide con el usuario 
    -- 		lanza un mensaje de error indicando que las credenciales no son correctas, y si la cantidad que se desea retirar es mayor al saldo que posee el usuario se lanza 
    -- 		un mensaje de error indicando que no se cuenta con el saldo suficiente para realizar dicha transaccion: 
    
    --  				PASO 1:
    -- 		CREACION DE PROCEDIMIENTO ALMACENDO PARA RETIRAR DINERO DE UN CAJERO AUTOMATICO (ejecutar codigo):
delimiter $$
CREATE PROCEDURE RETIRAR_SALDO (
    IN p_id_usuario INT,
    IN p_contraseña VARCHAR(15),
    IN p_retiro DECIMAL(10, 2)
)
BEGIN
    DECLARE v_contraseña VARCHAR(15);
    DECLARE v_dinero_disponible DECIMAL(10, 2);

    -- Obtener la contraseña del usuario
    SELECT CONTRASEÑA INTO v_contraseña 
    FROM INFORMACION_USUARIO 
    WHERE ID_USUARIO = p_id_usuario;

    -- Verificar la contraseña
    IF v_contraseña = p_contraseña THEN
        -- Obtener saldo disponible
        SELECT DINERO_DISPONIBLE INTO v_dinero_disponible 
        FROM INFORMACION_USUARIO 
        WHERE ID_USUARIO = p_id_usuario;

        -- Comprobar si hay saldo suficiente
        IF v_dinero_disponible >= p_retiro THEN
            -- Actualizar saldo disponible
            UPDATE INFORMACION_USUARIO 
            SET DINERO_DISPONIBLE = DINERO_DISPONIBLE - p_retiro 
            WHERE ID_USUARIO = p_id_usuario;

            SELECT 'TRANSACCION REALIZADA CON EXITO, TOME SU EFECTIVO Y RETIRE SU TARJETA' AS Mensaje;
            SELECT 'SU SALDO ACTUAL AHORA ES DE: ' as Mensaje2;
            SELECT dinero_disponible from INFORMACION_USUARIO where id_usuario = p_id_usuario;
            
        ELSE
            SELECT 'NO CUENTA CON SALDO SUFICIENTE PARA REALIZAR EL RETIRO, SELECCIONE UNA CANTIDAD MENOR' AS Mensaje;
        END IF;
    ELSE
        SELECT 'CONTRASEÑA INCORRECTA: NO CORRESPONDE AL USUARIO' AS Mensaje;
    END IF;
END $$
delimiter ;

-- 			PASO 2:
	-- MANDAMOS A LLAMAR AL PROCEDIMIENTO ALMACENADO Y LE PASAMOS LOS VALORES DE: ID, CONTRASEÑA Y MONTO QUE QUEREMOS RETIRAR:
call retirar_saldo(1, '12345', 500);