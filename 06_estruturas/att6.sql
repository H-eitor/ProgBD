DECLARE
    v_count_dep INT;
BEGIN
    SELECT COUNT(*)
    INTO v_count_dep
    FROM oehr_departments
    WHERE department_id = 300;

    IF v_count_dep = 0 THEN
        INSERT INTO oehr_departments(department_id, department_name)
        VALUES(300, 'NO NAME');
        dbms_output.put_line('Departemento inserido com sucesso');
    ELSE
        dbms_output.put_line('Departemento já existe');
    END IF;
END;