-- v_emp_id := 101
DECLARE
    v_emp_id employees.employee_id%type;
    v_email employees.email%type;
BEGIN
    v_emp_id := 101;
    SELECT email
    INTO v_email
    FROM employees
    WHERE employee_id = v_emp_id;
    dbms_output.put_line(v_email);
EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('Empregado inexistente');
    WHEN value_error THEN dbms_output.put_line('Código inválido');
END

-- v_emp_id := 999
DECLARE
    v_emp_id employees.employee_id%type;
    v_email employees.email%type;
BEGIN
    v_emp_id := 999;
    SELECT email
    INTO v_email
    FROM employees
    WHERE employee_id = v_emp_id;
    dbms_output.put_line(v_email);
EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('Empregado inexistente');
    WHEN value_error THEN dbms_output.put_line('Código inválido');
END

-- v_emp_id := '101a' 
DECLARE
    v_emp_id employees.employee_id%type;
    v_email employees.email%type;
BEGIN
    v_emp_id := '101a';
    SELECT email
    INTO v_email
    FROM employees
    WHERE employee_id = v_emp_id;
    dbms_output.put_line(v_email);
EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('Empregado inexistente');
    WHEN value_error THEN dbms_output.put_line('Código inválido');
END