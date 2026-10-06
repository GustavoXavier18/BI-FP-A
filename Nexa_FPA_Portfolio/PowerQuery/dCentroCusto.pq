Table.Sort(Table.Distinct(Table.Combine({Table.SelectColumns(fDespesas,{"CentroCusto"}),Table.SelectColumns(fDiario,{"CentroCusto"})})),{{"CentroCusto",Order.Ascending}})
