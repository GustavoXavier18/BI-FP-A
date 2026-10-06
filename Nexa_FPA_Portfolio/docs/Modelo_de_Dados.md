# Modelo semântico — NEXA

24 tabelas, 26 relacionamentos e 225 medidas. Modo Import. Cultura pt-BR. Data inicial histórica 01/01/2024; calendário completo até 31/12/2026.

## Arquitetura e decisão de manter o financeiro wide

`fFinanceiro` conserva as 73 colunas do modelo integrado, com chave mês/cenário e 96 registros. É uma fonte pequena, coerente e de alta auditabilidade. Transformá-la em linhas de contas multiplicaria os registros e obrigaria a manter regras de fluxo/posição por atributo. As dimensões desconectadas `aDRE` e `aBP` resolvem a apresentação vertical das demonstrações sem duplicar fatos. Os relacionamentos são 1:N, unidirecionais da dimensão para o fato. Não existe relacionamento fato/fato nem bidirecional.

## Tabelas

| Tabela | Colunas | Grupo Power Query | Função |
|---|---:|---|---|
| fFinanceiro | 73 | 02_Fatos | Modelo integrado; granularidade mês/cenário. Fluxos acumulam; posições usam último mês. Fontes de detalhe realizadas conciliadas separadamente. |
| fVendas | 11 | 02_Fatos | Histórico comercial realizado por mês, produto, região e canal. |
| fDespesas | 5 | 02_Fatos | Histórico de despesas por mês, centro de custo e descrição de conta. |
| fPremissas | 25 | 02_Fatos | Premissas mensais financeiras; prazos e taxas são posições, quantidade e investimentos são fluxos. |
| fPontePrecoVolume | 10 | 02_Fatos | Receita bruta: volume a preço anterior; preço a quantidade atual. Interação atribuída ao preço. |
| fDiario | 11 | 99_QA | Diário contábil histórico; partidas dobradas em 721 lançamentos. |
| fConciliacao | 7 | 99_QA | Conciliação histórica de 12 contas patrimoniais, com abertura explícita. |
| fChecks | 8 | 99_QA | Checks por mês/cenário. Diário é aplicável somente ao Realizado. |
| aSaldoInicial | 2 | 03_Apoio | Saldos de abertura em 31/12/2023. Apoio sem relacionamento. |
| dConta | 5 | 01_Dimensoes | Plano de contas contábil. Chave ContaID; não se relaciona por descrição à base de despesas. |
| dCalendario | 9 | 01_Dimensoes | Calendário contínuo 2024–2026, marcado como tabela de datas. |
| dCenario | 2 | 01_Dimensoes | Dimensão compartilhada de Cenario. |
| dProduto | 2 | 01_Dimensoes | Dimensão compartilhada de Produto. |
| dRegiao | 1 | 01_Dimensoes | Dimensão compartilhada de Regiao. |
| dCanal | 1 | 01_Dimensoes | Dimensão compartilhada de Canal. |
| dCentroCusto | 1 | 01_Dimensoes | Dimensão compartilhada de CentroCusto. |
| dContaDespesa | 1 | 01_Dimensoes | Dimensão compartilhada de ContaDespesa. |
| aConfig | 1 | 03_Apoio | Tolerância central para os controles de integridade. |
| aDRE | 5 | 03_Apoio | Linhas de apresentação desconectadas; custos positivos, favorabilidade inversa. |
| aBP | 3 | 03_Apoio | Linhas de apresentação do balanço; último mês de cada cenário. |
| aPontePV | 2 | 03_Apoio | Etapas da ponte comercial; total automático corresponde à receita 2025. |
| aPonteCaixa | 2 | 03_Apoio | Componentes aditivos; total automático corresponde à variação de caixa. |
| aVariancia | 2 | 03_Apoio | Ponte do EBITDA orçado ao realizado; total automático é EBITDA realizado. |

`_Medidas` possui uma coluna oculta de suporte e todas as medidas organizadas em 13 pastas. Os campos dos fatos são ocultos para incentivar medidas explícitas. Campos de ordenação e mapeamento também são ocultos.

## Relacionamentos

