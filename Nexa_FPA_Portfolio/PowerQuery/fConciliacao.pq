let
    Fonte = fnPlanilha("15_CONCILIACAO"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"ContaID",type text},{"Campo",type text},{"SaldoDiario",type number},{"SaldoModelo",type number},{"Diferenca",type number}},"pt-BR"),
    Cenario = Table.AddColumn(Tipos,"Cenario",each "Realizado",type text)
in
    Cenario
