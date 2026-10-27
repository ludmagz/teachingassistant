Feature: Definição do cálculo de média

  Scenario: Configuração bem-sucedida do modelo de notas numéricas simples
    Given o sistema não possui regras de cálculo definidas para a turma "Engenharia de Software e Sistemas"
    And eu acesso o sistema na página de configurações da turma
    When eu seleciono o modelo de avaliação "Numérico de 0 a 10 sem pesos"
    And defino a quantidade de provas como "3"
    And defino a média de corte para aprovação como "7.0"
    And confirmo a gravação dos dados
    Then o sistema armazena o modelo numérico, a quantidade de provas "3", e a nota de corte "7.0" para a turma "Engenharia de Software e Sistemas"
    And retorna uma mensagem de confirmação da configuração

  Scenario: Configuração bem-sucedida do modelo de notas numéricas ponderadas
    Given o sistema não possui regras de cálculo definidas para a turma "Engenharia de Software e Sistemas"
    And eu acesso o sistema na página de configurações da turma
    When eu seleciono o modelo de avaliação "Numérico de 0 a 10 com pesos"
    And defino a quantidade de provas como "3"
    And defino a média de corte para aprovação como "7.0"
    And defino os pesos das avaliações como "2", "3" e "5"
    And confirmo a gravação dos dados
    Then o sistema armazena o modelo numérico, a quantidade de provas "3", a nota de corte "7.0", e os pesos "2", "3" e "5" para a turma "Engenharia de Software e Sistemas"
    And retorna uma mensagem de confirmação da configuração

  Scenario: Configuração bem-sucedida de modelo qualitativo baseado em conceitos
    Given o sistema não possui regras de cálculo definidas para a turma "Eletrônica"
    And eu acesso o sistema como "professora" na página de configurações da turma
    When eu seleciono o modelo de avaliação "Conceitos (MA, MPA, MANA)"
    And confirmo a gravação dos dados
    Then o sistema armazena o modelo qualitativo para a turma "Eletrônica"
    And oculta o campo de média de corte numérica
    And retorna uma mensagem de confirmação da configuração

  Scenario: Alteração de um modelo de média já existente
    Given a turma "Engenharia de Software e Sistemas" já está configurada com o modelo "Conceitos (MA, MPA, MANA)"
    And eu acesso o sistema na página de configurações desta turma
    When eu altero o modelo de avaliação para "Numérico de 0 a 10 simples"
    And defino a quantidade de provas como "2"
    And defino a média de corte para aprovação como "5.0"
    And confirmo a gravação dos dados
    Then o sistema substitui as regras anteriores
    Then o sistema armazena o modelo numérico, a quantidade de provas "2" e a nota de corte "5.0" para a turma "Engenharia de Software e Sistemas"
    And retorna uma mensagem de aviso sobre o impacto na visualização do diário de notas

  Scenario: arredondamento da média para 1 casa decimal sempre para cima
    Given estou logado na página "Registro de Notas"
    And a opção "média simples" está selecionada
    And na linha da aluna "Marina" vejo as notas "10","8.1","-" e média "6.1"
    When registro a nota "9.3" na ultima nota
    Then na linha da aluna "Marina" vejo as notas "10", "8.1", "9.3" e média "9.2"
    And retorna a mensagem de que a nota da aluna "Marina" foi alterada com sucesso

  Scenario: Tentativa de configuração com nota de corte inválida
    Given eu acesso o sistema na página de configurações da turma "Física 3"
    When eu seleciono o modelo de avaliação "Numérico de 0 a 10 sem pesos"
    And defino a média de corte para aprovação como "11.5"
    And confirmo a gravação dos dados
    Then o sistema recusa o armazenamento
    And exibe uma mensagem de erro informando que a nota de corte deve estar entre 0 e 10

  Scenario: Tentativa de configuração de pesos no modelo numérico ponderado inválida
    Given eu acesso o sistema na página de configurações da turma "Física 3"
    When eu seleciono o modelo de avaliação "Numérico de 0 a 10 ponderado"
    And defino a quantidade de provas como "3"
    And defino a média de corte para aprovação como "7.0"
    And defino os pesos das avaliações como "5", "3" e "5"
    And confirmo a gravação dos dados
    Then o sistema recusa o armazenamento
    And exibe uma mensagem de erro informando que a soma dos pesos deve resultar 10.