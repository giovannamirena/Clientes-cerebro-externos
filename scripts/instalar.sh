#!/bin/bash
# Instala / repara este cerebro en una Mac. Se puede correr las veces que quieras.
#
# Antes:
#   1. Instalar la app de Claude (claude.ai/download) y entrar con la cuenta de la duena del cerebro.
#   2. Haber clonado este repositorio (ver EMPIEZA-AQUI.md).
#
# Uso (Terminal):
#   bash ~/__CARPETA__/scripts/instalar.sh
set -e
paso() { printf "\n\033[36m== %s\033[0m\n" "$1"; }
ok()   { printf "   \033[32mOK\033[0m  %s\n" "$1"; }
ojo()  { printf "   \033[33m!!\033[0m  %s\n" "$1"; }

CEREBRO="$(cd "$(dirname "$0")/.." && pwd)"

paso "1. Herramientas (Git, Python, Chrome)"
if ! xcode-select -p >/dev/null 2>&1; then
  ojo "Faltan las herramientas de Apple (traen Git y Python). Se abrira una ventana: acepta 'Instalar' y vuelve a correr esto al terminar."
  xcode-select --install || true
  exit 1
fi
ok "$(git --version)"
ok "$(python3 --version)"
python3 -m pip install -q --user pypdf python-docx python-pptx openpyxl 2>/dev/null || ojo "no pude instalar las librerias de Python (Claude lo hara despues)"
if [ -d "/Applications/Google Chrome.app" ] || [ -d "/Applications/Microsoft Edge.app" ]; then ok "navegador para PDF"; else ojo "Instala Google Chrome (hace falta para los PDF)."; fi
git config --global user.name >/dev/null || git config --global user.name "__NOMBRE_ASCII__"
git config --global user.email >/dev/null || git config --global user.email "__CORREO__"
git config --global credential.helper osxkeychain

paso "2. Cerebro"
if [ -d "$CEREBRO/.git" ]; then git -C "$CEREBRO" pull --ff-only || ojo "no pude actualizar (sin internet?)"; ok "cerebro en $CEREBRO"
else ojo "Esta carpeta no es un repositorio de Git. Sigue EMPIEZA-AQUI.md (git clone)."; exit 1; fi
mkdir -p "$CEREBRO/privado" "$CEREBRO/bandeja" "$CEREBRO/entregables" "$CEREBRO/procesos"

paso "3. Memoria de Claude -> carpeta memoria del cerebro"
CLAVE="$(printf '%s' "$CEREBRO" | sed 's/[^A-Za-z0-9]/-/g')"
PROJ="$HOME/.claude/projects/$CLAVE"
mkdir -p "$PROJ"
if [ -L "$PROJ/memory" ]; then ok "ya enlazada"
else
  [ -e "$PROJ/memory" ] && mv "$PROJ/memory" "$PROJ/memory_old_$(date +%Y%m%d)" && ojo "memoria previa respaldada"
  ln -s "$CEREBRO/memoria" "$PROJ/memory"; ok "memory -> $CEREBRO/memoria"
fi

printf "\n\033[32mLISTO.\033[0m\n"
echo "En la app de Claude: pestana Code -> abrir carpeta -> $CEREBRO"
echo "La primera vez, acepta 'confiar en esta carpeta' para que funcionen el guardado y la actualizacion automaticos."
