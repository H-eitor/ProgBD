# Variáveis em PL/SQL

## Introdução

- PL/SQL suporta:
  - Variáveis escalares (primitivas)
    - Variáveis escalares armazenam apenas um valor por vez.
  - Variáveis compostas
- Variáveis compostas armazenam múltiplos valores.
- Exemplos de variáveis escalares:
  - Números
  - Strings
  - Datas
  - Booleanos
- Exemplos de variáveis compostas:
  - Registros
  - Arrays
  - Objetos
  - Coleções

## Declaração de Variáveis

- Os nomes das variáveis:
  - Devem começar com letra
  - Podem conter números
  - Podem conter `_`, `$` e `#`
- Em geral, variáveis possuem escopo local.
- Cada variável deve ser declarada em uma linha separada.

### Sintaxe

```sql
identifier [CONSTANT] datatype [NOT NULL] [:= | DEFAULT expr];
````

### Exemplos

```sql
DECLARE
    birthday DATE;
    age NUMBER(2) NOT NULL := 27;
    name VARCHAR2(13) := 'Levi';
    valid BOOLEAN NOT NULL := TRUE;
    today DATE DEFAULT SYSDATE;
BEGIN
    NULL;
END;
/
```

### Declaração Correta

```sql
DECLARE
    v_num1 INTEGER;
    v_num2 INTEGER;
BEGIN
    NULL;
END;
/
```

### Declaração Incorreta

```sql
DECLARE
    v_num1, v_num2 INTEGER;
BEGIN
    NULL;
END;
/
```

## Valores Nulos

- Variáveis sem valor inicial recebem `NULL` automaticamente.
- PL/SQL é uma linguagem fortemente tipada.

Exemplo:

```sql
DECLARE
    lv_sample NUMBER;
BEGIN
    dbms_output.put_line('Value is [' || lv_sample || ']');
END;
/
```

Resultado:

```text
Value is []
```

## Atribuição de Valores

- É possível inicializar variáveis no momento da declaração.
- Porém, recomenda-se atribuir valores na seção executável (`BEGIN ... END`).
  - O bloco EXCEPTION não trata erros na seção de declaração 

### Exemplo Não Recomendado

```sql
DECLARE
    lv_sample NUMBER := 10;
BEGIN
    dbms_output.put_line(lv_sample);
END;
/
```

### Exemplo Recomendado

```sql
DECLARE
    lv_sample NUMBER;
BEGIN
    lv_sample := 10;
    dbms_output.put_line(lv_sample);
END;
/
```

## Declaração de Constantes

- Constantes devem obrigatoriamente ser inicializadas.
- Utilizam a palavra-chave `CONSTANT`.

Exemplos:

```sql
DECLARE
    v_cotacao CONSTANT NUMBER(3,2) := 5.25;
    v_incc CONSTANT NUMBER(2,1) := 0.8;
BEGIN
    NULL;
END;
/
```

## Tipos de Dados

PL/SQL possui todos os tipos SQL e vários tipos adicionais.

### Tipos Escalares

- Boolean
- Caractere
- Data
- Número

### Tipos Compostos

- Record
- Object Type
- VARRAY
- Nested Table
- Cursor

## Tipos Escalares

### Boolean

- Não existe no SQL puro do Oracle.
- Existe apenas em PL/SQL.
- Recomenda-se usar `NOT NULL`.

Exemplo:

```sql
DECLARE
    v_flag BOOLEAN NOT NULL := TRUE;
BEGIN
    NULL;
END;
/
```

### Caractere

- Textos devem ser colocados entre aspas simples.
- Principais tipos:
  - `CHAR`
  - `VARCHAR2`
- Suportam até 32.767 caracteres.

Exemplo:

```sql
DECLARE
    v_nome CHAR(30);
    v_sobrenome VARCHAR2(30);
BEGIN
    NULL;
END;
/
```

### Data

- O tipo `DATE` armazena data e hora.
- Datas devem ser colocadas entre aspas simples.
- `SYSDATE` retorna a data e hora atual.

Exemplo:

```sql
DECLARE
    v_nascimento DATE := '01-JAN-1978';
    v_admissao DATE := SYSDATE;
BEGIN
    NULL;
END;
/
```

### Função TRUNC para Datas

- Remove a parte do horário de uma data.

Exemplo:

```sql
SELECT TO_CHAR(TRUNC(SYSDATE), 'DD-MON-YY HH24:MI:SS')
FROM dual;
```

Resultado esperado:

```text
05-FEV-20 00:00:00
```

### Função TO_DATE

- Converte textos em datas.

Exemplo:

```sql
SELECT TO_DATE('12 JANEIRO 2020', 'DD MONTH YYYY')
FROM dual;
```

### Número

- Principais tipos:
  - `NUMBER`
  - `INTEGER`
  - `BINARY_INTEGER`
  - `BINARY_FLOAT`
  - `BINARY_DOUBLE`

Exemplos:

```sql
DECLARE
    var1 NUMBER;
    var2 NUMBER(15);
    var3 NUMBER(15,2);
BEGIN
    NULL;
END;
/
```

## Tipos Compostos

### PL/SQL Record Type

- Estrutura semelhante a um registro.
- Permite armazenar vários campos relacionados.
- Só pode ser criado dentro de um bloco PL/SQL.
- É muito utilizado com cursores.

### Exemplo de Record

```sql
DECLARE
    TYPE title_record IS RECORD (
        title VARCHAR2(60),
        subtitle VARCHAR2(60)
    );

    lv_title_record title_record;
