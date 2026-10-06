let
    Fonte = fnPlanilha("07_CHECKS"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"Cenário",type text},{"BP R$",type number},{"DFC R$",type number},{"Diário R$",type number},{"Caixa final",type number},{"Status",type text},{"Alerta caixa",type text}},"pt-BR"),
    Nomes = Table.RenameColumns(Tipos,{{"Cenário","Cenario"},{"BP R$","CheckBP"},{"DFC R$","CheckDFC"},{"Diário R$","CheckDiario"},{"Caixa final","CaixaFinal"},{"Alerta caixa","AlertaCaixa"}})
in
    Nomes
