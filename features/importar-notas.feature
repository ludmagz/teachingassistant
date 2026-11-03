Feature: Importar notas de uma planilha.
As a professor
I want to cadastrar as notas dos estudantes no sistema por meio de uma planilha .csv
So that eu perca menos tempo preenchendo notas

Scenario: Importação bem-sucedida de uma planilha de notas
Given que o usuário "Paulo" está na tela de importar notas
When ele adiciona uma planilha de notas
And ele seleciona a opção de preencher a tabela da turma "2025.1"
Then o sistema deve mostrar uma mensagem de confirmação de preenchimento

Scenario: Tentativa de upload de tabela com formato inválido
Given que o usuário "Paulo" está na tela de importar notas
When ele adiciona um arquivo de um tipo diferente de .csv
And ele seleciona a opção de preencher a tabela da turma "2025.1"
Then o sistema deve mostrar uma mensagem de erro de leitura da planilha

Scenario: Tentativa de importação com planilha contendo notas fora do intervalo permitido
Given que o usuário "Paulo" está na tela de importar notas
And a tabela contém uma nota maior que 10 ou menor que 0
When "Paulo" seleciona a opção de preencher a tabela da turma "2025.1"
Then o sistema deve recusar a importação
And mostrar um aviso sobre uma ou mais notas inválidas

Scenario: Tentativa de importação de planilha com informações inválidas
Given que o usuário "Paulo" adicionou uma planilha com uma nota não numérica
When uma célula ou mais da coluna notas contém dados inválidos (tipo errado)
Then o sistema deve recusar a importação
And mostrar um aviso sobre uma ou mais notas inválidas

Scenario: Importação de arquivo grande demais
Given que o usuário "Paulo" está na tela de importação de notas
And "Paulo" seleciona um arquivo que passa o tamanho de importação limite de 1MB
When "Paulo" seleciona a opção de preencher a tabela da turma "2025.1"
Then o sistema deve recusar a importação
And mostrar um aviso sobre planilha grande demais

Scenario: Importação de arquivo nulo
Given que o usuário "Paulo" está na tela de importação de notas
And "Paulo" seleciona um arquivo que está vazio
When "Paulo" seleciona a opção de preencher a tabela da turma "2025.1"
Then o sistema deve recusar a importação
And mostrar um aviso sobre planilha vazia
