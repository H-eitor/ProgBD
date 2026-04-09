DECLARE
    V_PI CONSTANT NUMBER(3,2) := 3.14;
    V_RADIUS NUMBER;
BEGIN
    V_RADIUS := 10;
    dbms_output.put_line(2 * V_PI * V_RADIUS);
END;