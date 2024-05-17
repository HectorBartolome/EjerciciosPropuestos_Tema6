--Crea un procedimiento que saque la fecha del viaje que conduce el conductor con número de
--Empleado más bajo. No necesita parámetros de entrada.
CREATE OR REPLACE PROCEDURE SACAFECHA
IS
    V_FECHA DATE;
    V_MINIMOID VARCHAR(8);
BEGIN
    
    SELECT MIN(ID_EMPLEADOS)
    INTO V_MINIMOID
    FROM EMPLEADOS;

    SELECT FECHA_VIAJE
    INTO V_FECHA
    FROM VIAJES
    WHERE ID_EMPLEADOS=V_MINIMOID;
     
    DBMS_OUTPUT.PUT_LINE(V_FECHA, 'DD/MM/YYYY');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO SE ENCONTRO LA FECHA');
END;
/