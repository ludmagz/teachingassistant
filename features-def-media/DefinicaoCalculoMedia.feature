Feature: Definição do cálculo de média

  Scenario: Configuração bem-sucedida do modelo de notas numéricas
    Given o sistema não possui regras de cálculo definidas para a turma "Engenharia de Software e Sistemas"
    And eu acesso o sistema como "professora" na página de configurações da turma
    When eu seleciono o modelo de avaliação "Numérico de 0 a 10"
    And defino a média de corte para aprovação como "7.0"
    And confirmo a gravação dos dados
    Then o sistema armazena o modelo numérico e a nota de corte "7.0" para a turma "Engenharia de Software e Sistemas"
    And retorna uma mensagem de confirmação da configuração

  Scenario: Alteração de um modelo de média já existente
    Given a turma "Engenharia de Software e Sistemas" já está configurada com o modelo "Conceitos (MA, MPA, MANA)"
    And eu acesso o sistema como "professora" na página de configurações desta turma
    When eu altero o modelo de avaliação para "Numérico de 0 a 10"
    And defino a média de corte para aprovação como "5.0"
    And confirmo a gravação dos dados
    Then o sistema substitui as regras anteriores
    Then o sistema armazena o modelo numérico com corte "5.0" para a turma "Engenharia de Software e Sistemas"
    And retorna uma mensagem de aviso sobre o impacto na visualização do diário de notas

  Scenario: arredondamento da média para 1 casa decimal sempre para cima
    Given estou logado como professor "Paulo" na página "Registro de Notas"
    And a opção "média simples" está selecionada
    And na linha da aluna "Marina" vejo as notas "10","8.1","-" e média "6.1"
    When registro a nota "9.3" na ultima nota
    Then na linha da aluna "Marina" vejo as notas "10", "8.1", "9.3" e média "9.2"
