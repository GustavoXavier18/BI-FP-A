# Reproduzir as validações técnicas

Na raiz do projeto, após instalar as dependências Python de scripts/requirements.txt:

```sh
python scripts/qa_reconcile.py
python scripts/validate_structure.py
python scripts/validate_visuals.py
python scripts/validate_references.py
```

Validação da sintaxe M (requer Node.js e instalação do parser):

```sh
npm install --prefix scripts
node scripts/validate_m.cjs
```

Validação TMDL com o serializer oficial (requer SDK .NET 8):

```sh
dotnet run --project scripts/TmdlValidation -- .
```

Esses checks não executam o engine DAX/M ou renderizam Power BI. A validação de execução deve ser feita após o refresh, com scripts/QA_Desktop.dax no Desktop. Scripts e schemas são entregues para reprodutibilidade; nenhum compilador ou pacote de dependências está incluído no ZIP.

Os schemas são cópias das definições oficiais Microsoft, preservadas para validação offline, oriundas de:

- https://github.com/microsoft/json-schemas/tree/main/fabric
- https://github.com/microsoft/powerbi-desktop-samples/tree/main/Report%20Theme%20JSON%20Schema

Bibliotecas oficiais: Microsoft.AnalysisServices.NetCore.retail.amd64 19.84.1 e @microsoft/powerquery-parser. Consulte os termos dos respectivos repositórios/pacotes ao redistribuir dependências. O ZIP contém o projeto autoral e os schemas de referência, sem os binários das bibliotecas.
