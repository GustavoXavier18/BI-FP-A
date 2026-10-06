Table.Sort(Table.Distinct(Table.SelectColumns(fVendas,{"ProdutoID","Produto"})),{{"ProdutoID",Order.Ascending}})
