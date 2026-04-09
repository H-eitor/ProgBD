# Interagindo com o SGBD Oracle

## Introdução

- O Oracle é um Sistema de Gerenciamento de Banco de Dados Relacional de Objetos (SGBDOR).
- Seus principais componentes são:
  - Instância Oracle
  - Banco de Dados Oracle
- A instância Oracle é composta por:
  - Estruturas de memória
  - Processos em segundo plano
- O banco de dados Oracle corresponde ao conjunto de dados armazenados de forma persistente.
- Para acessar os dados, a instância deve estar ativa.

## Arquitetura do Oracle

- A arquitetura do Oracle é dividida em:
  - Instância (memória volátil)
  - Banco de dados (memória persistente)

### Instância Oracle

- É formada por:
  - SGA (System Global Area)
  - PGA (Program Global Area)
  - Processos de segundo plano

#### SGA

- Cache de buffer de dados
- Buffer de redo log
- Pool compartilhado:
  - Cache de biblioteca
  - Cache do dicionário de dados

#### PGA

- A PGA é uma área de memória privada do processo servidor.
- Não é compartilhada com outros processos.
- Pode ser escrita apenas pelo processo servidor.
- Contém:
    - Área de classificação
    - Informações sobre a sessão
    - Estado do cursor
    - Espaço de pilha

#### Processos de Segundo Plano

- PMON
- SMON
- DBW0
- LGWR
- CKPT
- Outros processos auxiliares

### Arquivos do Banco de Dados

- Arquivos de dados
- Arquivos de controle
- Arquivos de redo log
- Arquivo de parâmetros
- Arquivo de senhas

## Conectando-se a uma Instância Oracle

- O acesso ao Oracle ocorre por meio de:
  - Processo usuário
  - Processo servidor

### Processo Usuário

- Solicita conexão com o servidor Oracle por meio de uma ferramenta cliente.
- Pode ser executado localmente ou remotamente.

### Processo Servidor

- É criado após a validação da conexão.
- Responsável por processar comandos SQL enviados pelo usuário.
- Pode ser:
  - Dedicado
  - Compartilhado
- É encerrado quando a conexão é finalizada.

## Organização Lógica dos Dados

- O Oracle organiza os dados por usuários e esquemas.

### Usuário

- Cada usuário possui um esquema próprio.
- O esquema contém os objetos criados por aquele usuário.

### Objeto

- Objeto é qualquer elemento criado com o comando `CREATE`.
- Exemplos:
  - Tabelas
  - Visões
  - Índices
  - Procedures
  - Funções
  - Pacotes
  - Sequências

### Nome de um Objeto

- Um objeto pode ser referenciado no formato:
  ```sql
  database.user.object
  ```

### Usuários Especiais

- `SYS`
  - Contém o dicionário de dados.
- `SYSTEM`
  - Utilizado para tarefas administrativas.

## Ferramentas do Oracle

- Existem ferramentas de linha de comando e gráficas para acessar o Oracle.

### Ferramentas de Linha de Comando

- SQL-Plus

### Ferramentas Gráficas

- iSQL-Plus
- Oracle SQL Developer
- Toad
- Navicat
- Oracle Apex

## SQL-Plus

- Ferramenta de linha de comando instalada com o Oracle.

### Principais Comandos

```sql
CONNECT
DISCONNECT
EDIT
DESCRIBE
```

### Variáveis de Ambiente

- `SERVEROUTPUT`
- `LINESIZE`
- `COLUMN`

### Exemplo de Uso

```sql
DESCRIBE departments;
```

Resultado esperado:
```text
DEPARTMENT_ID     NUMBER(4)
DEPARTMENT_NAME   VARCHAR2(30)
MANAGER_ID        NUMBER(6)
LOCATION_ID       NUMBER(4)
```

## Oracle SQL Developer

- Ferramenta gráfica gratuita da Oracle.
- Permite:
  - Executar comandos SQL
  - Navegar por objetos
  - Criar tabelas
  - Gerenciar usuários
  - Visualizar resultados

## Oracle Apex

- Plataforma web para desenvolvimento de aplicações.
- Permite criar aplicações rapidamente sem necessidade de muita codificação.
- Pode ser acessado diretamente pelo navegador.

## Oracle Live SQL

- Ambiente online gratuito para executar SQL e PL/SQL.
- Não exige instalação local.
- Pode ser usado para:
  - Testar consultas
  - Criar tabelas
  - Executar scripts
  - Aprender SQL

## Edições do Oracle

- Oracle Database Standard Edition 2 (SE2)
- Oracle Database Enterprise Edition (EE)
- Oracle Database Personal Edition (PE)
- Oracle Database Express Edition (XE)
- Oracle Application Express (Apex)

## Conclusão

- O Oracle possui uma arquitetura robusta baseada em instância e banco de dados.
- Seus dados são organizados em usuários, esquemas e objetos.
- O esquema HR é amplamente utilizado para aprendizado.
- Existem diversas ferramentas para interação com o Oracle, desde linha de comando até ambientes web.
