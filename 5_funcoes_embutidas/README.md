# Funções Embutidas em Oracle

## Introdução

As funções embutidas (built-in) são funções fornecidas pelo Oracle e podem ser utilizadas tanto em SQL quanto em PL/SQL. Elas facilitam manipulações de texto, números, datas, conversões e tratamento de valores nulos. Também é possível criar funções próprias além das já existentes. 

## Classificação das Funções Embutidas

As funções embutidas podem ser divididas em cinco categorias principais:
- Funções de caractere
- Funções numéricas
- Funções de data
- Funções de conversão
- Funções gerais 

---

## Funções de Caractere

### Manipulação de Maiúsculas e Minúsculas

Essas funções alteram a capitalização de strings.

| Função    | Descrição                | Exemplo                 | Resultado    |
| --------- | ------------------------ | ----------------------- | ------------ |
| `LOWER`   | Converte para minúsculas | `LOWER('SQL Course')`   | `sql course` |
| `UPPER`   | Converte para maiúsculas | `UPPER('SQL Course')`   | `SQL COURSE` |
| `INITCAP` | Primeira letra maiúscula | `INITCAP('SQL Course')` | `Sql Course` |

### Manipulação de Caracteres

| Função   | Descrição                         | Exemplo                       | Resultado    |
| -------- | --------------------------------- | ----------------------------- | ------------ |
| `CONCAT` | Concatena strings                 | `CONCAT('Hello','World')`     | `HelloWorld` |
| `SUBSTR` | Extrai parte da string            | `SUBSTR('HelloWorld',1,5)`    | `Hello`      |
| `LENGTH` | Retorna o tamanho da string       | `LENGTH('HelloWorld')`        | `10`         |
| `INSTR`  | Retorna a posição de um caractere | `INSTR('HelloWorld','W')`     | `6`          |
| `LPAD`   | Preenche à esquerda               | `LPAD(salary,10,'*')`         | `*****24000` |
| `RPAD`   | Preenche à direita                | `RPAD(salary,10,'*')`         | `24000*****` |
| `TRIM`   | Remove caracteres                 | `TRIM('H' FROM 'HelloWorld')` | `elloWorld`  |

### Vantagens

- Facilitam tratamento e formatação de textos.
- Permitem padronizar dados.
- Úteis para buscas e comparações.

---

## Funções Numéricas

As funções numéricas operam sobre valores numéricos.

| Função  | Descrição                            | Exemplo            | Resultado |
| ------- | ------------------------------------ | ------------------ | --------- |
| `ROUND` | Arredonda o número                   | `ROUND(45.926, 2)` | `45.93`   |
| `TRUNC` | Remove casas decimais sem arredondar | `TRUNC(45.926, 2)` | `45.92`   |
| `MOD`   | Retorna o resto da divisão           | `MOD(1600,300)`    | `100`     |

### Vantagens

- Facilitam cálculos matemáticos.
- Permitem controlar precisão numérica.
- Úteis em relatórios financeiros e estatísticos. 

---

## Funções de Data

As funções de data permitem manipular datas e horários.

### Funções Principais

| Função           | Descrição                           | Exemplo                                   | Resultado    |
| ---------------- | ----------------------------------- | ----------------------------------------- | ------------ |
| `SYSDATE`        | Retorna data/hora atual do servidor | `SYSDATE`                                 | Data atual   |
| `MONTHS_BETWEEN` | Diferença em meses entre datas      | `MONTHS_BETWEEN('01-SEP-95','11-JAN-94')` | `19.6774194` |
| `ADD_MONTHS`     | Adiciona meses a uma data           | `ADD_MONTHS('11-JAN-94',6)`               | `11-JUL-94`  |
| `NEXT_DAY`       | Próximo dia da semana               | `NEXT_DAY('01-SEP-95','FRIDAY')`          | `08-SEP-95`  |
| `LAST_DAY`       | Último dia do mês                   | `LAST_DAY('01-FEB-95')`                   | `28-FEB-95`  |

### Arredondamento e Truncamento de Datas

Supondo `SYSDATE = '25-JUL-95'`:

