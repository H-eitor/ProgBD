DECLARE
    v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    v_department_id OEHR_DEPARTMENTS.DEPARTMENT_ID%TYPE;
    v_count_departments INT;
BEGIN
    SELECT COUNT(DEPARTMENT_ID), MIN(DEPARTMENT_ID)
    INTO v_count_departments, v_department_id
    FROM OEHR_DEPARTMENTS;

    WHILE v_department_id / 10 <= v_count_departments LOOP
        SELECT DEPARTMENT_NAME
        INTO v_department_name
        FROM OEHR_DEPARTMENTS
        WHERE DEPARTMENT_ID = v_department_id;

        dbms_output.put_line(v_department_name);

        v_department_id := v_department_id + 10;
    END LOOP;
END;