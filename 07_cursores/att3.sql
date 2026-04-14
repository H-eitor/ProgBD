DECLARE
    CURSOR c_dep IS 
        SELECT d.department_name dep_name, COUNT(e.employee_id) emp_count
        FROM oehr_departments d, oehr_employees e 
        WHERE d.department_id = e.department_id
        GROUP BY d.department_name 
        HAVING COUNT(e.employee_id) > 5
        ORDER BY emp_count DESC;
BEGIN
    FOR rec_dep IN c_dep LOOP
        DBMS_OUTPUT.PUT_LINE(c_dep%ROWCOUNT||': '||rec_dep.dep_name||' '||rec_dep.emp_count);
    END LOOP;
END;