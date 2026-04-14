# Programação em Banco de Dados

Repositório com materiais, resumos, exercícios e exemplos desenvolvidos ao longo de 12 semanas da disciplina de Programação em Banco de Dados.

O objetivo deste repositório é organizar o conteúdo estudado de forma progressiva, separando cada semana em um diretório específico com exemplos práticos, scripts SQL, PL/SQL, anotações e exercícios.

## Estrutura do Repositório

> 1_introducao  
> 2_sgbd  
> 3_fundamentos  
> 4_identificadores  
> 5_funcoes_embutidas  
> 6_estruturas  
> 7_cursores  
> 8_excecoes  
> 9_funcoes 
> 10_procedures  
> 11_pacotes  
> 12_tipos_compostos  

---

## Organização dos Diretórios

Cada diretório contém:

- `README.md` com uma descrição do conteúdo da semana
- `att.md` com o enunciado e a resposta textual das atividades da semana
- `attX.sql` com o script PL/SQL para responder a atividade `X`

# Conteúdo por Semana

## Semana 1 - Introdução às Técnicas de Programação de BD

Diretório: [01_introducao](01_introducao)

### Conteúdos

- Introdução à programação em banco de dados
- Classificação das técnicas para programação de BD
- Divergência de impedância
- SQL embutida
- Chamadas de função
- Extensão à linguagem SQL
- Resumo das técnicas de programação de BD

---

## Semana 2 - Interagindo com o SGBD Oracle

Diretório: [02_sgbd](02_sgbd)

### Conteúdos

- Visão geral da arquitetura do Oracle
- Conexão com instâncias Oracle
- Organização lógica dos dados
- Ferramentas Oracle
- Oracle Application Express (APEX)
- Oracle Live SQL

---

## Semana 3 - Fundamentos de PL/SQL

Diretório: [03_fundamentos](03_fundamentos)

### Conteúdos

- Introdução ao PL/SQL
- Estrutura de um bloco PL/SQL
- Blocos anônimos e nomeados
- Estrutura `DECLARE`, `BEGIN`, `EXCEPTION` e `END`
- Operações básicas
- Blocos aninhados
- Uso de variáveis e expressões

---

## Semana 4 - Identificadores PL/SQL

Diretório: [04_identificadores](04_identificadores)

### Conteúdos

- Declaração de variáveis e constantes
- Tipos de dados
- Tipos de ancoragem: `%TYPE` e `%ROWTYPE`
- Single-row SELECT: `SELECT INTO`
- Variáveis de substituição e sessão

---

## Semana 5 - Funções Embutidas

Diretório: [05_funcoes_embutidas](05_funcoes_embutidas)

### Conteúdos

- Classificação das funções
- Funções de caractere
- Funções numéricas
- Funções de data
- Funções de conversão
- Funções gerais e aninhadas

---

## Semana 6 - Estruturas de Controle

Diretório: [06_estruturas](06_estruturas)

### Conteúdos

- Estruturas condicionais
- Estruturas de iteração

---

## Semana 7 - Cursores

Diretório: [07_cursores](07_cursores)

### Conteúdos

- Cursores implícitos
- Cursores explícitos
- Uso de `OPEN`, `FETCH` e `CLOSE`
- Ancoragem de cursor
- Cursor parametrizado
- Cursor explícito com laço `FOR`

---

## Semana 8 - Tratamento de Exceções

Diretório: [08_excecoes](08_excecoes)

### Conteúdos

- Tipos de exceção
- Captura e tratamento de erros
- Funções `SQLCODE` e `SQLERRM`
- Erros pré-definidos pelo Oracle
- Exceções definidas pelo usuário

---

## Semana 9 - Funções

Diretório: [09_funcoes](09_funcoes)

### Conteúdos

- Introdução e características das funções
- Criação e chamada de funções
- Visualização e recriação de funções
- Erros de compilação e remoção de funções
- Integração entre funções e comandos SQL
- Cláusula `ACCESSIBLE BY`
- Funções recursivas
- Ofuscação de código-fonte

---

## Semana 10 - Procedures

Diretório: [10_procedures](10_procedures)

### Conteúdos

- Características das procedures
- Diferenças entre funções e procedures
- Operações com procedures
- Parâmetros: `IN`, `OUT` e `IN OUT`
- Procedures locais

---

## Semana 11 - Pacotes

Diretório: [11_pacotes](11_pacotes)

### Conteúdos

- Partes de um pacote
- Operações com pacotes
- Pacote sem corpo
- Escopo de pacote
- Sobrecarga de procedimentos e funções
- Variáveis compartilhadas
- Ordem de declarações

---

## Semana 12 - Tipos Compostos

Diretório: [12_tipos_compostos](12_tipos_compostos)

### Conteúdos

- Criação de tipos personalizados
- Estruturas compostas em PL/SQL
- Manipulação de coleções
- Coleções `VARRAY`
- Coleções `NESTED TABLE`
- Arrays associativos

---

# Objetivo Final

Ao final das 12 semanas, este repositório deve servir como:

- Base para estudos de Oracle SQL e PL/SQL
- Portfólio acadêmico
- Repositório de exemplos reutilizáveis
- Referência para futuras disciplinas e projetos