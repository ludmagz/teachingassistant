Feature: Cálculo de média e vizualização com cores da situação dos alunos
    
    Descrição: calcular a média dos alunos e informar por meio de cores a sitação do aluno: se está aprovado, passando por média ou vai pra final.

Scenario: calculo de média automático após registro de uma nota

Given estou logado como professor "Paulo" na página "Registro de Notas"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "10.0","8.0","-" e média "6.0"
When registro a nota "9.0" na ultima avaliação
Then na linha da aluna "Marina" vejo as notas "10.0", "8.0", "9.0" e média "9.0"

Scenario: mensagem de aviso quando o tipo de média não está definido

Given estou logado como professor "Paulo" na página "Registro de Notas"
And nenhuma opção está selecionada no campo "Tipo de Média"
And na linha da aluna "Marina" vejo as notas "10.0","8.0","-" e média "-"
When registro a nota "9.0" na ultima avaliação
Then eu continuo na página "Registro de Notas"
And eu vejo uma mensagem de aviso sobre o tipo de média
And na linha da aluna "Marina" vejo as notas "10.0","8.0","9.0" e média "-"

Scenario: coloração dos alunos quando a média é arredondada e muda de faixa

Given estou logado como professor "Paulo" na página "Registro de Notas"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "7.0","7.0","-" e média "4.7"
When registro a nota "6.9" na ultima avaliação
Then na linha da aluna "Marina" vejo as notas "7.0", "7.0", "6.9" e média "7.0"
And o campo "média" da aluna "Marina" está colorido de verde