DECLARE
    salario NUMBER;
    bonus NUMBER;
BEGIN
    salario := 50000;
    bonus := 0.10;
    dbms_output.put_line(salario + salario * bonus);
END;