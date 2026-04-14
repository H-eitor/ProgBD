DECLARE
    reg_employee OEHR_EMPLOYEES%ROWTYPE;
    v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    v_job_title OEHR_JOBS.JOB_TITLE%TYPE;
    v_manager_name VARCHAR2(50);
BEGIN
    SELECT *
    INTO reg_employee
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = 156;

    SELECT DEPARTMENT_NAME
    INTO v_department_name
    FROM OEHR_DEPARTMENTS
    WHERE DEPARTMENT_ID = reg_employee.DEPARTMENT_ID;

    SELECT JOB_TITLE
    INTO v_job_title
    FROM OEHR_JOBS
    WHERE JOB_ID = reg_employee.JOB_ID;

    SELECT FIRST_NAME||' '||LAST_NAME
    INTO v_manager_name
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = reg_employee.MANAGER_ID;

    dbms_output.put_line('Full name: '||reg_employee.FIRST_NAME|| ' ' ||reg_employee.LAST_NAME);
    dbms_output.put_line('Department name: '||v_department_name);
    dbms_output.put_line('Annual salary: '||TO_CHAR(12*(reg_employee.SALARY + reg_employee.SALARY * NVL(reg_employee.COMMISSION_PCT, 0)), '$999,999'));
    dbms_output.put_line('Years in company: '||TO_NUMBER(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM reg_employee.HIRE_DATE))||' years');
    dbms_output.put_line('Email: '||LOWER(reg_employee.EMAIL)||'@dell.com');
    dbms_output.put_line('Job: '||v_job_title);
    dbms_output.put_line('Manager: '||v_manager_name);
END;