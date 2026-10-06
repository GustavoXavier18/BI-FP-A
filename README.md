# NEXA FP&A — Portfólio Power BI

Projeto completo baseado no Excel Projeto_FPA_Nexa_Distribuicao.xlsx, com o PDF autoral como referência narrativa e visual.

## Baixar e abrir

1. Baixe [Nexa_FPA_Portfolio.zip](https://github.com/GustavoXavier18/BI-FP-A/raw/refs/heads/main/Nexa_FPA_Portfolio.zip) e extraia a pasta.
2. Execute `scripts/Configurar_Fonte.cmd` dentro da pasta extraída.
3. Abra `Nexa_FPA_Portfolio.pbip` no Power BI Desktop atualizado e clique em **Atualizar**.
4. Valide o cenário Realizado / 2025: receita líquida R$ 15.545.584,11 e EBITDA R$ 944.009,95.

O projeto inclui sete páginas, três tooltips, 225 medidas DAX, consultas Power Query, tema, Excel, documentação, QA e prévias PNG/PDF. O Excel original foi preservado.

## Validação e limites

4.522 reconciliações financeiras passaram, além das verificações de schemas, referências, sintaxe M e desserialização TMDL. A atualização, a execução DAX/M e a renderização no Power BI Desktop ainda precisam ser verificadas no Windows. Não foi gerado PBIX. As prévias foram renderizadas separadamente, não capturadas do Desktop.

Veja a documentação completa em [Nexa_FPA_Portfolio/README.md](Nexa_FPA_Portfolio/README.md).

SHA256 do ZIP: `767c32c4175f1a080cc65d814cba3b7c268c1e3085660e4b5c2929738f86da14`.

## Correção de abertura

O pacote atual remove o conflito entre FormatString e FormatStringDefinition nas oito medidas KPI afetadas. Baixe novamente o ZIP e extraia em uma nova pasta antes de abrir.
