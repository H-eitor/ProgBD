# Introdução às Técnicas de Programação SQL

## Introdução

- SQL é o padrão para bancos de dados relacionais.
- Divide-se em:
  - DDL (Data Definition Language)
  - DML (Data Manipulation Language)
  - DCL (Data Control Language)
- O acesso ao banco pode ser feito tanto por ferramentas de desenvolvimento quanto por aplicações.
- A maior parte do acesso aos bancos ocorre por meio de aplicações desenvolvidas em linguagens como C, C++, Java, C#, PHP e JavaScript.
- Quando SQL é usada dentro de outra linguagem, essa linguagem é chamada de linguagem hospedeira, enquanto SQL é chamada de sublinguagem de dados.
- Existem linguagens específicas para banco de dados, como:
  - PL/SQL (Oracle)
  - PL/pgSQL (PostgreSQL)

## Divergência de Impedância

- É o problema causado pelas diferenças entre:

  - O modelo relacional do banco de dados
  - O modelo de dados da linguagem de programação

### Problema 1: Diferença de Tipos

- Os tipos SQL podem não corresponder diretamente aos tipos da linguagem hospedeira.
- Exemplo:
  - SQL INTEGER → C long
  - SQL CHAR(n) → C char[]

### Problema 2: Diferença de Estruturas

- SQL retorna conjuntos de tuplas.
- A linguagem precisa percorrer e manipular esses resultados individualmente.
- Para isso, utiliza-se cursor.

## Classificação das Técnicas para Programação de Banco de Dados

Existem três principais técnicas:

1. Embutir comandos SQL em uma linguagem de programação.
2. Utilizar bibliotecas de funções ou APIs.
3. Criar uma linguagem própria para programação de banco de dados.

### 1. SQL Embutida

- Os comandos SQL são inseridos diretamente no código da linguagem hospedeira.
- Usa palavras-chave como:
  ```sql
  EXEC SQL
  END-EXEC
  ```
- Permite compartilhamento de variáveis entre SQL e a linguagem hospedeira.
- Variáveis SQL geralmente são prefixadas com `:`.
- Exemplo:
  ```c
  int loop = 1;
  while (loop) {
      printf("Digite um CPF: ");
      scanf("%s", cpf);

      EXEC SQL
          SELECT Pnome, Minicial, Unome, Endereco, Salario
          INTO :pnome, :minicial, :unome, :endereco, :salario
          FROM FUNCIONARIO
          WHERE Cpf = :cpf;

      if (SQLCODE == 0) {
          printf("%s %s %s, Endereco: %s, Salario: %.2f\n",
              pnome, minicial, unome, endereco, salario);
      } else {
          printf("CPF não existe: %s\n", cpf);
      }

      printf("Mais CPF (digite 1 para Sim, 0 para Não): ");
      scanf("%d", &loop);
  }
  ```
- Um pré-compilador identifica e processa os comandos SQL.
- É uma técnica estática:
  - Alterações nas consultas exigem recompilação.

#### Vantagens

- Permite validação em tempo de compilação.
- Código mais legível.

#### Desvantagens

- Pouca flexibilidade.
- Requer recompilação quando a consulta muda.

### 2. Bibliotecas de Funções (APIs)

- Utilizam chamadas de função para acessar o banco.
- Exemplos:
  - ODBC
  - SQL/CLI
  - JDBC
- As consultas são passadas como strings.
- É uma técnica dinâmica:
  - Permite criar consultas em tempo de execução.

#### Vantagens

- Alta flexibilidade.
- Consultas podem ser montadas dinamicamente.
- Não requer pré-processador.
- Permite acesso a diferentes bancos de dados.
- Facilita a geração dinâmica de consultas.

#### Desvantagens

- Maior complexidade.
- Sem validação em tempo de compilação.
- Verificações ocorrem apenas em tempo de execução.
- Manipulação de resultados é mais complexa.

### Estruturas Necessárias

- Registro de ambiente
- Registro de conexão
- Registro de instrução
- Registro de descrição

### 3. Linguagens de Banco de Dados

- Linguagens desenvolvidas especificamente para manipulação de banco de dados.
- Acrescentam estruturas de programação à SQL, como:
  - IF
  - LOOP
  - PROCEDURE
- Exemplos:
  - PL/SQL
  - Transact-SQL

#### Vantagens

- Reduz a divergência de impedância.
- Integra melhor com o banco.
- Modularização
- Melhor desempenho
- Reutilização
- Segurança
- Validação de regras de negócio

#### Desvantagens

- Exige aprendizado de uma nova linguagem.
- Pode ser dependente de um SGBD específico.

## Conclusão

- A escolha da técnica depende das necessidades da aplicação.
- SQL embutida é mais adequada para aplicações com consultas fixas.
- APIs são mais flexíveis e comuns em aplicações modernas.
- Linguagens específicas de banco são ideais para aplicações com forte integração com o SGBD.