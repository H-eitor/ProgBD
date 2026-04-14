BEGIN
    FOR rec IN (
        SELECT table_name 
        FROM user_tables 
        WHERE table_name LIKE 'OEHR_%'
    ) LOOP
        EXECUTE IMMEDIATE 
            'ALTER TABLE ' || rec.table_name || 
            ' RENAME TO ' || SUBSTR(rec.table_name, 6);
    END LOOP;
END;