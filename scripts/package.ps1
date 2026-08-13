$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$out = Join-Path $root 'winuxcmd-i18n-zh-cn.zip'
if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
Compress-Archive -Path (Join-Path $root 'catalogs\zh-CN') -DestinationPath $out
Write-Output $out
