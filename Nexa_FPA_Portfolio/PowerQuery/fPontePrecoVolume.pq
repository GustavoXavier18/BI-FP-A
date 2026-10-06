let
    Fonte = fnPlanilha("16_PONTE_PRECO_VOLUME"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"Produto",type text},{"Regiao",type text},{"Canal",type text},{"Receita2024",type number},{"Receita2025",type number},{"EfeitoVolume",type number},{"EfeitoPreco",type number},{"Variacao",type number},{"Check",type number}},"pt-BR")
in
    Tipos
