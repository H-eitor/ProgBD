## 1. Avalie cada uma das declarações a seguir. Determine quais delas não são legais e explique por quê.

```sql
a. DECLARE
       v_id NUMBER(4);

b. DECLARE
       v_x, v_y, v_z VARCHAR2(10);

c. DECLARE
       v_birthdate DATE NOT NULL;

d. DECLARE
       v_in_stock BOOLEAN := 1;
```

**Respostas:**

- a. Declaração legal.
- b. Múltiplas declarações simultaneamente.
- c. Variável não instanciada declarada como não nula.
- d. Erro de tipo.

---

## 2. Em cada uma das seguintes atribuições, determine o tipo de dados da expressão resultante.

```sql
a. v_days_to_go := v_due_date - SYSDATE;

b. v_sender := USER || ': ' || TO_CHAR(v_dept_no);

c. v_sum := $100,000 + $250,000;

d. v_flag := TRUE;

e. v_n1 := v_n2 > (2 * v_n3);

f. v_value := NULL;
```

**Respostas:**

- a. NUMBER
- b. VARCHAR2
- c. Ocorre um erro
- d. BOOLEAN
- e. BOOLEAN
- f. Assume o tipo da variável `v_value`

---

## 3. Avalie o bloco PL/SQL a seguir e determine o tipo de dados e o valor de cada uma das variáveis a seguir de acordo com as regras de criação de escopos.

```sql
DECLARE
    v_weight   NUMBER(3) := 600;
    v_message  VARCHAR2(255) := 'Product 10012';

BEGIN
    /* SUB-BLOCK */
    DECLARE
        v_weight   NUMBER(3) := 1;
        v_message  VARCHAR2(255) := 'Produto 11001';
        v_new_locn VARCHAR2(50) := 'Europa';
    BEGIN
        v_weight := v_weight + 1;
        v_new_locn := 'Ocidental ' || v_new_locn;
    END;

    v_weight := v_weight + 1;
    v_message := v_message || ' is in stock';
    v_new_locn := 'Western ' || v_new_locn;
END;
```

- a. O valor de `v_weight` no sub-bloco é:__________________________________________________
- b. O valor de `v_new_locn` no sub-bloco é:__________________________________________________
- c. O valor de `v_weight` no bloco principal é:__________________________________________________
- d. O valor de `v_message` no bloco principal é:__________________________________________________
- e. O valor de `v_new_locn` no bloco principal é:__________________________________________________

**Respostas:**

- a. 2
- b. 'Ocidental Europa'
- c. 601
- d. 'Product 10012 is in stock'
- e. Ocorre um erro

---

## 4. Crie um bloco PL/SQL anônimo para a saída da frase "My PL/SQL Block Works" na tela. Antes de imprimir, a frase deve ser atribuída a uma variável local. Salve o código. Copie e cole o código e a saída no campo abaixo.

### Código:

```sql
DECLARE
    x VARCHAR(30);
BEGIN
    x := 'My PL/SQL Block Works';
    DBMS_OUTPUT.PUT_LINE(x);
END;
```

### Saída:

```
My PL/SQL Block Works
```