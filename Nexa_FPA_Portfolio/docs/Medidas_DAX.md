# Medidas DAX — NEXA

225 medidas explícitas em `_Medidas`. Valores financeiros permanecem numéricos; FORMAT é usado nos textos executivos. Cards monetários possuem format strings dinâmicas.

## Cenário Efetivo

Cenário único; sem seleção usa Realizado. Múltiplos cenários devem ser apresentados em colunas da matriz.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
SELECTEDVALUE(dCenario[Cenario], "Realizado")
```

## Seleção de Cenário Válida

Seleção de Cenário Válida. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `#,0`

```dax
IF(NOT ISFILTERED(dCenario[Cenario]) || HASONEVALUE(dCenario[Cenario]), 1, 0)
```

## Meses Disponíveis

Meses Disponíveis. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `#,0`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(DISTINCTCOUNT(fFinanceiro[Data]), KEEPFILTERS(dCenario[Cenario] = C))
```

## Último Mês

Último Mês. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `mmm yyyy`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(MAX(fFinanceiro[Data]), KEEPFILTERS(dCenario[Cenario] = C))
```

## Primeiro Mês

Primeiro Mês. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `mmm yyyy`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(MIN(fFinanceiro[Data]), KEEPFILTERS(dCenario[Cenario] = C))
```

## Receita Bruta

Receita Bruta. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[ReceitaBruta]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Deduções

Deduções. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Deducoes]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Receita Líquida

Receita Líquida. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[ReceitaLiquida]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## CMV

CMV. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[CMV]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Lucro Bruto

Lucro Bruto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[LucroBruto]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Pessoal

Pessoal. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Pessoal]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Comercial

Comercial. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Comercial]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Administrativo

Administrativo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Administrativo]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Tecnologia

Tecnologia. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Tecnologia]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Logística

Logística. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Logistica]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Opex

Opex. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Opex]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## EBITDA

EBITDA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[EBITDA]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Depreciação

Depreciação. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Depreciacao]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## EBIT

EBIT. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[EBIT]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Juros

Juros. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Juros]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## LAIR

LAIR. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[LAIR]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## IR Simulado

IR Simulado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[IRSimulado]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Lucro Líquido

Lucro Líquido. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[LucroLiquido]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## FCO

FCO. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[FCO_Indireto]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## FCO Direto

FCO Direto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[FCO_Direto]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## FCI

FCI. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[FCI]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## FCF

Fluxo de financiamento: captação menos amortização e dividendos. Não representa FCL.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[FCF]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Fluxo de Caixa Livre

Fluxo de Caixa Livre. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[FC_Livre]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Capex

Capex. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Capex]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Captação

Captação. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Captacao]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Amortização

Amortização. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Amortizacao]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Dividendos

Dividendos. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[Dividendos]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Variação de Caixa

Variação de Caixa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN IF([Seleção de Cenário Válida] = 1, CALCULATE(SUM(fFinanceiro[VariacaoCaixa]), KEEPFILTERS(dCenario[Cenario] = C)))
```

## Caixa Final

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[CaixaFinal]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Clientes

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Clientes]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Estoque

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Estoque]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Fornecedores

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Fornecedores]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Salários a Pagar

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[SalariosPagar]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Tributos sobre Venda a Pagar

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[TributosVendaPagar]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## IR a Pagar

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[IRPagar]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## NCG

Clientes + estoque − fornecedores − salários − tributos sobre vendas − IR a pagar, no último mês.

Pasta: `07 | Capital de Giro`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[NCG]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## DSO

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DSO]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## DIO

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DIO]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## DPO

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `07 | Capital de Giro`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DPO]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Ativo

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Ativo]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Passivo

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Passivo]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Patrimônio Líquido

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[PL]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Ativo Circulante

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[AtivoCirculante]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Ativo Não Circulante

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[AtivoNaoCirculante]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Imobilizado Bruto

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[ImobilizadoBruto]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Depreciação Acumulada

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DepAcumulada]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Passivo Circulante

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[PassivoCirculante]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Passivo Não Circulante

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[PassivoNaoCirculante]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Capital

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Capital]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Lucros Acumulados

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[LucrosAcumulados]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Dívida

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `09 | Dívida`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[Divida]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Dívida CP

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `09 | Dívida`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DividaCP]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Dívida LP

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `09 | Dívida`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DividaLP]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Dívida Líquida

Posição do último mês disponível por cenário; nunca soma saldos mensais.

Pasta: `09 | Dívida`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[DividaLiquida]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Caixa Inicial

