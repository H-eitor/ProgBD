DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employees
    where department_id is null;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado sem departamento');
    ELSE
        dbms_output.put_line('Dentro da lei');
    END IF;

END;