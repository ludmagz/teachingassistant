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
And show an warning which says "there are one invalid grade in the spreadsheet"
And the system must send an confirmation mail to the user

Scenario: Importação parcial com ignorar linhas inválidas
Given that the user submited an spreadsheet with 20 students
WHen two lines contains grades in text format
Then the system must import the 18 valid students
And generate an error message that says "Invalid type lines: Some students could not be imported"

Scenario: Importação de arquivo grande demais
Given that the user submited a file that surpasses the size limit
When he clicks the preview button
The system must show an error message

Scenario: Exportar relatório de notas importadas com sucesso
Given that the user finished importing an spreadsheet
When he clicks "Baixar relatório"
Then the system must generate an PDF archive with the resume of the saved grades