Caixa Inicial. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Primeiro Mês]
RETURN IF([Seleção de Cenário Válida] = 1 && NOT ISBLANK(M), CALCULATE(SUM(fFinanceiro[CaixaInicial]), KEEPFILTERS(dCenario[Cenario] = C), KEEPFILTERS(dCalendario[Data] = M)))
```

## Margem EBITDA

Margem EBITDA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `02 | Margens`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([EBITDA], [Receita Líquida])
```

## Margem Líquida

Margem Líquida. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `02 | Margens`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Lucro Líquido], [Receita Líquida])
```

## Margem Bruta

Margem Bruta. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `02 | Margens`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Lucro Bruto], [Receita Líquida])
```

## Ciclo de Caixa

Ciclo de Caixa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `07 | Capital de Giro`  
Formato: `0" dias"`

```dax
[DSO] + [DIO] - [DPO]
```

## Liquidez Corrente

Liquidez Corrente. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `08 | Balanço`  
Formato: `0.00"x"`

```dax
DIVIDE([Ativo Circulante], [Passivo Circulante])
```

## Cobertura de Juros

Cobertura de Juros. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `09 | Dívida`  
Formato: `0.00"x"`

```dax
DIVIDE([EBIT], [Juros])
```

## Dívida / EBITDA LTM

Dívida final / EBITDA dos últimos 12 meses do mesmo cenário. Vazio se histórico do cenário for incompleto ou EBITDA não positivo.

Pasta: `09 | Dívida`  
Formato: `0.00"x"`

```dax
VAR M = [Último Mês]
VAR C = [Cenário Efetivo]
VAR Janela = DATESINPERIOD(dCalendario[Data], EOMONTH(M,0), -12, MONTH)
VAR N = CALCULATE(DISTINCTCOUNT(fFinanceiro[Data]), REMOVEFILTERS(dCalendario), Janela, KEEPFILTERS(dCenario[Cenario] = C))
VAR E = CALCULATE([EBITDA], REMOVEFILTERS(dCalendario), Janela)
RETURN IF(N = 12 && E > 0, DIVIDE([Dívida], E))
```

## Realizado

Receita líquida com cenário forçado; ignora slicer conflitante de cenário.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Orçamento

Receita líquida com cenário forçado; ignora slicer conflitante de cenário.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Forecast 6+6

Receita líquida com cenário forçado; ignora slicer conflitante de cenário.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Receita Líquida | Realizado

Receita Líquida | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Receita Líquida | Orçamento

Receita Líquida | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Receita Líquida | Forecast

Receita Líquida | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## EBITDA | Realizado

EBITDA | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## EBITDA | Orçamento

EBITDA | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## EBITDA | Forecast

EBITDA | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Lucro Líquido | Realizado

Lucro Líquido | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Lucro Líquido | Orçamento

Lucro Líquido | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Lucro Líquido | Forecast

Lucro Líquido | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Fluxo de Caixa Livre | Realizado

Fluxo de Caixa Livre | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Fluxo de Caixa Livre | Orçamento

Fluxo de Caixa Livre | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Fluxo de Caixa Livre | Forecast

Fluxo de Caixa Livre | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Caixa Final | Realizado

Caixa Final | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Caixa Final | Orçamento

Caixa Final | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Caixa Final | Forecast

Caixa Final | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## NCG | Realizado

NCG | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## NCG | Orçamento

NCG | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## NCG | Forecast

NCG | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Margem EBITDA | Realizado

Margem EBITDA | Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## Margem EBITDA | Orçamento

Margem EBITDA | Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## Margem EBITDA | Forecast

Margem EBITDA | Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## Desvio Real x Orçado R$

Desvio Real x Orçado R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([Realizado]) && NOT ISBLANK([Orçamento]), [Realizado] - [Orçamento])
```

## Desvio Real x Orçado %

Desvio Real x Orçado %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Desvio Real x Orçado R$], ABS([Orçamento]))
```

## Forecast x Orçamento

Forecast x Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([Forecast 6+6]) && NOT ISBLANK([Orçamento]), [Forecast 6+6] - [Orçamento])
```

## Realizado x Forecast

Realizado x Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([Realizado]) && NOT ISBLANK([Forecast 6+6]), [Realizado] - [Forecast 6+6])
```

## Erro Forecast R$

Erro Forecast R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Realizado x Forecast]
```

## Erro Forecast %

Erro Forecast %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Erro Forecast R$], ABS([Forecast 6+6]))
```

## Receita LY

Receita LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([Receita Líquida], DATEADD(dCalendario[Data], -1, YEAR)))
```

## Receita YoY R$

Receita YoY R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([Receita LY]), [Receita Líquida] - [Receita LY])
```

## Receita YoY %

