DECLARE
    TYPE rec IS RECORD (
        last_name employees.last_name%TYPE,
        email employees.email%TYPE,
        department_name departments.department_name%TYPE 
    );
    rec1 rec;
BEGIN
    SELECT e.last_name, e.email, d.department_name
    INTO rec1
    FROM employees e NATURAL JOIN departments d
    WHERE e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('Last_name: '||rec1.last_name);
    DBMS_OUTPUT.PUT_LINE('Email: '||rec1.email);
    DBMS_OUTPUT.PUT_LINE('Department_name: '||rec1.department_name);
END;