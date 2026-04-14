# Cursores em PL/SQL

## Introdução

- Cursores são estruturas que permitem processar resultados de consultas SQL (`SELECT`).
- Em PL/SQL, os dados podem ser processados:
  - Linha a linha
  - Em lote (bulk)

---

## Tipos de Cursores

### Cursor Implícito

- Criado automaticamente pelo SGBD Oracle.
- Utilizado em:
  - `SELECT INTO`
  - `INSERT`, `UPDATE`, `DELETE`, `MERGE`
  - Laços `FOR` com `SELECT`

### Cursor Explícito

- Declarado manualmente pelo programador.
- Usado quando é necessário maior controle sobre o processamento.

---

## Cursor Implícito

### Características

- Todo comando SQL possui um cursor implícito associado.
- Permite acessar informações sobre a execução.

### Atributos

- `%FOUND`: TRUE se afetou alguma linha
- `%NOTFOUND`: TRUE se nenhuma linha foi afetada
- `%ROWCOUNT`: número de linhas afetadas
- `%ISOPEN`: sempre FALSE

---

## Cursor Explícito

### Conceito

- Representa o resultado de uma consulta com múltiplas linhas.
- Permite percorrer os dados linha a linha.

### Ciclo de Vida

1. Declaração (`DECLARE`)
2. Abertura (`OPEN`)
3. Leitura (`FETCH`)
4. Verificação (`EXIT WHEN %NOTFOUND`)
5. Fechamento (`CLOSE`)

---

## Estrutura Básica

```sql
DECLARE
  CURSOR c IS SELECT ...;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO ...;
    EXIT WHEN c%NOTFOUND;
  END LOOP;
  CLOSE c;
END;
```

---

## Motivação para Uso de Cursores Explícitos

- Evitar código dependente de valores específicos.
- Tornar o código mais robusto e independente dos dados.

---

## Recursos Avançados

### Cursor com Parâmetros

- Permite reutilizar a consulta com diferentes valores.

```sql
DECLARE
    CURSOR c(n NUMBER) IS SELECT n FROM DUAL;  
    v_n NUMBER;
BEGIN
    OPEN c(1);
    LOOP
        FETCH c INTO v_n;
        EXIT WHEN c%NOTFOUND;
        dbms_output.put_line(v_n);
    END LOOP;
    CLOSE c;
END;
```

### Múltiplos Cursores

- É possível abrir vários cursores simultaneamente.

### Cursor com Bloqueio de Linhas

- Afeta a tupla que está sendo apontada pelo cursor
- Uso de `FOR UPDATE`
- Permite:
  - `UPDATE ... WHERE CURRENT OF`
  - `DELETE ... WHERE CURRENT OF`

---

## Ancoragem de Cursor

- Uso de `%ROWTYPE` para criar registros com base no cursor.
- Evita declarar variáveis manualmente.

```sql
rec c1%ROWTYPE;
```

---

## Cursor Explícito com Laço FOR

### Vantagens

- Não é necessário:
  - `OPEN`
  - `FETCH`
  - `CLOSE`
  - Declaração de variáveis auxiliares

### Exemplos

```sql
FOR emp IN c1 LOOP
  ...
END LOOP;
```

```sql
FOR emp IN (SELECT ...) LOOP
  ...
END LOOP;
```