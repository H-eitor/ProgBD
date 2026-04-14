DECLARE
    CURSOR c_dep IS 
        SELECT d.department_name dep_name, COUNT(e.employee_id) emp_count
        FROM oehr_departments d, oehr_employees e 
        WHERE d.department_id = e.department_id
        GROUP BY d.department_name 
        HAVING COUNT(e.employee_id) > 5
        ORDER BY emp_count DESC;

    rec_dep c_dep%ROWTYPE;
BEGIN
    OPEN c_dep;
    LOOP
        FETCH c_dep INTO rec_dep;
        EXIT WHEN c_dep%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(c_dep%ROWCOUNT||': '||rec_dep.dep_name||' '||rec_dep.emp_count);
    END LOOP;
    CLOSE c_dep;
END;