Receita YoY %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Receita YoY R$], ABS([Receita LY]))
```

## Receita Mês Anterior

Receita Mês Anterior. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], DATEADD(dCalendario[Data], -1, MONTH))
```

## Receita MoM R$

Receita MoM R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[AnoMes]) && NOT ISBLANK([Receita Mês Anterior]), [Receita Líquida] - [Receita Mês Anterior])
```

## Receita MoM %

Receita MoM %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `01 | Receita`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Receita MoM R$], ABS([Receita Mês Anterior]))
```

## EBITDA LY

EBITDA LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([EBITDA], DATEADD(dCalendario[Data], -1, YEAR)))
```

## EBITDA YoY R$

EBITDA YoY R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([EBITDA LY]), [EBITDA] - [EBITDA LY])
```

## EBITDA YoY %

EBITDA YoY %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([EBITDA YoY R$], ABS([EBITDA LY]))
```

## EBITDA Mês Anterior

EBITDA Mês Anterior. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], DATEADD(dCalendario[Data], -1, MONTH))
```

## EBITDA MoM R$

EBITDA MoM R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[AnoMes]) && NOT ISBLANK([EBITDA Mês Anterior]), [EBITDA] - [EBITDA Mês Anterior])
```

## EBITDA MoM %

EBITDA MoM %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([EBITDA MoM R$], ABS([EBITDA Mês Anterior]))
```

## Receita LY Referência

Para cenários futuros e forecast, ano anterior realizado; demais cenários comparam sua própria trilha.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR Ref = IF(C IN {"Forecast 6+6", "Base 2026", "Otimista 2026", "Adverso 2026"}, "Realizado", C)
RETURN IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = Ref, DATEADD(dCalendario[Data], -1, YEAR)))
```

## Receita YoY Referência %

Receita YoY Referência %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
VAR LY = [Receita LY Referência]
RETURN IF(NOT ISBLANK(LY), DIVIDE([Receita Líquida]-LY, ABS(LY)))
```

## Caixa Final LY

Caixa Final LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([Caixa Final], DATEADD(dCalendario[Data], -1, YEAR)))
```

## NCG LY

NCG LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([NCG], DATEADD(dCalendario[Data], -1, YEAR)))
```

## Margem EBITDA LY

Margem EBITDA LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([Margem EBITDA], DATEADD(dCalendario[Data], -1, YEAR)))
```

## Caixa YoY %

Caixa YoY %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
VAR LY = [Caixa Final LY]
RETURN IF(NOT ISBLANK(LY), DIVIDE([Caixa Final] - LY, ABS(LY)))
```

## Margem EBITDA YoY pp

Margem EBITDA YoY pp. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `02 | Margens`  
Formato: `0.00" pp";[Red](0.00" pp")`

```dax
IF(NOT ISBLANK([Margem EBITDA LY]), ([Margem EBITDA] - [Margem EBITDA LY]) * 100)
```

## Base 2026

Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## EBITDA | Base 2026

EBITDA | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Margem EBITDA | Base 2026

Margem EBITDA | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Lucro Líquido | Base 2026

Lucro Líquido | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Caixa Final | Base 2026

Caixa Final | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Fluxo de Caixa Livre | Base 2026

Fluxo de Caixa Livre | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## NCG | Base 2026

NCG | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Dívida Líquida | Base 2026

Dívida Líquida | Base 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Dívida Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Base 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Otimista 2026

Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## EBITDA | Otimista 2026

EBITDA | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Margem EBITDA | Otimista 2026

Margem EBITDA | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Lucro Líquido | Otimista 2026

Lucro Líquido | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Caixa Final | Otimista 2026

Caixa Final | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Fluxo de Caixa Livre | Otimista 2026

Fluxo de Caixa Livre | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## NCG | Otimista 2026

NCG | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Dívida Líquida | Otimista 2026

Dívida Líquida | Otimista 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Dívida Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Otimista 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Adverso 2026

Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Receita Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## EBITDA | Adverso 2026

EBITDA | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Margem EBITDA | Adverso 2026

Margem EBITDA | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
CALCULATE([Margem EBITDA], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Lucro Líquido | Adverso 2026

Lucro Líquido | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Lucro Líquido], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Caixa Final | Adverso 2026

Caixa Final | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Caixa Final], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Fluxo de Caixa Livre | Adverso 2026

Fluxo de Caixa Livre | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Fluxo de Caixa Livre], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## NCG | Adverso 2026

NCG | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([NCG], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Dívida Líquida | Adverso 2026

Dívida Líquida | Adverso 2026. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([Dívida Líquida], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano] = 2026)
```

## Receita Comercial

Receita Comercial. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fVendas[ReceitaBruta])
```

