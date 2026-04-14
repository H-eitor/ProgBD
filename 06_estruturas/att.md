## 1. Crie um bloco PL/SQL para listar os nomes dos departamentos sem usar cursor.

### Código

```sql
DECLARE
    v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    v_department_id OEHR_DEPARTMENTS.DEPARTMENT_ID%TYPE;
    v_count_departments INT;
BEGIN
    SELECT COUNT(DEPARTMENT_ID), MIN(DEPARTMENT_ID)
    INTO v_count_departments, v_department_id
    FROM OEHR_DEPARTMENTS;

    WHILE v_department_id / 10 <= v_count_departments LOOP
        SELECT DEPARTMENT_NAME
        INTO v_department_name
        FROM OEHR_DEPARTMENTS
        WHERE DEPARTMENT_ID = v_department_id;

        dbms_output.put_line(v_department_name);

        v_department_id := v_department_id + 10;
    END LOOP;
END;
````

### Resultado

```
EDUCATION
Administration
Marketing
Purchasing
Human Resources
Shipping
IT
Public Relations
Sales
Executive
Finance
Accounting
Treasury
Corporate Tax
Control And Credit
Shareholder Services
Benefits
Manufacturing
Construction
Contracting
Operations
IT Support
NOC
IT Helpdesk
Government Sales
Retail Sales
Recruiting
Payroll
```


---

## 2. Considere agora que o comando DELETE FROM departments WHERE department_id = 90 foi executado. O que acontecerá se o bloco anônimo da questão anterior for re-executado?

### Código

```sql
DELETE FROM departments WHERE department_id = 90;
```

### Resultado

```
Erro: ORA-01403: no data found
```

* O erro ocorre porque o código assume que todos os IDs existem em intervalos de 10.
* Ao tentar acessar o ID 90 (removido), o SELECT não retorna dados.

---

## 3. Crie uma tabela chamada SINTETICA com as colunas abaixo. Crie um bloco PL/SQL anônimo para inserir 500 linhas na tabela criada.

| codigo (INTEGER, PK) | nome (VARCHAR2(10)) | nascimento (DATE) | sexo (CHAR(1)) |
| -------------------- | ------------------- | ----------------- | -------------- |

- O povoamento das colunas deve obedecer as seguintes regras:
  - codigo: valor do contador
  - nome: se contador for par, deve ser Mr.{valor do contador}. Caso contrário, Mrs.{valor do contador} 
  - nascimento: data atual - valor do contador
  - sexo: se contador for par, deve ser M. Caso contrário, F.

- Execute uma consulta para mostrar a quantidade de valores distintos na coluna nome.

### Código

```sql
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
```

### Resultado

```
500
```

---

## 4. Crie um bloco PL/SQL anônimo que produza a saída abaixo:

```
Full name: Janette King
Department name: Sales
Annual salary:  $162,000
Years in company: 7 years
Email: jking@dell.com
Job: Sales Representative
Manager: Karen Partners.
```

### Código

```sql
DECLARE
    reg_employee OEHR_EMPLOYEES%ROWTYPE;
    v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    v_job_title OEHR_JOBS.JOB_TITLE%TYPE;
    v_manager_name VARCHAR2(50);
BEGIN
    SELECT *
    INTO reg_employee
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = 156;

    SELECT DEPARTMENT_NAME
    INTO v_department_name
    FROM OEHR_DEPARTMENTS
    WHERE DEPARTMENT_ID = reg_employee.DEPARTMENT_ID;

    SELECT JOB_TITLE
    INTO v_job_title
    FROM OEHR_JOBS
    WHERE JOB_ID = reg_employee.JOB_ID;

    SELECT FIRST_NAME||' '||LAST_NAME
    INTO v_manager_name
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = reg_employee.MANAGER_ID;

    dbms_output.put_line('Full name: '||reg_employee.FIRST_NAME|| ' ' ||reg_employee.LAST_NAME);
    dbms_output.put_line('Department name: '||v_department_name);
    dbms_output.put_line('Annual salary: '||TO_CHAR(12*(reg_employee.SALARY + reg_employee.SALARY * NVL(reg_employee.COMMISSION_PCT, 0)), '$999,999'));
    dbms_output.put_line('Years in company: '||TO_NUMBER(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM reg_employee.HIRE_DATE))||' years');
    dbms_output.put_line('Email: '||LOWER(reg_employee.EMAIL)||'@dell.com');
    dbms_output.put_line('Job: '||v_job_title);
    dbms_output.put_line('Manager: '||v_manager_name);
