create or replace NONEDITIONABLE PROCEDURE p_darVuelta (frase IN VARCHAR2) IS
    v_vuelta VARCHAR2(30):=frase;
    v_invertido VARCHAR2(20):='';
    v_char VARCHAR2(1):='';
BEGIN
    for contador IN REVERSE 1..length(v_vuelta)loop
    v_char:=substr(v_vuelta,contador,1);
    v_invertido:=v_invertido || v_char;
    dbms_output.put_line(v_invertido);--Puesto para ver como va añadiendo
    end loop;
    dbms_output.put_line(v_invertido);
END; 