## Quantidade

Quantidade. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `#,0`

```dax
SUM(fVendas[Quantidade])
```

## CMV Comercial

CMV Comercial. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fVendas[CMV])
```

## Preço Médio

Preço Médio. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
DIVIDE([Receita Comercial], [Quantidade])
```

## Lucro Bruto Comercial

Margem comercial antes das deduções de receita; não é o lucro bruto financeiro.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Receita Comercial] - [CMV Comercial]
```

## Margem Bruta Comercial

Margem Bruta Comercial. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([Lucro Bruto Comercial], [Receita Comercial])
```

## Receita Comercial LY

Receita Comercial LY. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(HASONEVALUE(dCalendario[Ano]), CALCULATE([Receita Comercial], DATEADD(dCalendario[Data], -1, YEAR)))
```

## Receita Comercial YoY %

Receita Comercial YoY %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
VAR LY = [Receita Comercial LY]
RETURN IF(NOT ISBLANK(LY), DIVIDE([Receita Comercial]-LY, ABS(LY)))
```

## Receita Ponte 2024

Receita Ponte 2024. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fPontePrecoVolume[Receita2024])
```

## Receita Ponte 2025

Receita Ponte 2025. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fPontePrecoVolume[Receita2025])
```

## Efeito Volume

Efeito Volume. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fPontePrecoVolume[EfeitoVolume])
```

## Efeito Preço

Efeito Preço. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fPontePrecoVolume[EfeitoPreco])
```

## Ponte Preço Volume

Ponte Preço Volume. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `10 | Comercial`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SWITCH(SELECTEDVALUE(aPontePV[Etapa]), "Receita 2024", [Receita Ponte 2024], "Efeito Volume", [Efeito Volume], "Efeito Preço", [Efeito Preço])
```

## DRE Valor

DRE Valor. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SWITCH(SELECTEDVALUE(aDRE[Campo]),
    "ReceitaBruta", [Receita Bruta],
    "Deducoes", [Deduções],
    "ReceitaLiquida", [Receita Líquida],
    "CMV", [CMV],
    "LucroBruto", [Lucro Bruto],
    "Pessoal", [Pessoal],
    "Comercial", [Comercial],
    "Administrativo", [Administrativo],
    "Tecnologia", [Tecnologia],
    "Logistica", [Logística],
    "Opex", [Opex],
    "EBITDA", [EBITDA],
    "Depreciacao", [Depreciação],
    "EBIT", [EBIT],
    "Juros", [Juros],
    "LAIR", [LAIR],
    "IRSimulado", [IR Simulado],
    "LucroLiquido", [Lucro Líquido],
    "FC_Livre", [Fluxo de Caixa Livre]
)
```

## DRE Realizado

