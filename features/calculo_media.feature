Feature: Cálculo de média e vizualização com cores da situação dos alunos
    
    Descrição: calcular a média dos alunos e informar por meio de cores a sitação doa aluno: se está passando pro média, vai pra final, etc.

Scenario: calculo de média automático após registro de uma nota

Given estou logado como professor "Paulo" na página "Registro de Notas"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "10","8","-" e média "6"
When registro a nota "9" na ultima nota
Then na linha da aluna "Marina" vejo as notas "10", "8", "9" e média "9"