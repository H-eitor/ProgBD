DECLARE
    v_existe INTEGER;
    v_loop INTEGER;
    v_out VARCHAR(50);
BEGIN
    SELECT COUNT(*)
    INTO v_existe
    FROM user_tables
    WHERE table_name = 'TEMP_CALC';

    IF v_existe = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE TEMP_CALC(numero NUMBER PRIMARY KEY, quadrado NUMBER)';
    ELSE
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_CALC';
    END IF;

    v_loop := 1;

    WHILE v_loop < 6 LOOP
        INSERT INTO TEMP_CALC(numero)
        VALUES(v_loop);

        v_loop := v_loop + 1;
    END LOOP;

    v_loop := 1;

    LOOP
        EXIT WHEN v_loop > 5;
        
        UPDATE TEMP_CALC
        SET quadrado = v_loop * v_loop
        WHERE numero = v_loop;
        
        v_loop := v_loop + 1;
    END LOOP;

    FOR i IN 1..5 LOOP
        SELECT 'numero: '||numero||', quadrado: '||quadrado
        INTO v_out
        FROM TEMP_CALC
        WHERE numero = i;

        dbms_output.put_line(v_out);
    END LOOP;

END;