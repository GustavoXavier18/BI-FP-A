let
    Fonte = fnPlanilha("11_SALDO_INICIAL"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Conta",type text},{"Saldo",type number}},"pt-BR")
in
    Tipos
