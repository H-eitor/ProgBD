DECLARE
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT MIN(hire_date)
    INTO v_hire_date
    FROM employees;

    IF (SYSDATE - v_hire_date)/365 > 25 THEN
        DBMS_OUTPUT.PUT_LINE('Apto');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Inapto');
    END IF;
END;