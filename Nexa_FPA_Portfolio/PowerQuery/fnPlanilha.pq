(Nome as text) as table =>
let
    Dados = stgExcel{[Item=Nome, Kind="Sheet"]}[Data],
    Cabecalhos = Table.PromoteHeaders(Dados, [PromoteAllScalars=true]),
    Linhas = Table.SelectRows(Cabecalhos, each List.NonNullCount(Record.FieldValues(_)) > 0),
    Textos = List.Select(Table.ColumnNames(Linhas), (c) => List.AllTrue(List.Transform(List.RemoveNulls(Table.Column(Linhas,c)), each Value.Is(_,type text)))),
    Limpo = Table.TransformColumns(Linhas,List.Transform(Textos,each {_,Text.Trim,type text}))
in
    Limpo
