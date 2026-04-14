# Estruturas de Controle em PL/SQL

## Introdução

As estruturas de controle em PL/SQL permitem definir o fluxo de execução de um programa, possibilitando:

- Tomada de decisão
- Execução condicional
- Repetição de comandos

Os principais grupos são:

- Estruturas condicionais
- Estruturas iterativas

---

# Estruturas Condicionais

## IF / ELSIF / ELSE

A estrutura `IF` é usada para executar comandos com base em condições booleanas.

### Sintaxe Geral

```sql
IF condicao THEN
    comandos;
ELSIF outra_condicaoo THEN
    comandos;
ELSE
    comandos;
END IF;
````

### Exemplos

#### IF Simples

```sql
IF a = 1 THEN
    dbms_output.put_line('um');
END IF;
```

#### IF-ELSE

```sql
IF a = 1 THEN
    dbms_output.put_line('um');
ELSE
    dbms_output.put_line('outro');
END IF;
```

#### IF-ELSIF-ELSE

```sql
IF a = 1 THEN
    dbms_output.put_line('um');
ELSIF a = 2 THEN
    dbms_output.put_line('dois');
ELSE
    dbms_output.put_line('outro');
END IF;
```

---

## Lógica de Três Valores

Em PL/SQL, expressões booleanas podem assumir três valores:

- `TRUE`
- `FALSE`
- `NULL`

### Regras importantes

- Se uma expressão é `TRUE`, ela é verdadeira.
- Se uma expressão é `FALSE`, ela é falsa.
- Se o resultado é `NULL`, não é possível afirmar se é verdadeira ou falsa.

### Situações que geram NULL

- Variáveis booleanas não inicializadas
- Comparações com valores nulos
- Expressões aritméticas com valores nulos

### Exemplo

```sql
DECLARE
    a NUMBER;
BEGIN
    IF (a - 1) = 1 THEN
        dbms_output.put_line('nulo');
    ELSE
        dbms_output.put_line('outro');
    END IF;
END;
```

Nesse caso, `a` é nulo, então a expressão também resulta em `NULL`.

---

## CASE

A estrutura `CASE` é uma alternativa ao `IF-ELSIF-ELSE`, geralmente mais organizada para múltiplas condições.

### Sintaxe

```sql
CASE variavel
    WHEN valor1 THEN
        comandos;
    WHEN valor2 THEN
        comandos;
    ELSE
        comandos;
END CASE;
```

### Exemplo com variável

```sql
CASE lv_selector
    WHEN 'Apple' THEN
        dbms_output.put_line('Maçã');
    WHEN 'Orange' THEN
        dbms_output.put_line('Laranja');
    ELSE
        dbms_output.put_line('Outro valor');
END CASE;
```

### Exemplo com expressões

```sql
CASE
    WHEN (1 <> 1) THEN
        dbms_output.put_line('Impossible!');
    WHEN (3 > 2) THEN
        dbms_output.put_line('A valid range comparison.');
    ELSE
        dbms_output.put_line('Never reached.');
END CASE;
```

---

# Estruturas Iterativas

As estruturas iterativas permitem repetir blocos de código.

Principais tipos:

- `LOOP`
- `FOR`
- `WHILE`

---

## LOOP

O `LOOP` é a estrutura de repetição mais básica.

### Teste no início

```sql
LOOP
    contador := contador + 1;
    EXIT WHEN condicao;
    comandos;
END LOOP;
```

### Teste no fim

```sql
LOOP
    comandos;
    contador := contador + 1;
    EXIT WHEN condicao;
END LOOP;
```

### Exemplo

```sql
DECLARE
    c_ten CONSTANT NUMBER := 10;
    i INTEGER;
BEGIN
    i := 0;
    LOOP
        i := i + 1;
        EXIT WHEN i > c_ten;
        dbms_output.put_line(i);
    END LOOP;
END;
```

Esse exemplo imprime os números de 1 até 10.

---

## FOR

O `FOR` é usado quando se conhece previamente a quantidade de repetições.

### Sintaxe

```sql
FOR i IN 1..10 LOOP
    comandos;
END LOOP;
```

### Características

- O contador é criado automaticamente
- Não precisa ser declarado
- Não pode ser incrementado manualmente
- O incremento é sempre de 1
- É possível usar `REVERSE` para ordem decrescente

### Exemplo Crescente

```sql
FOR i IN 1..10 LOOP
    dbms_output.put_line(i);
END LOOP;
```

### Exemplo Decrescente

```sql
FOR i IN REVERSE 1..10 LOOP
    dbms_output.put_line(i);
END LOOP;
```

### Exemplo de Geração de Dados

```sql
FOR i IN 1..1000 LOOP
    IF MOD(i,2) = 0 THEN
        INSERT INTO sintetico VALUES (i, 'AA'||i, SYSDATE-i);
    ELSE
        INSERT INTO sintetico VALUES (i, 'BB'||i, SYSDATE-i);
    END IF;
END LOOP;
```

---

## WHILE

O `WHILE` repete enquanto a condição for verdadeira.

### Sintaxe

```sql
WHILE condicao LOOP
    comandos;
END LOOP;
```

### Exemplo

```sql
DECLARE
    c_ten CONSTANT NUMBER := 10;
    i INTEGER;
BEGIN
    i := 1;
    WHILE i <= c_ten LOOP
        dbms_output.put_line(i);
        i := i + 1;
    END LOOP;
END;
```

Esse exemplo também imprime os números de 1 até 10.