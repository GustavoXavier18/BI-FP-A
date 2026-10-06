let
    Fonte = fnPlanilha("13_DIARIO"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Lancamento",type text},{"Data",type date},{"ContaID",type text},{"Conta",type text},{"Grupo",type text},{"CentroCusto",type text},{"Historico",type text},{"Debito",type number},{"Credito",type number},{"Movimento",type number}},"pt-BR"),
    Cenario = Table.AddColumn(Tipos,"Cenario",each "Realizado",type text)
in
    Cenario
