# Crea un cerebro nuevo para una persona a partir de esta plantilla. Se corre en la PC de Antetodo.
#
# Ejemplo:
#   powershell -ExecutionPolicy Bypass -File "_antetodo\crear-cerebro.ps1" `
#     -Nombre "Ana Lopez Ruiz" -Trato "Ana" -Negocio "Lopez Abogados" -Profesion "abogada" `
#     -Prefijo "al" -Carpeta "lopez-cerebro" -Correo "ana@ejemplo.com" `
#     -Repo "https://github.com/SU-USUARIO/cerebro.git"
#
# -Repo se puede dejar vacio y ponerlo despues (queda como POR-DEFINIR en EMPIEZA-AQUI.md).
# Los acentos en -Nombre/-Negocio se respetan en los .md; en los instaladores se usa la version sin acentos.
param(
  [Parameter(Mandatory=$true)][string]$Nombre,
  [Parameter(Mandatory=$true)][string]$Trato,
  [Parameter(Mandatory=$true)][string]$Negocio,
  [Parameter(Mandatory=$true)][ValidateSet("abogada","doctora","abogado","doctor","otra")][string]$Profesion,
  [Parameter(Mandatory=$true)][ValidatePattern('^[a-z]{2,5}$')][string]$Prefijo,
  [Parameter(Mandatory=$true)][ValidatePattern('^[a-z0-9-]{3,40}$')][string]$Carpeta,
  [Parameter(Mandatory=$true)][string]$Correo,
  [string]$Repo = "POR-DEFINIR",
  [string]$Destino = ""
)
$ErrorActionPreference = "Stop"
$plantilla = Split-Path -Parent $PSScriptRoot
if (-not $Destino) { $Destino = Join-Path (Split-Path -Parent $plantilla) $Carpeta }
if (Test-Path $Destino) { Write-Host "Ya existe $Destino. No se toca. Elige otra -Carpeta o -Destino."; exit 1 }

function SinAcentos([string]$s) {
  $n = $s.Normalize([Text.NormalizationForm]::FormD)
  $sb = New-Object Text.StringBuilder
  foreach ($ch in $n.ToCharArray()) {
    if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch) -ne [Globalization.UnicodeCategory]::NonSpacingMark) { [void]$sb.Append($ch) }
  }
  return $sb.ToString()
}

# 1. Copiar (sin la carpeta interna de Antetodo ni .git)
New-Item -ItemType Directory -Force $Destino | Out-Null
robocopy $plantilla $Destino /E /XD "_antetodo" ".git" "__pycache__" /NFL /NDL /NJH /NJS /NP | Out-Null
if ($LASTEXITCODE -ge 8) { Write-Host "Fallo la copia (robocopy $LASTEXITCODE)."; exit 1 }

# 2. Renombrar las carpetas de skills
Get-ChildItem (Join-Path $Destino ".claude\skills") -Directory | Where-Object { $_.Name -like "__PREFIJO__-*" } | ForEach-Object {
  Rename-Item $_.FullName ($_.Name -replace '^__PREFIJO__', $Prefijo)
}

# 3. Reemplazar los datos en los archivos de texto (UTF-8 sin BOM)
$utf8 = New-Object Text.UTF8Encoding($false)
$mapa = [ordered]@{
  "__NOMBRE_ASCII__" = (SinAcentos $Nombre)
  "__NOMBRE__"       = $Nombre
  "__TRATO__"        = $Trato
  "__NEGOCIO__"      = $Negocio
  "__PROFESION__"    = $Profesion
  "__PREFIJO__"      = $Prefijo
  "__CARPETA__"      = $Carpeta
  "__CORREO__"       = $Correo
  "__REPO__"         = $Repo
  "__FECHA__"        = (Get-Date -Format "yyyy-MM-dd")
}
Get-ChildItem $Destino -Recurse -File -Force | Where-Object { $_.Extension -in ".md",".json",".ps1",".sh",".html",".css" } | ForEach-Object {
  $t = [IO.File]::ReadAllText($_.FullName, $utf8); $o = $t
  foreach ($k in $mapa.Keys) { $t = $t.Replace($k, [string]$mapa[$k]) }
  if ($t -ne $o) { [IO.File]::WriteAllText($_.FullName, $t, $utf8) }
}

# 4. Carpetas vacias que Git no guarda
foreach ($d in @("bandeja","procesos","entregables")) {
  $p = Join-Path $Destino $d; New-Item -ItemType Directory -Force $p | Out-Null
  $k = Join-Path $p ".gitkeep"; if (-not (Test-Path $k)) { [IO.File]::WriteAllText($k, "", $utf8) }
}
New-Item -ItemType Directory -Force (Join-Path $Destino "privado") | Out-Null

# 5. Revisar que no quedo ningun dato sin llenar
$faltan = Get-ChildItem $Destino -Recurse -File -Force | Where-Object { $_.Extension -in ".md",".json",".ps1",".sh",".html",".css" } | Select-String -Pattern '__[A-Z_]+__' -List
if ($faltan) { Write-Host "OJO: quedaron datos sin llenar en:" -ForegroundColor Yellow; $faltan | ForEach-Object { Write-Host "   $($_.Path)" } }

# 6. Repositorio local con su primer commit
git -C $Destino init -q -b main
git -C $Destino add -A
git -C $Destino commit -q -m "Antetodo: cerebro inicial de $(SinAcentos $Trato)"
if ($Repo -ne "POR-DEFINIR") { git -C $Destino remote add origin $Repo }

Write-Host ""
Write-Host "LISTO: $Destino" -ForegroundColor Green
Write-Host "Sigue en _antetodo\GUIA-SESION.md, paso 3 (subirlo a SU repositorio de GitHub)."
