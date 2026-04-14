## 1. Crie um bloco PL/SQL anônimo para recuperar o salário do empregado 101, atribuindo o resultado a uma variável.
- Imprima o valor do atributo de cursor implícito %ROWCOUNT.
- Imprima "aberto" caso o valor de %ISOPEN seja TRUE; "fechado", caso contrário
- Imprima "encontrou" caso o valor de %FOUND seja TRUE; "não encontrou", caso contrário.

### Código

```sql
DECLARE
    v_salary oehr_employees.salary%type;
BEGIN
    SELECT salary
    INTO v_salary
    FROM oehr_employees 
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);

    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('aberto');
    ELSE
        DBMS_OUTPUT.PUT_LINE('fechado');
    END IF;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('encontrou');
    ELSE
        DBMS_OUTPUT.PUT_LINE('não encontrou');
    END IF;
END;
```

### Resultado

```
1
fechado
encontrou
```

---

## 2. Crie um bloco PL/SQL anônimo contendo um cursor que recupere o nome dos departamentos e a quantidade de empregados dos departamentos, mas apenas dos departamentos com mais de 5 funcionários.

- A cada iteração do laço, imprima o valor do atributo de cursor explícito %ROWCOUNT, bem como o nome do departamento e a quantidade de empregados.
- Use um laço LOOP e a opção %ROWTYPE (ancoragem de cursor).

### Código

```sql
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
```

### Resultado

```
1: Shipping 45
2: Sales 34
3: Finance 6
4: Purchasing 6
```

---

## 3. Reescreva o código anterior utilizando laço FOR.

### Código

```sql
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
```

### Resultado

```
1: Shipping 45
2: Sales 34
3: Finance 6
4: Purchasing 6
```

---

## 4. Crie um bloco PL/SQL para renomear tabelas com prefixo "OEHR_".

### Código

```sql
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
```

### Resultado

- As tabelas com prefixo `OEHR_` foram renomeadas removendo o prefixo.

---

## 5. Experimentos com cursores explícitos.

### a) Abrir o cursor duas vezes

### Código

```sql
DECLARE
  CURSOR c1 IS SELECT last_name FROM employees;
BEGIN
  OPEN c1;
  OPEN c1;
END;
```

### Resultado

```
ORA-06511: PL/SQL: cursor already open
```

### b) Executar FETCH sem abrir o cursor

### Código

```sql
DECLARE
  CURSOR c1 IS SELECT last_name FROM employees;
  v_last_name employees.last_name%TYPE;
BEGIN
  FETCH c1 INTO v_last_name;
END;
```

### Resultado

```
ORA-01001: invalid cursor
```

### c) Utilizar LOOP sem fechar o cursor

### Código

```sql
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
```

### Resultado

```
Statement processed.
```

- O código executa normalmente.
- O cursor permanece aberto ao final do bloco.
- O banco de dados se encarrega de fechá-lo posteriormente.