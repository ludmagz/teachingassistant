Feature: Color code da situação de alunos
    As a professor
    I want to conseguir visualizar a situação dos alunos com respeito a reprovações passadas e à média da turma
    So that eu possa analisar o desempenho dos alunos e da turma

Scenario: Identificar aluno abaixo da média da turma
Given a média da turma "Engenharia de Software (2026/2)" é "7,0"
And a aluna "Marina" possui média "6,5"
And a aluna não possui reprovações anteriores
When entro nessa turma na aba "Turmas"
Then a aluna deve ser destacada com o indicador correspondente a "abaixo da média"

Scenario: Identificar aluno com reprovação anterior
Given a média da turma "Engenharia de Software (2026/2)" é "7,0"
And a aluna "Marina" possui média "8,5"
And a aluna possui 1 reprovação anterior
When entro nessa turma na aba "Turmas"
Then a aluna deve ser destacada com o indicador correspondente a "reprovação anterior"

Scenario: Identificar aluno com reprovação anterior e abaixo da média da turma
Given a média da turma "Engenharia de Software (2026/2)" é "7,0"
And a aluna "Marina" possui média "6,5"
And a aluna possui 1 reprovação anterior
When entro nessa turma na aba "Turmas"
Then a aluna deve ser destacada com o indicador correspondente a "reprovação anterior + abaixo da média"

Scenario: Identificar aluno com acima da média e sem reprovação anterior
Given a média da turma "Engenharia de Software (2026/2)" é "7,0"
And a aluna "Marina" possui média "8,5"
And a aluna não possui reprovações anteriores
When entro nessa turma na aba "Turmas"
Then a aluna deve ser destacada com o indicador correspondente a "sem reprovação anterior + acima da média"

Scenario: Identificar aluno na média
Given a média da turma é "7,0"
And a aluna "Marina" possui média "7,0"
And a aluna não possui reprovações anteriores
When entro nessa turma na aba "Turmas"
Then a aluna deve ser destacada com o indicador correspondente a "na média"

Scenario: Média da turma ainda não existe
Given a média da turma "Engenharia de Software (2026/2)" é "None"
And a aluna "Marina" não possui média calculada
And a aluna não possui reprovações anteriores
When entro nessa turma na aba "Turmas"
Then a aluna não é destacada com nenhum indicador

Scenario: Média da turma existe e a do aluno não existe
Given a média turma "Engenharia de Software (2026/2)" é "8.0"
And a aluna "Marina" não possui média calculada
And a aluna não possui reprovações anteriores
When entro nessa turma na aba "Turmas"
Then a aluna não é destacada com nenhum indicador
