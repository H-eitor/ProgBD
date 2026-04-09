## 1. Crie um bloco PL/SQL anônimo e tente criar uma tabela diretamente. O bloco foi executado com sucesso? Caso contrário, utilize a documentação para corrigir.

### Código

```sql
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE mytab (id NUMBER)';
END;
```

### Resultado

- O comando original falha com: PLS-00103: Encountered the symbol "CREATE"
- Comandos DDL não podem ser usados diretamente dentro de um bloco PL/SQL sem o uso de EXECUTE IMMEDIATE.

---

## 2. Crie um bloco PL/SQL anônimo que recupere o nome do departamento (ID 40) e a quantidade de empregados que trabalham nele, utilizando as tabelas `EMPLOYEES` e `DEPARTMENTS`.

### Código

```sql
DECLARE
    v_department_name departments.department_name%TYPE;
    v_emp_count NUMBER;
BEGIN
    SELECT d.department_name, COUNT(e.employee_id)
    INTO v_department_name, v_emp_count
    FROM departments d
        JOIN employees e
        ON d.department_id = e.department_id
    WHERE d.department_id = 40
    GROUP BY d.department_name;

    DBMS_OUTPUT.PUT_LINE('Departamento: '||v_department_name);
    DBMS_OUTPUT.PUT_LINE('Quantidade de empregados: '||v_emp_count);
END;
```

### Resultado

```
Departamento: Human Resources
Quantidade de empregados: 1
```

---

## 3. Crie um bloco PL/SQL anônimo que recupere os dados do empregado (ID 101) e imprima seus detalhes formatados, incluindo o tempo de trabalho em anos.

### Código

```sql
DECLARE
    v_full_name VARCHAR2(100);
    v_department_name departments.department_name%TYPE;
    v_hire_date employees.hire_date%TYPE;
    v_email employees.email%TYPE;
    v_salary employees.salary%TYPE;
    v_job jobs.job_title%TYPE;
BEGIN
    SELECT 
        e.first_name||' '||e.last_name,
        d.department_name,
        e.hire_date,
        e.email||'@empresa.com',
        e.salary,
        j.job_title
    INTO 
        v_full_name, v_department_name, v_hire_date, v_email, v_salary, v_job
    FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        JOIN jobs j ON e.job_id = j.job_id
    WHERE e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('<<Ficha do Empregado>>');
    DBMS_OUTPUT.PUT_LINE('Nome do Empregado: '||v_full_name);
    DBMS_OUTPUT.PUT_LINE('Departamento: '||v_department_name);
    DBMS_OUTPUT.PUT_LINE('Tempo de trabalho: '||TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12)||' anos.');
    DBMS_OUTPUT.PUT_LINE('Email: '||v_email);
    DBMS_OUTPUT.PUT_LINE('Salário: '||TO_CHAR(v_salary, 'FM$99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Cargo: '||v_job);
END;
```

### Resultado

```
Nome do Empregado: Neena Kochhar
Departamento: Executive
Tempo de trabalho: 11 anos.
Email: NKOCHHAR@empresa.com
Salário: $17,000.00
Cargo: Administration Vice President
```

---

## 4. Crie um bloco anônimo que recupere o sobrenome, email e nome do departamento do empregado 101, atribuindo os valores a um `RECORD` customizado.

### Código

```sql
DECLARE
    TYPE rec IS RECORD (
        last_name employees.last_name%TYPE,
        email employees.email%TYPE,
        department_name departments.department_name%TYPE 
    );
    rec1 rec;
BEGIN
    SELECT e.last_name, e.email, d.department_name
    INTO rec1
    FROM employees e 
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('Last_name: '||rec1.last_name);
    DBMS_OUTPUT.PUT_LINE('Email: '||rec1.email);
    DBMS_OUTPUT.PUT_LINE('Department_name: '||rec1.department_name);
END;
```

### Resultado

```
Last_name: Kochhar
Email: NKOCHHAR
Department_name: Executive
```

---

## 5. Crie um bloco PL/SQL que identifique o empregado mais antigo e verifique se ele está apto à aposentadoria (mais de 25 anos de empresa).

### Código

```sql
DECLARE
    v_hire_date employees.hire_date%TYPE;
    v_years NUMBER;
BEGIN
    SELECT MIN(hire_date)
    INTO v_hire_date
    FROM employees;

    v_years := TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);

    IF v_years > 25 THEN
        DBMS_OUTPUT.PUT_LINE('Apto');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Inapto');
    END IF;
END;
```

### Resultado

```
Apto
```