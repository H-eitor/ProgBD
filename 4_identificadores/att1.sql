DECLARE
    V_CHAR VARCHAR2(30);
    V_NUM NUMBER;
BEGIN
    V_CHAR := '42 é a resposta';
    V_NUM := TO_NUMBER(SUBSTR(V_CHAR, 1, 2));
    dbms_output.put_line(V_CHAR || ' ' || V_NUM);
END;