let
    Fonte = fnPlanilha("14_PLANO_CONTAS"),
    Tipos = Table.TransformColumnTypes(Fonte,{{"ContaID",type text},{"Conta",type text},{"Grupo",type text},{"Natureza",type text},{"CampoModelo",type text}},"pt-BR")
in
    Tipos
