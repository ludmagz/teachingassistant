Feature: Importar notas de uma planilha.
Queremos uma feature que permita que o professor usuário seja capaz de importar
as notas dos alunos a partir de uma outra planilha externa (ex: numbers, excel etc.).

Scenario: Visualização bem-sucedida de importação
Given that the user is at the import grades page
When he adds a spreadsheet
And he clicks at the preview button
Then the system must show the details of the spreadsheet he will be importing

Scenario: Tentativa de upload com formato de spreadsheet inválido
Given that the user is at the import grades page
When he adds a .pdf archive
And he clicks at the preview button
Then the system must show an error message

Scenario: Tentativa de importação com planilha contendo notas fora do intervalo permitido
Given That the user is at the details of the spreadsheet page
And the spreadsheet contains a grade bigger then 10 or lower then 0
When he clicks de button import
Then the system must refuse the import
And show an warning