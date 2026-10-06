let
    Fonte = fnPlanilha("09_VENDAS"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"ProdutoID",type text},{"Produto",type text},{"Regiao",type text},{"Canal",type text},{"Quantidade",type number},{"PrecoUnitario",type number},{"CustoUnitario",type number},{"ReceitaBruta",type number},{"CMV",type number}},"pt-BR"),
    Cenario = Table.AddColumn(Tipos,"Cenario",each "Realizado",type text)
in
    Cenario