BEGIN
    lv_title_record.title := 'Star Trek';
    lv_title_record.subtitle := 'Into Darkness';

    dbms_output.put_line(
        '[' || lv_title_record.title || ']' ||
        '[' || lv_title_record.subtitle || ']'
    );
END;
/
```

Resultado:

```text
[Star Trek][Into Darkness]
```

### Registros Aninhados

- Um `RECORD` pode conter outro `RECORD`.

Exemplo:

```sql
DECLARE
    TYPE timetype IS RECORD (
        seconds SMALLINT,
        minutes SMALLINT,
        hours SMALLINT
    );

    TYPE meetingtype IS RECORD (
        day DATE,
        time timetype,
        place VARCHAR2(20),
        purpose VARCHAR2(50)
    );

    meetingrec meetingtype;
BEGIN
    meetingrec.time.hours := 10;
END;
/
```

## Tipos de Ancoragem

- Permitem reutilizar tipos existentes.
- Principais recursos:
  - `%TYPE`
  - `%ROWTYPE`

### %TYPE

- Usa o tipo de uma coluna ou variável existente.

Exemplo:

```sql
DECLARE
    sname sailors.sname%TYPE;
    fav_boat VARCHAR2(30);
    my_fav_boat fav_boat%TYPE := 'GrafSpee';
BEGIN
    NULL;
END;
/
```

### Vantagens do %TYPE

- Evita repetição de tipos.
- Mantém consistência com a tabela.
- Facilita manutenção caso o tipo da coluna mude.

### %ROWTYPE

- Cria um registro baseado em uma tabela inteira.

Exemplo:

```sql
DECLARE
    lv_title_record titles%ROWTYPE;
BEGIN
    lv_title_record.title := 'Star Trek';
    lv_title_record.subtitle := 'Into Darkness';
END;
/
```

### Vantagens do %ROWTYPE

- Facilita trabalhar com linhas completas.
- Evita declarar campo por campo.
- Mantém compatibilidade automática com alterações da tabela.

## SELECT de Uma Única Linha

- Permite armazenar o resultado de uma consulta em variáveis.
- Deve retornar exatamente uma linha.
- Usa obrigatoriamente a cláusula `INTO`.

### Sintaxe

```sql
SELECT coluna1, coluna2
INTO variavel1, variavel2
FROM tabela
WHERE condicao;
```

### Exemplo com Variáveis

```sql
DECLARE
    v_str1 employees.first_name%TYPE;
    v_str2 employees.last_name%TYPE;
BEGIN
    SELECT first_name, last_name
    INTO v_str1, v_str2
    FROM employees
    WHERE employee_id = 101;

    dbms_output.put_line(v_str1 || ' ' || v_str2);
END;
/
```

Resultado:

```text
Neena Kochhar
```

### Exemplo com RECORD

```sql
DECLARE
    TYPE emp_rec_type IS RECORD (
        first_name employees.first_name%TYPE,
        last_name employees.last_name%TYPE
    );

    emp_rec emp_rec_type;
BEGIN
    SELECT first_name, last_name
    INTO emp_rec
    FROM employees
    WHERE employee_id = 101;

    dbms_output.put_line(emp_rec.first_name || ' ' || emp_rec.last_name);
END;
/
```

### Exemplo com %ROWTYPE

```sql
DECLARE
    emp_rec employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_rec
    FROM employees
    WHERE employee_id = 101;

    dbms_output.put_line(emp_rec.first_name || ' ' || emp_rec.last_name);
END;
/
```

## Erros Comuns em SELECT INTO

- Erro se retornar mais de uma linha.
- Erro se retornar zero linhas.
- O número de colunas deve ser igual ao número de variáveis no `INTO`.

### Exemplo Incorreto

```sql
BEGIN
    v_a := (
        SELECT a
        FROM tab1
        WHERE id = 100
    );
END;
/
```

### Exemplo Correto

```sql
BEGIN
    SELECT a
    INTO v_a
    FROM tab1
    WHERE id = 100;
END;
/
```

## Prioridade entre Coluna e Variável

- Quando uma variável possui o mesmo nome de uma coluna, PL/SQL prioriza o nome da coluna.

Exemplo:

```sql
DECLARE
    dummy VARCHAR2(1) := 'a';
    vari VARCHAR2(1);
BEGIN
    -- DUAL: tabela de 1 linha e 1 coluna com valor X
    -- dummy: nome da coluna da tabela DUAL
    SELECT dummy
    INTO vari
    FROM dual;

    dbms_output.put_line(vari);
END;
/
```

Resultado:

```text
X
```

## Variáveis de Substituição

- Utilizam `&`.
- Permitem informar valores durante a execução.

Exemplo:

```sql
DECLARE
    v_id NUMBER := &id;
    v_nome VARCHAR2(30) := '&nome';
    v_sal NUMBER(7,2) := &sal;
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'O empregado ' || v_id || ' ' || v_nome || ' recebe ' || v_sal
    );
END;
/
```

## Variáveis de Sessão (Bind Variables)

- Utilizam `:`.
- Permanecem disponíveis durante a sessão SQL-Plus.

Exemplo:

```sql
VARIABLE bind_variable VARCHAR2(20)

BEGIN
    :bind_variable := 'Hello, Krypton.';
    dbms_output.put_line('[' || :bind_variable || ']');
END;
/
```

Resultado:

```text
[Hello, Krypton.]
```