END;
```

### Resultado

```
Full name: Janette King
Department name: Sales
Annual salary:  $162,000
Years in company: 7 years
Email: jking@dell.com
Job: Sales Representative
Manager: Karen Partners
```

---

## 5. Bloco com sub-bloco para salário e soma com índice.

Crie um bloco PL/SQL anônimo com uma variável v_salary do tipo NUMBER. Na parte executável do bloco, imprima na tela 'Iniciando...' e, em seguida, crie um sub-bloco para executar um SELECT INTO buscando o salário do empregado cujo employee_id é 102. Atribua o valor do salário à v_salary.

No bloco interno, multiplique o salário por 2 e exiba o resultado;

No bloco externo, após o sub-bloco, faça um loop FOR de 1 a 5 somando o índice à variável v_salario. Exiba o valor final de v_soma.


### Código

```sql
DECLARE
    v_salary NUMBER;
BEGIN
    dbms_output.put_line('Iniciando...');
    BEGIN
        SELECT salary
        INTO v_salary
        FROM oehr_employees
        WHERE employee_id = 102;

        dbms_output.put_line('Salário: '||v_salary);
        v_salary := 2 * v_salary;
        dbms_output.put_line('Salário dobrado: '||v_salary);
    END;

    FOR i IN 1..5 LOOP
        v_salary := i + v_salary;
    END LOOP;
    dbms_output.put_line('Salário + índice: '||v_salary);
END;
```

### Resultado

```
Iniciando...
Salário: 17000
Salário dobrado: 34000
Salário + índice: 34015
```

---

## Crie um bloco PL/SQL que verifica se um determinado departamento existe ou não na tabela Departments.

Se o departamento não existir insira-o com o nome de departamento 'NO NAME' e os demais campos nulos. Ainda, imprima uma mensagem informando que o departamento foi inserido com sucesso. Se existir, informe que já existe. Teste com o departamento com department_id 300.

### Código

```sql
DECLARE
    v_count_dep INT;
BEGIN
    SELECT COUNT(*)
    INTO v_count_dep
    FROM oehr_departments
    WHERE department_id = 300;

    IF v_count_dep = 0 THEN
        INSERT INTO oehr_departments(department_id, department_name)
        VALUES(300, 'NO NAME');
        dbms_output.put_line('Departemento inserido com sucesso');
    ELSE
        dbms_output.put_line('Departemento já existe');
    END IF;
END;
```

### Resultado

```
Departemento inserido com sucesso
```

---

## 7. Crie um bloco PL/SQL anônimo para validar uma senha. A senha deve ter até 8 caracteres, podendo ser composta por algarismos decimais e/ou letras minúsculas.

### Código

```sql
DECLARE
  v_senha CHAR(8);
  v_qtde_algarismos INTEGER; -- 48-57
  v_qtde_letras_minusculas INTEGER; -- 97-122
BEGIN
  v_qtde_algarismos := 0;
  v_qtde_letras_minusculas := 0;
  v_senha := 't1e2s3t4';
  FOR i IN 1..LENGTH(v_senha) LOOP
    FOR j IN 48..57 LOOP
      IF SUBSTR(v_senha,i,1) = CHR(j) THEN
        v_qtde_algarismos := v_qtde_algarismos + 1;
      END IF;
    END LOOP;
    FOR k IN 97..122 LOOP  
      IF SUBSTR(v_senha,i,1) = CHR(k) THEN
        v_qtde_letras_minusculas := v_qtde_letras_minusculas + 1;
      END IF;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_senha||' possui '||v_qtde_algarismos||' algarismos.');
  DBMS_OUTPUT.PUT_LINE(v_senha||' possui '||v_qtde_letras_minusculas||' letras minúsculas.');
END;
```

### Resultado

```
t1e2s3t4 possui 4 algarismos.
t1e2s3t4 possui 4 letras minúsculas.
```

---

## 8. Crie a tabela temp_calc com as colunas abaixo. Crie um bloco PL/SQL para inserir valores de 1 a 5 na coluna numero (deixe a coluna quadrado com valor nulo), usando um laco WHILE. Em seguida, no mesmo bloco, usando um laço LOOP, recupere cada valor de numero em temp_calc e atualize a coluna quadrado com o valor respectivo do quadrado de numero. No mesmo bloco, usando um laço FOR, recupere cada valor de numero e seu quadrado em temp_calc e imprima os valores de numero e quadrado na tela.

| numero (NUMBER, PK) | quadrado (NUMBER) |
| ------------------- | ----------------- |

### Código

```sql
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
```

### Resultado

```
numero: 1, quadrado: 1
numero: 2, quadrado: 4
numero: 3, quadrado: 9
numero: 4, quadrado: 16
numero: 5, quadrado: 25
```