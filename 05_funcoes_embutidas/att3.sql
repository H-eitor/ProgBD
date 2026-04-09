DECLARE
    v_full_name VARCHAR2(100);
    v_department_name departments.department_name%TYPE;
    v_hire_date employees.hire_date%TYPE;
    v_email employees.email%TYPE;
    v_salary employees.salary%TYPE;
    v_job jobs.job_title%TYPE;
BEGIN
    SELECT 
        e.first_name||' '||e.last_name,
        d.department_name,
        e.hire_date,
        e.email||'@empresa.com',
        e.salary,
        j.job_title
    INTO 
        v_full_name, v_department_name, v_hire_date, v_email, v_salary, v_job
    FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        JOIN jobs j ON e.job_id = j.job_id
    WHERE e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('Nome do Empregado: '||v_full_name);
    DBMS_OUTPUT.PUT_LINE('Departamento: ' ||v_department_name);
    DBMS_OUTPUT.PUT_LINE('Tempo de trabalho: '||TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12)||' anos.');
    DBMS_OUTPUT.PUT_LINE('Email: '||v_email);
    DBMS_OUTPUT.PUT_LINE('Salário: '||TO_CHAR(v_salary, 'FM$99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Cargo: '||v_job);
END;