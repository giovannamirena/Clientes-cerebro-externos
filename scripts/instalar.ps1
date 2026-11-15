# Instala / repara este cerebro en una PC con Windows. Se puede correr las veces que quieras.
#
# Antes:
#   1. Instalar la app de Claude (claude.ai/download) y entrar con la cuenta de la duena del cerebro.
#   2. Haber clonado este repositorio (ver EMPIEZA-AQUI.md).
#
# Uso (PowerShell normal, no administrador):
#   powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\__CARPETA__\scripts\instalar.ps1"
$ErrorActionPreference = "Stop"
function Paso($t) { Write-Host ""; Write-Host "== $t" -ForegroundColor Cyan }
function Ok($t)   { Write-Host "   OK  $t" -ForegroundColor Green }
function Ojo($t)  { Write-Host "   !!  $t" -ForegroundColor Yellow }
function Tiene($cmd) {
  $c = Get-Command $cmd -ErrorAction SilentlyContinue | Select-Object -First 1
  if (-not $c) { return $false }
  if ($c.Source -notlike "*\WindowsApps\*") { return $true }
  $eap = $ErrorActionPreference; $ErrorActionPreference = "Continue"   # el python falso de la Microsoft Store
  try { $o = "$(& $c.Source --version 2>&1)"; return ($LASTEXITCODE -eq 0 -and $o -match '\d+\.\d+') } catch { return $false } finally { $ErrorActionPreference = $eap }
}

$cerebro = Split-Path -Parent $PSScriptRoot

Paso "1. Herramientas (Git, Python, Chrome/Edge)"
foreach ($f in @(@{c="git"; n="Git"; id="Git.Git"}, @{c="python"; n="Python"; id="Python.Python.3.12"})) {
  if (-not (Tiene $f.c)) {
    Ojo "Falta $($f.n). Instalando..."
    winget install --id $f.id -e --accept-source-agreements --accept-package-agreements --silent
  }
}
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")
if (-not (Tiene git)) { Write-Host "Git no quedo instalado. Cierra PowerShell, abrelo de nuevo y vuelve a correr esto."; exit 1 }
Ok (git --version)
if (Tiene python) { Ok (python --version); python -m pip install -q --user pypdf python-docx python-pptx openpyxl 2>$null } else { Ojo "Python no quedo; Claude lo puede instalar despues." }
$nav = @("C:\Program Files\Google\Chrome\Application\chrome.exe","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe","C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($nav) { Ok "navegador para PDF: $nav" } else { Ojo "No encontre Chrome ni Edge (hacen falta para los PDF)." }
if (-not (git config --global user.name)) { git config --global user.name "__NOMBRE_ASCII__" }
if (-not (git config --global user.email)) { git config --global user.email "__CORREO__" }
git config --global credential.helper manager 2>$null
git config --global core.longpaths true

Paso "2. Cerebro"
if (Test-Path (Join-Path $cerebro ".git")) {
  $eap = $ErrorActionPreference; $ErrorActionPreference = "Continue"
  git -C $cerebro pull --ff-only
  $ErrorActionPreference = $eap
  Ok "cerebro en $cerebro"
} else { Ojo "Esta carpeta no es un repositorio de Git. Sigue EMPIEZA-AQUI.md (git clone)."; exit 1 }
foreach ($d in @("privado","bandeja","entregables","procesos")) { New-Item -ItemType Directory -Force (Join-Path $cerebro $d) | Out-Null }

Paso "3. Memoria de Claude -> carpeta memoria del cerebro"
$clave = ($cerebro -replace '[^A-Za-z0-9]', '-')
$proj = Join-Path $env:USERPROFILE ".claude\projects\$clave"
New-Item -ItemType Directory -Force $proj | Out-Null
$mem = Join-Path $proj "memory"
if ((Test-Path $mem) -and ((Get-Item $mem -Force).Attributes -match "ReparsePoint")) { Ok "ya enlazada" }
else {
  if (Test-Path $mem) { Rename-Item $mem "memory_old_$(Get-Date -Format yyyyMMdd)"; Ojo "memoria previa respaldada" }
  cmd /c mklink /J "$mem" "$(Join-Path $cerebro 'memoria')" | Out-Null
  Ok "memory -> $cerebro\memoria"
}

Write-Host ""
Write-Host "LISTO." -ForegroundColor Green
Write-Host "En la app de Claude: pestana Code -> abrir carpeta -> $cerebro"
Write-Host "La primera vez, acepta 'confiar en esta carpeta' para que funcionen el guardado y la actualizacion automaticos."
