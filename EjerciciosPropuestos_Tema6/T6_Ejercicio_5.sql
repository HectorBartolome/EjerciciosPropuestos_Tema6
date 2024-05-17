-------------------------------1----------------------------
CREATE OR REPLACE PROCEDURE SACADNI(
CODIGOEMP IN VARCHAR2) IS
    V_DNI VARCHAR(10);
    V_CODIGOEMP VARCHAR2(30):=CODIGOEMP;
BEGIN
    SELECT d.dni
    INTO V_DNI
    FROM empleados E, datospersonales D
    WHERE e.id_empleado=d.clave_empleado
    AND e.id_empleado=V_CODIGOEMP;

    DBMS_OUTPUT.PUT_LINE(V_DNI);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO HAY DNI');
END;
/
--LLAMAR PROCEDIMIENTO
BEGIN
    SACADNI('EMP01');
END;
/
-------------------------------2----------------------------
CREATE OR REPLACE FUNCTION NumEmpleado
RETURN NUMBER
IS
    v_numero NUMBER;
    v_cero EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO v_numero
    FROM empleados e, departamento d
    WHERE e.id_departamento=d.id_departamento
    AND d.nombre='Personal';

    IF v_numero=0 THEN
        RAISE v_cero;
    END IF;

    RETURN v_numero;

EXCEPTION
    WHEN v_cero THEN
        DBMS_OUTPUT.PUT_LINE('ES CEROOOO');
END;
/
--LLAMAR FUNCION
SELECT NumEmpleado() FROM dual;
-------------------------------3----------------------------
CREATE OR REPLACE FUNCTION SACAEMPLEADOS (
DEPARTAMENTO VARCHAR2)
RETURN NUMBER IS
    V_DEPARTAMENTO VARCHAR(30):=DEPARTAMENTO;
    V_NUMEMPLEADOS NUMBER;
    V_CERO EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO V_NUMEMPLEADOS
    FROM EMPLEADOS E, DEPARTAMENTO D
    WHERE e.id_departamento=d.id_departamento
    AND d.nombre=V_DEPARTAMENTO;
    
    IF V_NUMEMPLEADOS=0 THEN
        RAISE V_CERO;
    END IF;
    
    RETURN V_NUMEMPLEADOS;
    
EXCEPTION
    WHEN V_CERO THEN
        DBMS_OUTPUT.PUT_LINE('NO HAY NINGUN EMPLEADO CON ESE CODIGO DE DEPARTAMENTO');
END;
/
--LLAMADA FUNCION
SELECT sacaempleados('Almacen') FROM DUAL