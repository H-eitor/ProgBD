-- v_const := 5000
DECLARE
    v_diferenca NUMBER;
    v_const CONSTANT NUMBER := 5000;
    e_lei EXCEPTION;
BEGIN
    SELECT max(salary) - avg(salary)
    INTO v_diferenca
    FROM employees;

    IF v_diferenca < v_const THEN
        dbms_output.put_line('Dentro da lei');
    ELSE
        RAISE e_lei;
    END IF;
    
EXCEPTION
    WHEN e_lei THEN dbms_output.put_line('Lei violada');
END;

-- v_const := 15000
DECLARE
    v_diferenca NUMBER;
    v_const CONSTANT NUMBER := 15000;
    e_lei EXCEPTION;
BEGIN
    SELECT max(salary) - avg(salary)
    INTO v_diferenca
    FROM employees;

    IF v_diferenca < v_const THEN
        dbms_output.put_line('Dentro da lei');
    ELSE
        RAISE e_lei;
    END IF;
    
EXCEPTION
    WHEN e_lei THEN dbms_output.put_line('Lei violada');
END;

-- v_const := 25000 
DECLARE
    v_diferenca NUMBER;
    v_const CONSTANT NUMBER := 25000;
    e_lei EXCEPTION;
BEGIN
    SELECT max(salary) - avg(salary)
    INTO v_diferenca
    FROM employees;

    IF v_diferenca < v_const THEN
        dbms_output.put_line('Dentro da lei');
    ELSE
        RAISE e_lei;
    END IF;
    
EXCEPTION
    WHEN e_lei THEN dbms_output.put_line('Lei violada');
END;