create or replace NONEDITIONABLE PROCEDURE p_personal IS

    
    cursor c_nombre is
    select NOMBRE
    from EMPLEADOS;
    
    cursor c_alta is
    select FECHA_ALTA
    from DATOSPERSONALES;
    
    r_nombre EMPLEADOS%ROWTYPE;
    r_alta DATOSPERSONALES%ROWTYPE;
    
BEGIN

    for r_nombre in c_nombre loop
        DBMS_OUTPUT.PUT_LINE(r_nombre.nombre);
    end loop;
    
    for r_alta in c_alta loop
        DBMS_OUTPUT.PUT_LINE(r_alta.fecha_alta);
    end loop;


END; 