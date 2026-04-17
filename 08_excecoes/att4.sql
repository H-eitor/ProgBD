DECLARE
    v_div NUMBER;
    v_salario employees.salary%TYPE;
    CURSOR c_salarios IS SELECT salary FROM employees;
BEGIN
    OPEN c_salarios;
    LOOP
        FETCH c_salarios INTO v_salario;
        EXIT WHEN c_salarios%NOTFOUND;
        v_div := v_salario / MOD(c_salarios%rowcount, 4);
    END LOOP;
    c_salarios;
EXCEPTION
    WHEN zero_divide THEN
        BEGIN
            CLOSE c_salarios;
            dbms_output.put_line('Cursor fechado');
        END;
END;