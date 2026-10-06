let
    Fonte = fnPlanilha("10_DESPESAS"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"CentroCusto",type text},{"Conta",type text},{"Valor",type number}},"pt-BR"),
    Cenario = Table.AddColumn(Tipos,"Cenario",each "Realizado",type text)
in
    Cenario
