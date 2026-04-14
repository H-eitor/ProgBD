DECLARE
    v_salary NUMBER;
BEGIN
    dbms_output.put_line('Iniciando...');
    BEGIN
        SELECT salary
        INTO v_salary
        FROM oehr_employees
        WHERE employee_id = 102;

        dbms_output.put_line('Salário: '||v_salary);
        v_salary := 2 * v_salary;
        dbms_output.put_line('Salário dobrado: '||v_salary);
    END;

    FOR i IN 1..5 LOOP
        v_salary := i + v_salary;
    END LOOP;
    dbms_output.put_line('Salário + índice: '||v_salary);
END;