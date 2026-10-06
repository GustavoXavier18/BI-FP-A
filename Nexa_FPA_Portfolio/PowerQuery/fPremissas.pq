let
    Fonte = fnPlanilha("08_PREMISSAS"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date},{"Cenario",type text},{"Quantidade",type number},{"TicketMedio",type number},{"CMVPercentual",type number},{"TaxaComercial",type number},{"TaxaLogistica",type number},{"ReceitaBruta",type number},{"CMV",type number},{"Pessoal",type number},{"Comercial",type number},{"Administrativo",type number},{"Tecnologia",type number},{"Logistica",type number},{"DSO",type number},{"DIO",type number},{"DPO",type number},{"TaxaVenda",type number},{"TaxaIR",type number},{"TaxaJuros",type number},{"TaxaDep",type number},{"Capex",type number},{"Captacao",type number},{"Amortizacao",type number},{"Dividendos",type number}},"pt-BR")
in
    Tipos
