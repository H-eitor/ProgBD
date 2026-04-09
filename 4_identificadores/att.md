## 1. Crie um bloco PL/SQL anônimo que declare duas variáveis e imprima os resultados.

### Variáveis

| Variável | Valor                               | Descrição                   |
| -------- | ----------------------------------- | --------------------------- |
| V_CHAR   | '42 é a resposta'                   | Character (variable length) |
| V_NUM    | Primeiros dois caracteres de V_CHAR | Number                      |

### Código

```sql
DECLARE
    V_CHAR VARCHAR2(30);
    V_NUM NUMBER;
BEGIN
    V_CHAR := '42 é a resposta';
    V_NUM := TO_NUMBER(SUBSTR(V_CHAR, 1, 2));
    dbms_output.put_line(V_CHAR || ' ' || V_NUM);
END;
```

### Resultado

```
42 é a resposta 42
```

---

## 2. Cálculo de remuneração total

Crie um bloco PL/SQL que calcule:

```
Remuneração total = salário + (salário * bônus)
```

### Exemplo

- Salário anual: 50000
- Percentual de bônus: 10%
- Total: 55000

### Código

```sql
DECLARE
    salario NUMBER;
    bonus NUMBER;
BEGIN
    salario := 50000;
    bonus := 0.10;
    dbms_output.put_line(salario + salario * bonus);
END;
```

### Resultado

```
55000
```

---

## 3. Maior número de departamento

Crie um bloco PL/SQL que selecione o maior `DEPARTMENT_ID` da tabela `OEHR_DEPARTMENTS`.

### Código

```sql
DECLARE
    V_MAX_DEPTNO OEHR_DEPARTMENTS.DEPARTMENT_ID%TYPE;
BEGIN
    SELECT MAX(dep.DEPARTMENT_ID)
    INTO V_MAX_DEPTNO
    FROM OEHR_DEPARTMENTS dep;
    
    dbms_output.put_line(V_MAX_DEPTNO);
END;
```

### Resultado

```
270
```

---

## 4. Inserção de novo departamento

Modifique o bloco anterior para:

- Adicionar **10** ao maior `DEPARTMENT_ID`
- Inserir novo departamento:

  - Nome: `EDUCATION`
  - `MANAGER_ID`: NULL
  - `LOCATION_ID`: NULL
- Exibir o registro inserido

### Código

```sql
DECLARE
    V_MAX_DEPTNO OEHR_DEPARTMENTS.DEPARTMENT_ID%TYPE;
    REC_DEPARTMENT OEHR_DEPARTMENTS%ROWTYPE;
BEGIN
    SELECT MAX(DEPARTMENT_ID)
    INTO V_MAX_DEPTNO
    FROM OEHR_DEPARTMENTS;
    
    INSERT INTO OEHR_DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
    VALUES (V_MAX_DEPTNO + 10, 'EDUCATION');

    SELECT *
    INTO REC_DEPARTMENT
    FROM OEHR_DEPARTMENTS
    WHERE DEPARTMENT_ID = V_MAX_DEPTNO + 10;
    
    dbms_output.put_line(
        REC_DEPARTMENT.DEPARTMENT_ID || ' ' ||
        REC_DEPARTMENT.DEPARTMENT_NAME || ' ' ||
        REC_DEPARTMENT.MANAGER_ID || ' ' ||
        REC_DEPARTMENT.LOCATION_ID
    );
END;
```

### Resultado

```
280 EDUCATION
```


## 5. Crie um bloco anônimo para calcular e imprimir na tela o valor de uma circunferência (C = 2*pi*R). 
- O valor do raio deve ser tratado com uma variável a ser inicializada na seção executável do bloco.
- O valor de pi deve ser tratado como uma constante.

### Código

```sql
DECLARE
    V_PI CONSTANT NUMBER(3,2) := 3.14;
    V_RADIUS NUMBER;
BEGIN
    V_RADIUS := 10;
    dbms_output.put_line(2 * V_PI * V_RADIUS);
END;
```

### Resultado

```
62.8
```