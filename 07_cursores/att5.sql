-- a
DECLARE
  CURSOR c1 IS SELECT last_name FROM employees;
BEGIN
  OPEN c1;
  OPEN c1;
END;

-- b
DECLARE
  CURSOR c1 IS SELECT last_name FROM employees;
  v_last_name employees.last_name%TYPE;
BEGIN
  FETCH c1 INTO v_last_name;
END;

-- c
DECLARE
  CURSOR c1 IS SELECT last_name FROM employees;
  v_last_name employees.last_name%TYPE;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO v_last_name;
    EXIT WHEN c1%NOTFOUND;
  END LOOP;
END;