# NEXA | FP&A INTEGRADO

Projeto autoral de **Gustavo Xavier**. Empresa e dados inteiramente fictícios.

Case: **“Quando vender mais não significa gerar mais caixa.”** Receita cresce 18,8% em 2025, mas margem EBITDA cai de 7,9% para 6,1% e caixa de dezembro recua 45,4%.

O pacote contém um projeto Power BI em **PBIP + PBIR + TMDL**, sete páginas de negócio, três páginas de tooltip, 225 medidas DAX, 27 queries Power Query e tema próprio. O Excel original foi preservado e incluído como cópia idêntica.

## Abrir no Power BI Desktop

1. Extraia o ZIP preservando toda a estrutura de pastas.
2. Use o Power BI Desktop atualizado. Ative o formato de projeto PBIP/PBIR em Opções > Recursos de visualização, se a sua versão exigir, e reinicie o aplicativo.
3. Com o projeto fechado, execute `scripts/Configurar_Fonte.cmd` no Windows. Ele configura automaticamente a cópia do Excel na pasta `data`, sem modificar a planilha. Para usar outra localização: `powershell -NoProfile -File scripts/Configurar_Fonte.ps1 -ArquivoExcel "C:\caminho\Projeto_FPA_Nexa_Distribuicao.xlsx"`.
4. Abra **Nexa_FPA_Portfolio.pbip** e clique em **Atualizar**. Alternativamente, configure `pArquivoExcel` em Transformar dados > Gerenciar parâmetros antes do refresh. O caminho inicial de referência é C:\NEXA\data\Projeto_FPA_Nexa_Distribuicao.xlsx.
5. Confira a página 01 em Realizado/2025 e execute as consultas de `scripts/QA_Desktop.dax` na Exibição de Consulta DAX. Os números esperados estão em `docs/QA_Reconciliacao.md`.
6. Confira matrizes, navegação e tooltips na sua versão do Desktop e salve. Para obter um PBIX válido, use Salvar como no Desktop depois do refresh e da validação.

**Não foi gerado PBIX.** O modelo foi validado pelo serializer oficial TMDL e as definições PBIR pelos schemas, mas refresh, execução DAX/M e renderização do Desktop não foram executados neste ambiente.

## Páginas

| Página | Pergunta respondida |
|---|---|
| 01 Executive Overview | Crescemos com margem e caixa? |
| 02 Growth & Drivers | Quanto do crescimento veio de preço e volume, e onde ocorreu? |
| 03 P&L & Variance | O que explica o desvio de resultado e o erro do forecast? |
| 04 Cash & Working Capital | Quanto caixa foi consumido por giro, capex e financiamento? |
| 05 Balance Sheet | Qual a posição patrimonial e a estrutura de dívida/liquidez? |
| 06 Scenario Planning | Qual combinação de margem, giro e financiamento é sustentável? |
| 07 Model Integrity | O modelo é conciliado e rastreável? |

A primeira página contém seis KPIs compactos, receita versus orçamento, margem mensal, caixa versus NCG e insights calculados conforme a seleção. A DRE aplica cores de favorabilidade conforme a natureza da linha. A página de cenários compara simultaneamente os três cenários de 2026. Filtros são locais por página: não se sincronizam combinações históricas e futuras incompatíveis. Gráficos financeiros não afetam as demais leituras ao serem selecionados; rankings comerciais filtram outros gráficos comerciais.

No modo de edição, navegação de botões pode exigir Ctrl+clique. O botão Limpar filtros limpa os slicers da página, não restaura uma combinação específica de ano/cenário. Com cenário sem seleção, a leitura financeira usa Realizado; com ano sem seleção, exibe o período disponível. A página Cenários tem ano e cenários protegidos para manter a comparação simultânea.

## Conteúdo

- `Nexa_FPA_Portfolio.pbip`: entrada do projeto.
- `Nexa_FPA_Portfolio.Report/`: relatório PBIR com visuais nativos editáveis e recursos visuais.
- `Nexa_FPA_Portfolio.SemanticModel/`: modelo TMDL com relacionamentos, partições M e medidas.
- `theme_Nexa.json`: tema importável separadamente.
- `data/`: Excel preservado e CSVs de apoio ao QA; CSVs não são fontes do relatório.
- `PowerQuery/`: cópias legíveis das consultas M; a versão ativa está no TMDL.
- `docs/`: modelo, medidas, QA, manifests e evidências de validação.
- `scripts/`: configuração de fonte, QA independente e consultas para o Desktop.
- `previews/`: sete PNGs com valores do Excel e identidade visual do relatório.
- `Nexa_FPA_Portfolio_Previas.pdf`: prévias reunidas para inspeção.

Os PNGs/PDF são **prévias de referência renderizadas em Python**, não capturas do Power BI. Tamanho de fontes, organização de matrizes e geometria de gráficos podem variar na renderização do Desktop. Os fundos de marca são imagens e os valores, filtros e gráficos do relatório são visuais nativos.

## Convenções importantes

Financeiro mensal por cenário; detalhes comerciais apenas do realizado. DRE/DFC somam fluxos, BP/caixa/dívida/NCG usam posição final. NCG deduz todos os passivos operacionais definidos no Excel. `FCF` é financiamento e `FC_Livre` é fluxo de caixa livre. Ponte preço/volume usa receita bruta. Margens são razões de totais. Diário e conciliações contábeis cobrem o histórico realizado.

Após modificar premissas no Excel, recalcule e salve a fonte antes do refresh. O Power Query consome os resultados armazenados, sem recalcular fórmulas. O histórico/diário é snapshot e precisa ser regenerado coerentemente se for alterado.

## Validação

Foram aprovadas 4.522 verificações independentes, com tolerância de R$ 0,01 e maior resíduo de R$ 0.000000004191. A validação estrutural não substitui os passos de abertura, refresh e conferência no Desktop indicados acima.