| Fato (N) | Dimensão (1) |
|---|---|
| fFinanceiro[Data] | dCalendario[Data] |
| fVendas[Data] | dCalendario[Data] |
| fDespesas[Data] | dCalendario[Data] |
| fPremissas[Data] | dCalendario[Data] |
| fPontePrecoVolume[Data] | dCalendario[Data] |
| fDiario[Data] | dCalendario[Data] |
| fConciliacao[Data] | dCalendario[Data] |
| fChecks[Data] | dCalendario[Data] |
| fFinanceiro[Cenario] | dCenario[Cenario] |
| fVendas[Cenario] | dCenario[Cenario] |
| fDespesas[Cenario] | dCenario[Cenario] |
| fPremissas[Cenario] | dCenario[Cenario] |
| fDiario[Cenario] | dCenario[Cenario] |
| fConciliacao[Cenario] | dCenario[Cenario] |
| fChecks[Cenario] | dCenario[Cenario] |
| fVendas[ProdutoID] | dProduto[ProdutoID] |
| fPontePrecoVolume[Produto] | dProduto[Produto] |
| fVendas[Regiao] | dRegiao[Regiao] |
| fVendas[Canal] | dCanal[Canal] |
| fPontePrecoVolume[Regiao] | dRegiao[Regiao] |
| fPontePrecoVolume[Canal] | dCanal[Canal] |
| fDespesas[CentroCusto] | dCentroCusto[CentroCusto] |
| fDiario[CentroCusto] | dCentroCusto[CentroCusto] |
| fDespesas[Conta] | dContaDespesa[Conta] |
| fDiario[ContaID] | dConta[ContaID] |
| fConciliacao[ContaID] | dConta[ContaID] |

`dProduto` possui ProdutoID e Produto únicos no arquivo recebido. A ponte usa Produto porque sua fonte não possui ProdutoID; vendas usa ProdutoID. Esse desenho exige manter ambos únicos. `dCentroCusto` é a união dos valores de despesas e diário; inclui Corporativo e Logistica para evitar chaves órfãs. Os nomes originais são preservados para rastreabilidade; o diário tem a variante Logistica e despesas usa Operações.

`dConta` relaciona exclusivamente fatos contábeis por ContaID. `dContaDespesa` controla descrições comerciais de despesas, que não têm a mesma chave do plano contábil. `fPontePrecoVolume` não tem relacionamento de cenário, pois explica apenas a variação comercial realizada de 2024 para 2025.

## Agregação

- DRE, DFC, capex, captação, amortização e dividendos: soma no período.
- BP, dívida, caixa final, NCG e prazos: último mês disponível no período e cenário.
- Caixa inicial: abertura do primeiro mês disponível.
- Margens: razão dos fluxos acumulados, não média das margens mensais.
- Preço médio: receita / quantidade. Ticket planejado: média ponderada por quantidade.
- Liquidez corrente: ativo circulante final / passivo circulante final.
- Dívida/EBITDA: dívida final / EBITDA LTM, somente com 12 meses do mesmo cenário e EBITDA positivo.
- MoM: disponível somente para um único AnoMês selecionado. Não calcula comparação mensal para totais anuais.
- YoY de cenários novos: a medida Receita LY Referência usa realizado anterior; YoY do mesmo cenário fica vazio se não houver base.

Sem cenário selecionado, a leitura financeira usa Realizado. Uma seleção explícita de múltiplos cenários produz aviso e medidas financeiras vazias; a página Cenários compara simultaneamente em colunas/legendas, que estabelecem um cenário por célula. Realizado, Orçamento e Forecast forçam sua própria dimensão de cenário nas comparações.

## Fonte e refresh

Todas as queries financeiras usam Excel.Workbook(File.Contents(pArquivoExcel)). Os CSVs na pasta data são snapshots para QA, não fontes do relatório. O Excel recebido foi copiado byte a byte, sem edição. `pArquivoExcel` é o único caminho a configurar. `pTolerancia` define R$ 0,01.

As consultas estão agrupadas em 00_Parametros, 01_Dimensoes, 02_Fatos, 03_Apoio e 99_QA. `stgExcel` e `fnPlanilha` centralizam acesso, cabeçalhos, remoção de linhas vazias e trim de textos. Não são carregadas como fatos.

O Power Query lê resultados armazenados nas células; não recalcula as fórmulas do Excel. Ao alterar premissas, recalcule e salve a fonte no Excel antes do refresh. Bases históricas e diário são snapshots, e alterações históricas exigem regeneração contábil coerente.

## Limites financeiros

DSO usa receita bruta, DIO e DPO usam CMV e a convenção de 30 dias. Dívida CP é o menor valor entre dívida e amortização mensal × 12. Juros pertencem à operação e dividendos ao financiamento. NCG inclui salários, tributos de venda e IR a pagar. Tributos são simulações pedagógicas. Dívida líquida negativa indica caixa maior que dívida.

Detalhes comerciais existem apenas para realizado; os filtros de produto, região e canal não são aplicados ao planejamento financeiro agregado. Os outputs 01_PAINEL a 06_VARIACOES são referências de validação, sem importação como fatos adicionais.
