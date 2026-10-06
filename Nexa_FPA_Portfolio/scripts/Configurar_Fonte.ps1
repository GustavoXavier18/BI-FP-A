param([string]$ArquivoExcel)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
if (-not $ArquivoExcel) { $ArquivoExcel = Join-Path $projectRoot 'data\Projeto_FPA_Nexa_Distribuicao.xlsx' }
$resolvedExcel = (Resolve-Path -LiteralPath $ArquivoExcel).Path
$modelFile = Join-Path $projectRoot 'Nexa_FPA_Portfolio.SemanticModel\definition\expressions.tmdl'
$content = [System.IO.File]::ReadAllText($modelFile)
$escapedExcel = $resolvedExcel.Replace('"','""')
$replacement = 'expression ''pArquivoExcel'' = "' + $escapedExcel + '" meta [IsParameterQuery=true, Type="Text", IsParameterQueryRequired=true]'
$pattern = '(?ms)^expression ''pArquivoExcel'' =\s*\r?\n\t\t[^\r\n]+'
if (-not [regex]::IsMatch($content,$pattern)) { $pattern = '(?m)^expression ''pArquivoExcel'' = [^\r\n]+' }
if (-not [regex]::IsMatch($content,$pattern)) { throw 'Parâmetro pArquivoExcel não encontrado. Ajuste pelo Power Query no Desktop.' }
$updated = [regex]::Replace($content,$pattern,[System.Text.RegularExpressions.MatchEvaluator]{param($m) $replacement},1)
[System.IO.File]::WriteAllText($modelFile,$updated,[System.Text.UTF8Encoding]::new($false))
Write-Host "Fonte configurada: $resolvedExcel"
Write-Host 'Abra Nexa_FPA_Portfolio.pbip e clique em Atualizar. O Excel não foi modificado.'
