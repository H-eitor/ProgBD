# Fundamentos da Linguagem SQL

## Introdução

- SQL (Structured Query Language) é a linguagem padrão para bancos de dados relacionais.
- Foi desenvolvida originalmente pela IBM com o nome SEQUEL.
- Tornou-se padrão ANSI e ISO.
- É utilizada para:
  - Definição de dados
  - Manipulação de dados
  - Controle de acesso
  - Controle de transações

## Categorias da Linguagem SQL

SQL pode ser dividida em quatro grandes categorias:

1. DDL (Data Definition Language)
2. DML (Data Manipulation Language)
3. DCL (Data Control Language)
4. TCL (Transaction Control Language)

### 1. DDL — Data Definition Language

- Utilizada para criar e modificar estruturas do banco de dados.
- Principais comandos:
  - `CREATE`
  - `ALTER`
  - `DROP`
  - `TRUNCATE`
  - `RENAME`

#### CREATE

- Cria objetos no banco de dados.
- Exemplos de objetos:
  - Tabelas
  - Índices
  - Views
  - Sequences

Exemplo:

```sql
CREATE TABLE departamento (
    id_departamento NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);
````

#### ALTER

- Modifica a estrutura de um objeto existente.

Exemplo:

```sql
ALTER TABLE departamento
ADD localizacao VARCHAR2(100);
```

#### DROP

- Remove completamente um objeto do banco.

Exemplo:

```sql
DROP TABLE departamento;
```

#### TRUNCATE

- Remove todos os registros de uma tabela sem apagar sua estrutura.

Exemplo:

```sql
TRUNCATE TABLE departamento;
```

#### RENAME

- Renomeia objetos do banco.

Exemplo:

```sql
RENAME departamento TO setores;
```

### 2. DML — Data Manipulation Language

- Utilizada para consultar e manipular dados armazenados.
- Principais comandos:

  - `SELECT`
  - `INSERT`
  - `UPDATE`
  - `DELETE`
  - `MERGE`

#### SELECT

- Recupera dados de tabelas.

Exemplo:

```sql
SELECT nome, salario
FROM funcionarios
WHERE salario > 3000;
```

#### INSERT

- Adiciona novos registros.

Exemplo:

```sql
INSERT INTO funcionarios (id, nome, salario)
VALUES (1, 'Maria', 4500);
```

#### UPDATE

- Atualiza registros existentes.

Exemplo:

```sql
UPDATE funcionarios
SET salario = 5000
WHERE id = 1;
```

#### DELETE

- Remove registros da tabela.

Exemplo:

```sql
DELETE FROM funcionarios
WHERE id = 1;
```

#### MERGE

- Combina operações de inserção e atualização.

Exemplo:

```sql
MERGE INTO funcionarios f
USING novos_funcionarios n
ON (f.id = n.id)
WHEN MATCHED THEN
    UPDATE SET f.salario = n.salario
WHEN NOT MATCHED THEN
    INSERT (id, nome, salario)
    VALUES (n.id, n.nome, n.salario);
```

### 3. DCL — Data Control Language

- Responsável pelo controle de permissões e segurança.
- Principais comandos:

  - `GRANT`
  - `REVOKE`

#### GRANT

- Concede permissões a usuários.

Exemplo:

```sql
GRANT SELECT, INSERT
ON funcionarios
TO usuario1;
```

#### REVOKE

- Remove permissões concedidas.

Exemplo:

```sql
REVOKE INSERT
ON funcionarios
FROM usuario1;
```

### 4. TCL — Transaction Control Language

- Controla transações no banco de dados.
- Principais comandos:

  - `COMMIT`
  - `ROLLBACK`
  - `SAVEPOINT`

#### COMMIT

- Confirma definitivamente as alterações.

Exemplo:

```sql
COMMIT;
```

#### ROLLBACK

- Desfaz alterações ainda não confirmadas.

Exemplo:

```sql
ROLLBACK;
```

#### SAVEPOINT

- Cria pontos intermediários de recuperação.

Exemplo:

```sql
SAVEPOINT ponto1;
```

## Tipos de Dados SQL

### Tipos Numéricos

- `NUMBER`
- `INTEGER`
- `FLOAT`

Exemplos:

```sql
idade NUMBER(3);
salario NUMBER(10,2);
```

### Tipos de Texto

- `CHAR`
- `VARCHAR2`
- `CLOB`

Exemplos:

```sql
nome VARCHAR2(100);
codigo CHAR(5);
```

### Tipos de Data e Hora

- `DATE`
- `TIMESTAMP`

Exemplos:

```sql
data_nascimento DATE;
ultima_atualizacao TIMESTAMP;
```

### Tipos Binários

- `BLOB`
- `RAW`

## Restrições de Integridade

- Garantem consistência dos dados.
- Principais restrições:

  - `PRIMARY KEY`
  - `FOREIGN KEY`
  - `UNIQUE`
  - `NOT NULL`
  - `CHECK`

### PRIMARY KEY

- Identifica unicamente cada registro.

Exemplo:

```sql
id NUMBER PRIMARY KEY
```

### FOREIGN KEY

- Garante relacionamento entre tabelas.

Exemplo:

```sql
id_departamento NUMBER,
CONSTRAINT fk_departamento
FOREIGN KEY (id_departamento)
REFERENCES departamentos(id)
```

### UNIQUE

- Não permite valores repetidos.

Exemplo:

```sql
email VARCHAR2(100) UNIQUE
```

### NOT NULL

- Impede valores nulos.

Exemplo:

```sql
nome VARCHAR2(100) NOT NULL
```

### CHECK

- Define regras para os valores aceitos.

Exemplo:

```sql
salario NUMBER CHECK (salario > 0)
```

## Estrutura Básica de uma Consulta

Uma consulta SQL simples normalmente possui:

```sql
SELECT coluna1, coluna2
FROM tabela
WHERE condicao
ORDER BY coluna1;
```

## Ordem de Execução de uma Consulta

1. `FROM`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`

## Comentários em SQL

### Comentário de Linha

```sql
-- Este é um comentário
```

### Comentário de Bloco

```sql
/- Este é um comentário
   de múltiplas linhas -/
```

## Boas Práticas

- Utilizar nomes claros para tabelas e colunas.
- Evitar abreviações excessivas.
- Padronizar nomes.
- Utilizar restrições de integridade.
- Organizar consultas com indentação.
- Comentar trechos importantes.

## Conclusão

- SQL é dividida em DDL, DML, DCL e TCL.
- Os tipos de dados e restrições garantem a consistência das informações.
- Consultas seguem uma estrutura padronizada.
- Boas práticas facilitam manutenção e legibilidade.
