# QA e reconciliação — NEXA

**4.522 verificações independentes, nenhuma falha.** Tolerância: R$ 0,01. Maior resíduo absoluto: R$ 0.000000004191. Diferenças residuais decorrem da representação de ponto flutuante.

## Escopo financeiro conferido

- Identidades de receita, lucro bruto, EBITDA, lucro líquido e FCL nos 96 registros financeiros.
- Ativo = Passivo + PL, FCO direto = indireto, financiamento e continuidade do caixa.
- NCG com todos os passivos operacionais incluídos.
- Receita e CMV de vendas e Opex de despesas contra o realizado.
- 721 lançamentos individualmente balanceados e 288 conciliações patrimoniais.
- 216 segmentos comerciais de preço/volume: fechamento, receita inicial/final contra vendas e efeitos recalculados.
- Primeiro semestre do forecast igual ao realizado; aberturas dos três cenários iguais ao caixa realizado final de 2025.
- Linhas modeladas dos outputs DRE, BP e indicadores: 12 meses e totais/posições anuais. Linhas mapeadas da DFC: meses e visão anual com sinais de entrada/saída.
- 9.397 fórmulas percorridas. Nenhum erro Excel e nenhum valor financeiro central sem cache.

Detalhamento: `qa_detalhado.csv`. Resultados e totais: `qa_resultados.json`. Reproduzir: `python scripts/qa_reconcile.py`; requer openpyxl. O script não altera a fonte.

## Totais esperados

| Cenário | Ano | Receita líquida | EBITDA | Caixa final | FCL |
|---|---:|---:|---:|---:|---:|
| Realizado | 2024 | R$ 13.080.157,48 | R$ 1.027.922,75 | R$ 1.832.722,79 | −R$ 951.277,21 |
| Realizado | 2025 | R$ 15.545.584,11 | R$ 944.009,95 | R$ 1.000.255,59 | −R$ 966.467,20 |
| Orçamento | 2024 | R$ 12.462.025,50 | R$ 1.082.517,30 | R$ 2.039.743,67 | −R$ 744.256,33 |
| Orçamento | 2025 | R$ 14.705.190,09 | R$ 1.503.690,41 | R$ 2.357.190,04 | R$ 183.446,37 |
| Forecast 6+6 | 2025 | R$ 14.725.756,59 | R$ 853.955,75 | R$ 1.177.541,55 | −R$ 789.181,25 |
| Base 2026 | 2026 | R$ 17.411.054,20 | R$ 1.516.609,48 | R$ 1.188.635,85 | R$ 404.380,26 |
| Otimista 2026 | 2026 | R$ 18.965.612,61 | R$ 2.182.945,89 | R$ 2.217.344,89 | R$ 1.433.089,30 |
| Adverso 2026 | 2026 | R$ 14.612.849,06 | R$ 259.370,99 | R$ 305.554,39 | −R$ 2.278.701,20 |

Realizado 2025: lucro líquido R$ 379.664,97; margem EBITDA 6,072528%; NCG final R$ 3.116.180,95; dívida final R$ 718.000,00; liquidez corrente 3,204275x. FCO de −R$ 462.467,20, capex de R$ 504.000,00 e financiamento líquido de R$ 134.000,00 produzem variação de caixa de −R$ 832.467,20.

Ponte comercial: R$ 14.295.254,08 + R$ 1.962.823,26 de volume + R$ 731.632,07 de preço = R$ 16.989.709,41 de receita bruta 2025. A interação preço/volume é atribuída ao preço.

O cenário adverso contém captação de R$ 1,8 milhão em março/2026. Todos os meses têm caixa positivo com essa captação; o mínimo é R$ 55.823,50 em novembro. Não apresentar esse cenário como autofinanciado.

## Validação técnica realizada

- PBIP/PBIR: arquivos validados contra schemas oficiais Microsoft, com referências resolvidas localmente.
- TMDL: desserialização e round-trip com Microsoft.AnalysisServices.NetCore.retail.amd64 19.84.1, em .NET 8; 24 tabelas, 26 relacionamentos e 225 medidas.
- Power Query: 27 queries analisadas pelo parser oficial @microsoft/powerquery-parser, sem erro sintático.
- Tema e formatação: propriedades comparadas ao reportThemeSchema-2.157; tema válido. Os relatórios JSON de validação estão nesta pasta.
- Referências de visuais, campos, medidas, navegação, tooltips, recursos e limites do canvas: verificadas estaticamente.

## Validação restante no Desktop

A validação acima não executa o engine DAX, o engine M ou a renderização do Power BI Desktop. Não há Desktop neste ambiente. Após configurar a fonte e atualizar, executar `scripts/QA_Desktop.dax` em Exibição de Consulta DAX e confrontar estes totais; nenhuma consulta desse arquivo foi executada aqui. Testar a abertura, atualização, navegação, tooltips, limpeza de slicers, formatação dinâmica e largura/altura das matrizes no Desktop. As prévias PNG/PDF foram renderizadas independentemente em Python; não são capturas do Desktop.

O status contábil corresponde ao histórico, enquanto BP e DFC cobrem também os cenários. Um check do diário vazio em 2026 não comprova contabilização de projeções futuras. Os dois totais anuais de MoM em 05_INDICADORES são vazios por definição.

## Integridade da fonte

SHA-256 do Excel original e da cópia incluída: `fd51d0ac200f8cfabd15662d3fb91633b791ba33f6f444a10df6c31ad7cd0a43`. O arquivo original não foi alterado.