| Função                   | Resultado   |
| ------------------------ | ----------- |
| `ROUND(SYSDATE,'MONTH')` | `01-AUG-95` |
| `ROUND(SYSDATE,'YEAR')`  | `01-JAN-96` |
| `TRUNC(SYSDATE,'MONTH')` | `01-JUL-95` |
| `TRUNC(SYSDATE,'YEAR')`  | `01-JAN-95` |

### Vantagens

- Facilitam cálculos com datas.
- Permitem gerar relatórios por período.
- Úteis para vencimentos, prazos e controle temporal. 

---

## Funções de Conversão

As conversões podem ser implícitas ou explícitas.

### Conversão Implícita

O Oracle tenta converter automaticamente tipos compatíveis.

Exemplos:

```sql
v_num := '120'; -- Conversão válida
v_data := '12-JAN-20'; -- Conversão válida
```

Exemplos inválidos:

```sql
v_num := '120a'; -- Erro de conversão
v_data := '12 de janeiro de 2020'; -- Erro de conversão
```

Também pode haver perda de precisão:

```sql
v_num1 BINARY_FLOAT := 10.123;
v_num2 BINARY_INTEGER := v_num1;
-- Resultado: 10
```

### Conversão Explícita

As principais funções são:

| Função      | Objetivo                            |
| ----------- | ----------------------------------- |
| `TO_CHAR`   | Converter número ou data para texto |
| `TO_NUMBER` | Converter texto para número         |
| `TO_DATE`   | Converter texto para data           |

### Formatação de Datas

| Elemento | Significado          |
| -------- | -------------------- |
| `YYYY`   | Ano completo         |
| `YEAR`   | Ano por extenso      |
| `MM`     | Mês numérico         |
| `MONTH`  | Nome do mês          |
| `MON`    | Abreviação do mês    |
| `DD`     | Dia do mês           |
| `DAY`    | Nome completo do dia |
| `DY`     | Abreviação do dia    |

Exemplo:

```sql
TO_CHAR(hire_date, 'fmDD Month YYYY')
```

### Formatação de Números

| Elemento | Significado            |
| -------- | ---------------------- |
| `9`      | Representa um dígito   |
| `0`      | Força exibição de zero |
| `$`      | Símbolo de dólar       |
| `L`      | Símbolo de moeda local |
| `.`      | Separador decimal      |
| `,`      | Separador de milhar    |

Exemplo:

```sql
TO_CHAR(salary, '$99,999.00')
```

### Vantagens

- Permitem exibir dados de forma personalizada.
- Facilitam importação e exportação de dados.
- Reduzem erros de interpretação de formatos. 

---

## Funções Gerais

As funções gerais são muito usadas no tratamento de valores nulos.

| Função                               | Descrição                                       |
| ------------------------------------ | ----------------------------------------------- |
| `NVL(expr1, expr2)`                  | Substitui valor nulo                            |
| `NVL2(expr1, expr2, expr3)`          | Retorna um valor se não for nulo e outro se for |
| `NULLIF(expr1, expr2)`               | Retorna nulo se os valores forem iguais         |
| `COALESCE(expr1, expr2, ..., exprn)` | Retorna o primeiro valor não nulo               |

### Exemplos

```sql
NVL(commission_pct,0)
NVL(hire_date,'01-JAN-97')
NVL(job_id,'No Job Yet')
```

```sql
NVL2(commission_pct, 'SAL+COMM', 'SAL')
```

```sql
NULLIF(LENGTH(first_name), LENGTH(last_name))
```

```sql
COALESCE(null,2)
-- Resultado: 2
```

### Vantagens

- Facilitam o tratamento de dados incompletos.
- Evitam erros com valores nulos.
- Melhoram a legibilidade das consultas. 

---

## Funções Aninhadas

As funções podem ser combinadas em múltiplos níveis.

Estrutura geral:

```sql
F3(F2(F1(col,arg1),arg2),arg3)
```

A avaliação ocorre da função mais interna para a mais externa.

Exemplo:

```sql
SELECT last_name, NVL(TO_CHAR(manager_id), 'No Manager')
FROM employees
WHERE manager_id IS NULL;
```

### Vantagens

- Permitem consultas mais compactas.
- Reduzem a necessidade de etapas intermediárias.
- Facilitam combinações de processamento. 
