## 1. Crie um bloco PL/SQL anônimo que recupera o e-mail de um empregado cujo valor do código (`employee_id`) deve ser fornecido por intermédio de uma variável local numérica.
- Imprima o e-mail recuperado
- Caso nenhuma email seja recuperado, o bloco deve tratar o erro imprimindo a mensagem "Empregado inexistente"
- Caso seja atribuído um valor não numérico à variável local, o bloco também deve tratar o erro imprimindo a mensagem "Código inválido".

### Código

```sql
DECLARE
    v_emp_id employees.employee_id%type;
    v_email employees.email%type;
BEGIN
    v_emp_id := 101;
    SELECT email
    INTO v_email
    FROM employees
    WHERE employee_id = v_emp_id;
    dbms_output.put_line(v_email);
EXCEPTION
    WHEN no_data_found THEN dbms_output.put_line('Empregado inexistente');
    WHEN value_error THEN dbms_output.put_line('Código inválido');
END
```

### Resultado

| ENTRADA | SAÍDA                 |
| ------- | --------------------- |
| 101     | NKOCHHAR              |
| 999     | Empregado inexistente |
| '101a'  | Código inválido       |

---

## 2. Crie um bloco PL/SQL que recupere o maior salário e a média salarial.

- Se a diferença entre o maior salário e a média dos salários for menor que a constante, imprima 'Dentro da lei'
- Caso contrário, dispare uma exceção definida pelo usuário e imprima 'Lei violada'.
- Execute o bloco PL/SQL três vezes atribuindo os seguintes valores à constante em cada execução: 5000, 15000 e 25000.

### Código

```sql
DECLARE
    v_diferenca NUMBER;
    v_const CONSTANT NUMBER := 5000;
    e_lei EXCEPTION;
BEGIN
    SELECT max(salary) - avg(salary)
    INTO v_diferenca
    FROM employees;

    IF v_diferenca < v_const THEN
        dbms_output.put_line('Dentro da lei');
    ELSE
        RAISE e_lei;
    END IF;
    
EXCEPTION
    WHEN e_lei THEN dbms_output.put_line('Lei violada');
END;
```

### Resultado

| CONSTANTE | SAÍDA         |
| --------- | ------------- |
| 5000      | Lei violada   |
| 15000     | Lei violada   |
| 25000     | Dentro da lei |

---

## 3. Crie um bloco PL/SQL anônimo para verificar se existe algum empregado que NÃO está alocado a um departamento.
- Caso exista, dispare numa exceção e imprima uma mensagem de tratamento usando a função RAISE_APPLICATION_ERROR.

### Código

```sql
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employees
    where department_id is null;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado sem departamento');
    ELSE
        dbms_output.put_line('Dentro da lei');
    END IF;

END;
```

---

## 4. Crie um bloco PL/SQL anônimo com um cursor explícito (laço LOOP) que seleciona os salários dos empregados.
- Na quarta iteração do cursor provoque uma exceção de divisão por zero e trate-a com o handler pré-definido pelo Oracle.
- O handler deve fechar o cursor e mostrar uma mensagem "Cursor fechado".

### Código

```sql
DECLARE
    v_div NUMBER;
    v_salario employees.salary%TYPE;
    CURSOR c_salarios IS SELECT salary FROM employees;
BEGIN
    OPEN c_salarios;
    LOOP
        FETCH c_salarios INTO v_salario;
        EXIT WHEN c_salarios%NOTFOUND;
        v_div := v_salario / MOD(c_salarios%rowcount, 4);
    END LOOP;
    c_salarios;
EXCEPTION
    WHEN zero_divide THEN
        BEGIN
            CLOSE c_salarios;
            dbms_output.put_line('Cursor fechado');
        END;
END;
```