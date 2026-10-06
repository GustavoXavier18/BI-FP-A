let
    Fonte = Table.Distinct(Table.SelectColumns(fFinanceiro,{"Cenario"})),
    Ordem = Table.AddColumn(Fonte,"Ordem", each if [Cenario]="Realizado" then 1 else if [Cenario]="Orçamento" then 2 else if [Cenario]="Forecast 6+6" then 3 else if [Cenario]="Base 2026" then 4 else if [Cenario]="Otimista 2026" then 5 else 6, Int64.Type)
in
    Table.Sort(Ordem,{{"Ordem",Order.Ascending}})
