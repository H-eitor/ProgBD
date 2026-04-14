DECLARE
    v_existe INTEGER;
    c_table_name CONSTANT user_tables.table_name%TYPE := 'SINTETICA';
    v_distinct_names INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_existe
    FROM user_tables
    WHERE table_name = c_table_name;

    IF v_existe = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE '||c_table_name||' (codigo INTEGER PRIMARY KEY, nome VARCHAR2(10), nascimento DATE, sexo CHAR(1))';
    ELSE
        EXECUTE IMMEDIATE 'TRUNCATE TABLE '||c_table_name;
    END IF;
    
    FOR i IN 1..500 LOOP
        IF MOD(i, 2) = 0 THEN
            INSERT INTO SINTETICA VALUES (i, 'Mr. '||i,SYSDATE-i, 'M');
        ELSE
            INSERT INTO SINTETICA VALUES (i, 'Mrs. '||i,SYSDATE-i, 'F');
        END IF;
    END LOOP;

    SELECT COUNT(DISTINCT nome)
    INTO v_distinct_names
    FROM SINTETICA;

    dbms_output.put_line(v_distinct_names);
END;