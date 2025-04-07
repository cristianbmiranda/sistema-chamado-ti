
# Sistema de Chamados Técnicos para TI

Este projeto é um sistema simples de gerenciamento de chamados técnicos, desenvolvido com foco em práticas de modelagem e manipulação de banco de dados relacional, aliado ao uso de controle de versão com Git e GitHub.

## Objetivo

Registrar, gerenciar e consultar chamados de suporte técnico de forma organizada, permitindo o relacionamento entre usuários solicitantes, técnicos responsáveis e os detalhes de cada atendimento.

## Estrutura do Projeto

- `script_criacao.sql`: script responsável pela criação das tabelas `Usuarios`, `Tecnicos` e `Chamados`.
- `script_teste.sql`: script com comandos de inserção de dados, atualização, e testes de integridade relacional.
- `sistema_chamados.db`: arquivo de banco de dados SQLite com dados de exemplo já inseridos.

## Modelagem de Dados

### Entidades

- **Usuarios**
  - id_usuario
  - nome
  - email
  - setor

- **Tecnicos**
  - id_tecnico
  - nome
  - email
  - especialidade

- **Chamados**
  - id_chamado
  - id_usuario
  - id_tecnico
  - titulo
  - descricao
  - data_abertura
  - data_fechamento
  - status
  - solucao

### Relacionamentos

- Um chamado está relacionado a um usuário solicitante.
- Um chamado pode estar relacionado a um técnico responsável.
- As relações são mantidas por chaves estrangeiras (FKs).

## Como Executar

### Opção 1: Usando o DBeaver

1. Baixe o DBeaver em: https://dbeaver.io/
2. Crie uma nova conexão do tipo SQLite.
3. Selecione o arquivo `sistema_chamados.db` incluído no projeto.
4. Execute os scripts SQL disponíveis (`script_criacao.sql` e `script_teste.sql`), se desejar reiniciar os dados.
5. Use o editor SQL para executar consultas manuais e testar os relacionamentos.

### Opção 2: Linha de Comando com SQLite

```bash
sqlite3 sistema_chamados.db < script_criacao.sql
sqlite3 sistema_chamados.db < script_teste.sql
```

## Consultas Exemplares

```sql
-- Consultar chamados com nome do usuário e do técnico
SELECT 
    C.id_chamado,
    U.nome AS usuario,
    T.nome AS tecnico,
    C.titulo,
    C.status
FROM Chamados C
JOIN Usuarios U ON C.id_usuario = U.id_usuario
LEFT JOIN Tecnicos T ON C.id_tecnico = T.id_tecnico;
```

## Tecnologias Utilizadas

- Banco de dados SQLite
- Ferramenta de gerenciamento: DBeaver
- Scripts SQL puros
- Controle de versão com Git e repositório GitHub

## Licença

Projeto de caráter acadêmico para fins de aprendizagem e prática de banco de dados relacional e controle de versão.
