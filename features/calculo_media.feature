Feature: Cálculo de média e vizualização com cores da situação dos alunos
    
    Descrição: calcular a média dos alunos e informar por meio de cores a sitação do aluno: se está aprovado, passando por média ou vai pra final.

Scenario: calculo de média automático após registro de uma nota

Given estou logado como professor "Paulo" na página "Registro de Notas"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "10","8","-" e média "6"
When registro a nota "9" na ultima nota
Then na linha da aluna "Marina" vejo as notas "10", "8", "9" e média "9"

Scenario: mensagem de aviso quando o tipo de média não está definido

Given estou logado como professor "Paulo" na página "Registro de Notas"
And nenhuma opção está selecionada no campo "Tipo de Média"
And na linha da aluna "Marina" vejo as notas "10","8","-" e média "-"
When registro a nota "9" na ultima nota
Then eu continuo na página "Registro de Notas"
And eu vejo uma mensagem de aviso sobre o tipo de média
And na linha da aluna "Marina" vejo as notas "10","8","9" e média "-"