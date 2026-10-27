Feature: Cálculo de média e vizualização com cores da situação dos alunos
    
    Descrição: calcular a média dos alunos e informar por meio de cores a sitação do aluno: se está aprovado, passando por média ou vai pra final.

Scenario: calculo de média automático após registro de uma nota

Given estou na página "Evaluations" na turma "ESS - (2026/1)" na turma "ESS - (2026/1)"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "10.0","8.0","-" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
When registro a nota "9.0" na meta "Saas"
Then na linha da aluna "Marina" vejo as notas "10.0", "8.0", "9.0" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "9.0"

Scenario: mensagem de aviso quando o tipo de média não está definido

Given estou na página "Evaluations" na turma "ESS - (2026/1)"
And nenhuma opção está selecionada no campo "Tipo de Média"
And na linha da aluna "Marina" vejo as notas "10.0","8.0","-" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
When registro a nota "9.0" na meta "Saas"
Then eu continuo na página "Evaluations" na turma "ESS - (2026/1)"
And eu vejo uma mensagem de aviso sobre o tipo de média
And na linha da aluna "Marina" vejo as notas "10.0","8.0","9.0" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"

Scenario: coloração dos alunos quando ainda tem alguma nota não preenchida

Given estou na página "Evaluations" na turma "ESS - (2026/1)"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "7.0","-","-" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
And o campo "média" da aluna "Marina" não está colorida
When registro a nota "6.9" na meta "Saas"
Then na linha da aluna "Marina" vejo as notas "7.0", "-", "6.9"nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
And o campo "média" da aluna "Marina" não está colorida

Scenario: coloração automática dos alunos quando uma nota é inserida

Given estou na página "Evaluations" na turma "ESS - (2026/1)"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "7.0","7.0","-" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
And o campo "média" da aluna "Marina" não está colorida
When registro a nota "9.0" na meta "Saas"
Then eu continuo na página "Evaluations" na turma "ESS - (2026/1)"
And na linha da aluna "Marina" vejo as notas "7.0", "7.0", "9.0" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "8.0"
And o campo "média" da aluna "Marina" está colorido de verde

Scenario: coloração dos alunos quando a média é arredondada e muda de faixa

Given estou na página "Evaluations" na turma "ESS - (2026/1)"
And a opção "média simples" está selecionada
And na linha da aluna "Marina" vejo as notas "7.0","7.0","-" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "-"
And o campo "média" da aluna "Marina" não está colorida
When registro a nota "6.9" na meta "Saas"
Then na linha da aluna "Marina" vejo as notas "7.0", "7.0", "6.9" nas metas "Requisitos", "Testes" e "Saas", respectivamente e média "7.0"
And o campo "média" da aluna "Marina" está colorido de verde

Scenario: legenda das colorações da situação do aluno

Given estou na página "Evaluations" na turma "ESS - (2026/1)"
Then abaixo das linhas dos alunos tem a legenda das cores
And a cor verde tem a informação "Aprovado"
And a cor amarelo tem a informação "Final"
And a cor vermelho tem a informação "Reprovado"