DRE Realizado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([DRE Valor], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Realizado")
```

## DRE Orçamento

DRE Orçamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([DRE Valor], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Orçamento")
```

## DRE Forecast

DRE Forecast. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([DRE Valor], REMOVEFILTERS(dCenario), dCenario[Cenario] = "Forecast 6+6")
```

## DRE Desvio R$

DRE Desvio R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([DRE Realizado]) && NOT ISBLANK([DRE Orçamento]), [DRE Realizado] - [DRE Orçamento])
```

## DRE Desvio %

DRE Desvio %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([DRE Desvio R$], ABS([DRE Orçamento]))
```

## Favorabilidade

Custos menores são favoráveis; receita, resultado e FCL maiores são favoráveis.

Pasta: `04 | Orçamento`  
Formato: `#,0`

```dax
VAR D = [DRE Desvio R$]
VAR S = SELECTEDVALUE(aDRE[Favoravel])
RETURN IF(NOT ISBLANK(D) && NOT ISBLANK(S), SIGN(D * S))
```

## Cor Favorabilidade

Cor Favorabilidade. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `None`

```dax
SWITCH([Favorabilidade], 1, "#1A9A6C", -1, "#D95C5C", "#718096")
```

## Cor Linha DRE

Cor Linha DRE. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `03 | Resultado`  
Formato: `None`

```dax
IF(SELECTEDVALUE(aDRE[Subtotal],0)=1, "#E7EFF5", "#FFFFFF")
```

## DRE Erro Forecast R$

DRE Erro Forecast R$. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
IF(NOT ISBLANK([DRE Forecast]), [DRE Realizado] - [DRE Forecast])
```

## DRE Erro Forecast %

DRE Erro Forecast %. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `05 | Forecast`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
DIVIDE([DRE Erro Forecast R$], ABS([DRE Forecast]))
```

## Erro Forecast H2 R$

Erro Realizado menos Forecast somente nos meses prospectivos julho–dezembro.

Pasta: `05 | Forecast`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE([DRE Erro Forecast R$], KEEPFILTERS(dCalendario[MesNumero] >= 7))
```

## BP Valor

BP Valor. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `08 | Balanço`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SWITCH(SELECTEDVALUE(aBP[Campo]),
    "CaixaFinal", [Caixa Final],
    "Clientes", [Clientes],
    "Estoque", [Estoque],
    "AtivoCirculante", [Ativo Circulante],
    "ImobilizadoBruto", [Imobilizado Bruto],
    "DepAcumulada", [Depreciação Acumulada],
    "AtivoNaoCirculante", [Ativo Não Circulante],
    "Ativo", [Ativo],
    "Fornecedores", [Fornecedores],
    "SalariosPagar", [Salários a Pagar],
    "TributosVendaPagar", [Tributos sobre Venda a Pagar],
    "IRPagar", [IR a Pagar],
    "DividaCP", [Dívida CP],
    "PassivoCirculante", [Passivo Circulante],
    "DividaLP", [Dívida LP],
    "PassivoNaoCirculante", [Passivo Não Circulante],
    "Passivo", [Passivo],
    "Capital", [Capital],
    "LucrosAcumulados", [Lucros Acumulados],
    "PL", [Patrimônio Líquido]
)
```

## Ponte Variância EBITDA

Ponte Variância EBITDA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `04 | Orçamento`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR E = SELECTEDVALUE(aVariancia[Etapa])
VAR CMVO = CALCULATE([CMV], REMOVEFILTERS(dCenario), dCenario[Cenario]="Orçamento")
VAR CMVR = CALCULATE([CMV], REMOVEFILTERS(dCenario), dCenario[Cenario]="Realizado")
VAR OO = CALCULATE([Opex], REMOVEFILTERS(dCenario), dCenario[Cenario]="Orçamento")
VAR ORR = CALCULATE([Opex], REMOVEFILTERS(dCenario), dCenario[Cenario]="Realizado")
RETURN IF(NOT ISBLANK([Orçamento]) && NOT ISBLANK([Realizado]), SWITCH(E, "EBITDA Orçado", [EBITDA | Orçamento], "Receita Líquida", [Desvio Real x Orçado R$], "CMV", CMVO-CMVR, "Opex", OO-ORR))
```

## Ponte Caixa

Ponte Caixa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
VAR Linhas = CALCULATETABLE(fFinanceiro, KEEPFILTERS(dCenario[Cenario] = C))
VAR ClientesFluxo = SUMX(Linhas, fFinanceiro[Recebimentos] - fFinanceiro[ReceitaBruta])
VAR EstoqueFluxo = SUMX(Linhas, fFinanceiro[CMV] - fFinanceiro[Compras])
VAR FornecedorFluxo = SUMX(Linhas, fFinanceiro[Compras] - fFinanceiro[PagFornecedores])
VAR Outros = [FCO] - [Lucro Líquido] - [Depreciação] - ClientesFluxo - EstoqueFluxo - FornecedorFluxo
RETURN IF([Seleção de Cenário Válida]=1, SWITCH(SELECTEDVALUE(aPonteCaixa[Etapa]),
    "Lucro Líquido", [Lucro Líquido], "Depreciação", [Depreciação],
    "Clientes", ClientesFluxo, "Estoque", EstoqueFluxo, "Fornecedores", FornecedorFluxo,
    "Outros Passivos Operacionais", Outros, "Capex", -[Capex], "Financiamento", [FCF]))
```

## Quantidade Planejada

Quantidade Planejada. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `#,0`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(SUM(fPremissas[Quantidade]), KEEPFILTERS(dCenario[Cenario]=C))
```

## Ticket Médio Planejado

Ticket Médio Planejado. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(DIVIDE(SUMX(fPremissas,fPremissas[Quantidade]*fPremissas[TicketMedio]),SUM(fPremissas[Quantidade])), KEEPFILTERS(dCenario[Cenario]=C))
```

## CMV % Premissa

CMV % Premissa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0.0%;[Red](0.0%);0.0%`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN CALCULATE(MAX(fPremissas[CMVPercentual]), KEEPFILTERS(dCenario[Cenario]=C), KEEPFILTERS(dCalendario[Data]=M))
```

## DSO Premissa

DSO Premissa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN CALCULATE(MAX(fPremissas[DSO]), KEEPFILTERS(dCenario[Cenario]=C), KEEPFILTERS(dCalendario[Data]=M))
```

## DIO Premissa

DIO Premissa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN CALCULATE(MAX(fPremissas[DIO]), KEEPFILTERS(dCenario[Cenario]=C), KEEPFILTERS(dCalendario[Data]=M))
```

## DPO Premissa

DPO Premissa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `0" dias"`

```dax
VAR C = [Cenário Efetivo]
VAR M = [Último Mês]
RETURN CALCULATE(MAX(fPremissas[DPO]), KEEPFILTERS(dCenario[Cenario]=C), KEEPFILTERS(dCalendario[Data]=M))
```

## Check BP Máximo

Check BP Máximo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(MAXX(fChecks, ABS(fChecks[CheckBP])), KEEPFILTERS(dCenario[Cenario]=C))
```

## Check DFC Máximo

Check DFC Máximo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(MAXX(fChecks, ABS(fChecks[CheckDFC])), KEEPFILTERS(dCenario[Cenario]=C))
```

## Check Diário Máximo

Check Diário Máximo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
CALCULATE(MAXX(fConciliacao, ABS(fConciliacao[Diferenca])), REMOVEFILTERS(dCenario), dCenario[Cenario]="Realizado")
```

## Check Ponte Máximo

Check Ponte Máximo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
MAXX(fPontePrecoVolume, ABS(fPontePrecoVolume[Check]))
```

## Tolerância QA

Tolerância QA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
MAX(aConfig[Tolerancia])
```

## Débitos Diário

Débitos Diário. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fDiario[Debito])
```

## Créditos Diário

Créditos Diário. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
SUM(fDiario[Credito])
```

## Check Partidas por Lançamento

Check Partidas por Lançamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR L = SUMMARIZE(fDiario, fDiario[Lancamento])
RETURN MAXX(L, ABS(CALCULATE(SUM(fDiario[Debito])-SUM(fDiario[Credito]))))
```

## Inconsistências

Conta meses BP/DFC, contas patrimoniais, segmentos de ponte e lançamentos fora da tolerância; unidades podem representar a mesma causa.

Pasta: `13 | QA`  
Formato: `#,0`

```dax
VAR T = [Tolerância QA]
VAR C = [Cenário Efetivo]
VAR A = CALCULATE(COUNTROWS(FILTER(fChecks, ABS(fChecks[CheckBP]) >= T || ABS(fChecks[CheckDFC]) >= T)), KEEPFILTERS(dCenario[Cenario]=C))
VAR B = CALCULATE(COUNTROWS(FILTER(fConciliacao, ABS(fConciliacao[Diferenca]) >= T)), REMOVEFILTERS(dCenario), dCenario[Cenario]="Realizado")
VAR P = COUNTROWS(FILTER(fPontePrecoVolume, ABS(fPontePrecoVolume[Check]) >= T))
VAR L = SUMMARIZE(fDiario, fDiario[Lancamento])
VAR J = COUNTROWS(FILTER(L, ABS(CALCULATE(SUM(fDiario[Debito])-SUM(fDiario[Credito]))) >= T))
RETURN COALESCE(A,0)+COALESCE(B,0)+COALESCE(P,0)+COALESCE(J,0)
```

## Status do Modelo

Status do Modelo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `None`

```dax
IF(ISBLANK([Último Mês]), "SEM DADOS", IF([Inconsistências]=0, "MODELO CONCILIADO", "REVISAR MODELO"))
```

## Cor QA

Cor QA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `13 | QA`  
Formato: `None`

```dax
IF([Inconsistências]=0, "#1A9A6C", "#D95C5C")
```

## Caixa Mínimo

Caixa Mínimo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(MIN(fFinanceiro[CaixaFinal]), KEEPFILTERS(dCenario[Cenario]=C))
```

## Meses de Caixa Negativo

Meses de Caixa Negativo. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `06 | Caixa`  
Formato: `#,0`

```dax
VAR C = [Cenário Efetivo]
RETURN CALCULATE(COUNTROWS(FILTER(fFinanceiro,fFinanceiro[CaixaFinal]<0)), KEEPFILTERS(dCenario[Cenario]=C))
```

## Alerta de Financiamento

Alerta de Financiamento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `11 | Cenários`  
Formato: `None`

```dax
VAR N = [Meses de Caixa Negativo]
VAR F = [Captação]
VAR C = [Cenário Efetivo]
VAR M = [Caixa Mínimo]
VAR DataMin = MINX(FILTER(CALCULATETABLE(fFinanceiro, KEEPFILTERS(dCenario[Cenario]=C)), fFinanceiro[CaixaFinal]=M),fFinanceiro[Data])
RETURN SWITCH(TRUE(), ISBLANK(M), "Sem dados para esta seleção.", N>0, C & ": caixa negativo; mínimo de " & FORMAT(M,"R$ #,0","pt-BR") & " em " & FORMAT(DataMin,"mmm/yyyy","pt-BR") & ".", F>0, C & ": caixa positivo com captação prevista de " & FORMAT(F,"R$ #,0","pt-BR") & "; mínimo de " & FORMAT(M,"R$ #,0","pt-BR") & " em " & FORMAT(DataMin,"mmm/yyyy","pt-BR") & ".", "Caixa positivo sem novas captações; mínimo de " & FORMAT(M,"R$ #,0","pt-BR") & ".")
```

## Contexto da Seleção

Contexto da Seleção. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
VAR N = [Meses Disponíveis]
RETURN SWITCH(TRUE(), [Seleção de Cenário Válida]=0, "Selecione um cenário; use a página Cenários para comparação simultânea.", ISBLANK(N) || N=0, "Combinação de ano e cenário indisponível.", [Cenário Efetivo] & " | " & FORMAT(MIN(dCalendario[Ano]),"0") & IF(MIN(dCalendario[Ano])<>MAX(dCalendario[Ano]), "–" & FORMAT(MAX(dCalendario[Ano]),"0"), "") & " | " & FORMAT(N,"0") & " meses disponíveis")
```

## Insight Crescimento

Insight Crescimento. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
VAR Y = [Receita YoY Referência %]
VAR M = [Margem EBITDA]
RETURN IF(ISBLANK([Receita Líquida]), [Contexto da Seleção], IF(ISBLANK(Y), "Receita líquida de " & FORMAT([Receita Líquida],"R$ #,0","pt-BR") & "; margem EBITDA de " & FORMAT(M,"0.0%","pt-BR") & ".", "Receita " & IF(Y>=0,"cresce ","recua ") & FORMAT(ABS(Y),"0.0%","pt-BR") & " versus ano anterior de referência; margem EBITDA de " & FORMAT(M,"0.0%","pt-BR") & "."))
```

## Insight Giro

Insight Giro. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
VAR A = [NCG LY]
VAR D = [NCG]-A
RETURN IF(ISBLANK([NCG]), "Sem posição financeira disponível.", "NCG final de " & FORMAT([NCG],"R$ #,0","pt-BR") & IF(NOT ISBLANK(A), IF(D>=0,"; aumento de ","; redução de ") & FORMAT(ABS(D),"R$ #,0","pt-BR"),"") & "; ciclo de caixa de " & FORMAT([Ciclo de Caixa],"0","pt-BR") & " dias.")
```

## Insight Caixa

Insight Caixa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(ISBLANK([Fluxo de Caixa Livre]), "Sem dados de caixa disponíveis.", "FCL " & IF([Fluxo de Caixa Livre]<0,"negativo","positivo") & " de " & FORMAT([Fluxo de Caixa Livre],"R$ #,0","pt-BR") & "; caixa final de " & FORMAT([Caixa Final],"R$ #,0","pt-BR") & ".")
```

## KPI Receita Contexto

KPI Receita Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(NOT ISBLANK([Receita YoY Referência %]), FORMAT([Receita YoY Referência %],"+0.0%;-0.0%;0.0%","pt-BR") & " vs ano anterior", "Sem base anual comparável")
```

## KPI EBITDA Contexto

KPI EBITDA Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(NOT ISBLANK([EBITDA | Orçamento]), FORMAT(DIVIDE([EBITDA]-[EBITDA | Orçamento],ABS([EBITDA | Orçamento])),"+0.0%;-0.0%;0.0%","pt-BR") & " vs orçamento", "Resultado operacional")
```

## KPI Margem Contexto

KPI Margem Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(NOT ISBLANK([Margem EBITDA YoY pp]), FORMAT([Margem EBITDA YoY pp],"+0.00;-0.00;0.00","pt-BR") & " pp vs ano anterior", "EBITDA / receita líquida")
```

## KPI Caixa Contexto

KPI Caixa Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(NOT ISBLANK([Caixa YoY %]), FORMAT([Caixa YoY %],"+0.0%;-0.0%;0.0%","pt-BR") & " vs ano anterior", "Posição do último mês")
```

## KPI FCL Contexto

KPI FCL Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
IF(ISBLANK([Fluxo de Caixa Livre]), "Sem dados", IF([Fluxo de Caixa Livre]<0,"Consumo de caixa após capex","Geração de caixa após capex"))
```

## KPI NCG Contexto

KPI NCG Contexto. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
"Posição final • " & FORMAT([Ciclo de Caixa],"0","pt-BR") & " dias de ciclo"
```

## KPI Receita

KPI Receita. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Receita Líquida]
```

Formato dinâmico:

```dax
VAR V = ABS([Receita Líquida])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI EBITDA

