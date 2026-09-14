Feature: Color code da situação de alunos
    As a professor
    I want to conseguir visualizar a situação dos alunos com respeito a reprovações passadas e à média da turma
    So that eu possa analisar o desempenho dos alunos e da turma

Scenario: Identificar aluno abaixo da média da turma
Given a média da turma é "7,0"
And o aluno de matrícula "123" possui média "6,5"
And o aluno não possui reprovações anteriores
When o professor visualizar a lista de alunos
Then o aluno deve ser destacado com a cor correspondente a "abaixo da média"

Scenario: Identificar aluno com reprovação anterior
Given a média da turma é "7,0"
And o aluno de matrícula "123" possui média "8,5"
And o aluno possui 1 reprovação anterior
When o professor visualizar a lista de alunos
Then o aluno deve ser destacado com a cor correspondente a "reprovação anterior"

Scenario: Identificar aluno com reprovação anterior e abaixo da média da turma
Given a média da turma é "7,0"
And o aluno de matrícula "123" possui média "6,5"
And o aluno possui 1 reprovação anterior
When o professor visualizar a lista de alunos
Then o aluno deve ser destacado com a cor correspondente a "reprovação anterior + abaixo da média"

Scenario: Identificar aluno com acima da média e sem reprovação anterior
Given a média da turma é "7,0"
And o aluno de matrícula "123" possui média "8,5"
And o aluno não possui reprovações anteriores
When o professor visualizar a lista de alunos
Then o aluno deve ser destacado com a cor correspondente a "sem reprovação anterior + acima da média"

Scenario: Identificar aluno na médoa
Given a média da turma é "7,0"
And o aluno de matrícula "123" possui média "7,0"
And o aluno não possui reprovações anteriores
When o professor visualizar a lista de alunos
Then o aluno deve ser destacado com a cor correspondente a "na média"
