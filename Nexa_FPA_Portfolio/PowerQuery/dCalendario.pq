let
    Inicio = #date(2024,1,1),
    Fim = #date(2026,12,31),
    Fonte = Table.FromList(List.Dates(Inicio,Duration.Days(Fim-Inicio)+1,#duration(1,0,0,0)),Splitter.SplitByNothing(),{"Data"}),
    Tipos = Table.TransformColumnTypes(Fonte,{{"Data",type date}}),
    Ano = Table.AddColumn(Tipos,"Ano",each Date.Year([Data]),Int64.Type),
    MesNumero = Table.AddColumn(Ano,"MesNumero",each Date.Month([Data]),Int64.Type),
    Mes = Table.AddColumn(MesNumero,"Mes",each Date.ToText([Data],"MMMM","pt-BR"),type text),
    MesAbrev = Table.AddColumn(Mes,"MesAbrev",each Text.Proper(Date.ToText([Data],"MMM","pt-BR")),type text),
    AnoMes = Table.AddColumn(MesAbrev,"AnoMes",each Date.ToText([Data],"yyyy-MM"),type text),
    OrdemAnoMes = Table.AddColumn(AnoMes,"OrdemAnoMes",each [Ano]*100+[MesNumero],Int64.Type),
    Trimestre = Table.AddColumn(OrdemAnoMes,"Trimestre",each "T" & Text.From(Date.QuarterOfYear([Data])),type text),
    Semestre = Table.AddColumn(Trimestre,"Semestre",each if [MesNumero]<=6 then "S1" else "S2",type text)
in
    Semestre