KPI EBITDA. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[EBITDA]
```

Formato dinâmico:

```dax
VAR V = ABS([EBITDA])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI Caixa

KPI Caixa. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Caixa Final]
```

Formato dinâmico:

```dax
VAR V = ABS([Caixa Final])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI FCL

KPI FCL. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Fluxo de Caixa Livre]
```

Formato dinâmico:

```dax
VAR V = ABS([Fluxo de Caixa Livre])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI NCG

KPI NCG. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[NCG]
```

Formato dinâmico:

```dax
VAR V = ABS([NCG])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI Lucro

KPI Lucro. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Lucro Líquido]
```

Formato dinâmico:

```dax
VAR V = ABS([Lucro Líquido])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI Dívida

KPI Dívida. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Dívida]
```

Formato dinâmico:

```dax
VAR V = ABS([Dívida])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI Dívida Líquida

KPI Dívida Líquida. Respeita o período selecionado e as convenções financeiras do Excel.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00;[Red]("R$" #,0.00);"R$" 0.00`

```dax
[Dívida Líquida]
```

Formato dinâmico:

```dax
VAR V = ABS([Dívida Líquida])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## Contexto Cenários 2026

Medida de apresentação com contexto explícito.

Pasta: `11 | Cenários`  
Formato: `None`

```dax
"2026 • comparação simultânea | Adverso: captação de " & FORMAT([Captação Adverso 2026],"R$ #,0","pt-BR") & "; caixa mínimo de " & FORMAT(CALCULATE([Caixa Mínimo],REMOVEFILTERS(dCenario),dCenario[Cenario]="Adverso 2026",REMOVEFILTERS(dCalendario),dCalendario[Ano]=2026),"R$ #,0","pt-BR")
```

## Cor FCL

Medida de apresentação com contexto explícito.

Pasta: `06 | Caixa`  
Formato: `None`

```dax
IF(ISBLANK([Fluxo de Caixa Livre]), "#718096", IF([Fluxo de Caixa Livre]<0, "#D95C5C", "#1A9A6C"))
```

## Cor Dívida Líquida

Medida de apresentação com contexto explícito.

Pasta: `09 | Dívida`  
Formato: `None`

```dax
IF([Dívida Líquida]<0, "#12AFA3", "#16344B")
```

## Captação Adverso 2026

Medida de apresentação com contexto explícito.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0;[Red]("R$" #,0)`

```dax
CALCULATE([Captação], REMOVEFILTERS(dCenario), dCenario[Cenario]="Adverso 2026", REMOVEFILTERS(dCalendario), dCalendario[Ano]=2026)
```

## Título Receita

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
"Receita entregue vs plano | " & [Contexto da Seleção]
```

## Título Caixa

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `None`

```dax
"Caixa vs NCG | " & [Contexto da Seleção]
```

## KPI | Receita Comercial

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Receita Comercial]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Receita Comercial])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Preço Médio

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Preço Médio]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Preço Médio])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | CMV Comercial

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[CMV Comercial]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | CMV Comercial])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Captação

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Captação]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Captação])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Ativo

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Ativo]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Ativo])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Passivo

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Passivo]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Passivo])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Patrimônio Líquido

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Patrimônio Líquido]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Patrimônio Líquido])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Base 2026

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Base 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Base 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Otimista 2026

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Otimista 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Otimista 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Adverso 2026

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Adverso 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Adverso 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Fluxo de Caixa Livre | Base 2026

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Fluxo de Caixa Livre | Base 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Fluxo de Caixa Livre | Base 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Fluxo de Caixa Livre | Otimista 2026

Medida de apresentação com contexto explícito.

Pasta: `12 | Comparativos`  
Formato: `"R$" #,0.00`

```dax
[Fluxo de Caixa Livre | Otimista 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Fluxo de Caixa Livre | Otimista 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```

## KPI | Captação Adverso 2026

Medida de apresentação com contexto explícito.

Pasta: `11 | Cenários`  
Formato: `"R$" #,0.00`

```dax
[Captação Adverso 2026]
```

Formato dinâmico:

```dax
VAR V = ABS([KPI | Captação Adverso 2026])
RETURN SWITCH(TRUE(), V >= 1000000, """R$"" 0.00,,"" mi"";-""R$"" 0.00,,"" mi""", V >= 1000, """R$"" 0.0,"" mil"";-""R$"" 0.0,"" mil""", """R$"" 0.00;-""R$"" 0.00")
```
