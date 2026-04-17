# Tratamento de Exceções em PL/SQL

## Introdução

- Exceções são erros que ocorrem durante a execução de programas PL/SQL.
- Podem acontecer em dois momentos:
  - **Tempo de compilação** (erros de sintaxe)
    - Detectados imediatamente pelo Oracle.
    - Exemplo: falta de `;`.
  - **Tempo de execução** (erros de lógica)
    - Ocorrem durante a execução do programa.
    - Podem ser:
        - Automáticos (ex: `NO_DATA_FOUND`)
        - Disparados manualmente (`RAISE`)
- O foco é tratar erros de execução, pois são mais difíceis de detectar.

### Observações

- Exceções na seção `DECLARE` não podem ser tratadas.
- Inicializações devem ser feitas na seção executável (`BEGIN`).

---

## Seção de Tratamento de Exceções

### Estrutura

```sql
[DECLARE]
...
BEGIN
...
[EXCEPTION]
...
END;
```

### Funcionamento

- Ao ocorrer um erro na exceção, o fluxo vai para `EXCEPTION`.
- Apenas o **primeiro erro** é tratado.
- O bloco é encerrado após o tratamento.

### Handlers

- **Específicos**: tratam uma exceção específica.
- **Genéricos (`OTHERS`)**: tratam qualquer exceção.

```sql
WHEN excecao THEN
  ...
```

### Regras

- `OTHERS` deve ser o último handler.
- Se nenhuma exceção for tratada, ela é propagada.
- Múltiplas exceções podem ser tratadas da mesma maneira:

```sql
WHEN erro1 OR erro2 THEN
```

---

## Funções SQLCODE e SQLERRM

### SQLCODE

- Retorna o **código numérico** do erro.
- Exemplos:

  - `-6502` → erro de valor
  - `100` → `NO_DATA_FOUND`
  - `1` → exceção definida pelo usuário

### SQLERRM

- Retorna **mensagem + código** do erro.

---

## Erros Pré-definidos do Oracle

### Características

- Já definidos pelo Oracle.
- Associados a códigos de erro.

### Exemplos comuns

- `NO_DATA_FOUND`
- `TOO_MANY_ROWS`
- `ZERO_DIVIDE`
- `VALUE_ERROR`
- `DUP_VAL_ON_INDEX`
- `INVALID_NUMBER`

---

## Exceções Definidas pelo Usuário

### Formas de criar

1. **RAISE com variável EXCEPTION**

```sql
DECLARE
  e EXCEPTION;
BEGIN
  RAISE e;
END;
```

---

2. **PRAGMA EXCEPTION_INIT**

- Associa uma exceção a um código de erro.

```sql
PRAGMA EXCEPTION_INIT(nome, -codigo);
```

---

3. **RAISE_APPLICATION_ERROR**

- Cria erro com mensagem personalizada.
- Substitui a mensagem original do erro.

```sql
RAISE_APPLICATION_ERROR(-20001, 'Mensagem');
```

- Pode manter o erro original com o parâmetro `TRUE`.

```sql
RAISE_APPLICATION_ERROR(-20001, 'Mensagem', TRUE);
```

### Características

- Código deve estar entre `-20000` e `-20999`.
- Pode ser usado no `BEGIN` ou `EXCEPTION`.