DECLARE
    v_salary oehr_employees.salary%type;
BEGIN
    SELECT salary
    INTO v_salary
    FROM oehr_employees 
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);

    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('aberto');
    ELSE
        DBMS_OUTPUT.PUT_LINE('fechado');
    END IF;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('encontrou');
    ELSE
        DBMS_OUTPUT.PUT_LINE('não encontrou');
    END IF;
END;