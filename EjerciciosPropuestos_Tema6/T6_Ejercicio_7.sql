create or replace NONEDITIONABLE FUNCTION PAR (
NUMERO IN NUMBER)
RETURN VARCHAR
IS
    V_NUM NUMBER:=NUMERO;
    V_ESTADO VARCHAR2(10);
    V_NEGATIVO EXCEPTION;
BEGIN
    IF V_NUMERO<0 THEN
        RAISE V_NEGATIVO;
    END IF;

    IF MOD(NUMERO,2)=0 THEN 
        V_ESTADO:='TRUE';
    ELSE
        V_ESTADO:='FALSE';
    END IF;
    RETURN V_ESTADO;
EXCEPTION
    WHEN V_NEGATIVO THEN
    DBMS_OUTPUT.PUT_LINE('EL NUMERO INTRODUCIDO ES NEGATIVO');
    ;
END;
/
--LAMADA FUNCION
SELECT PAR(7) FROM dual;  --DA FALSE
SELECT PAR(12) FROM dual; --DA TRUE
