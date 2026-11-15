# Empieza aquí · instalar el cerebro en la computadora de __TRATO__

Se hace con alguien de Antetodo, en persona o en videollamada (20–30 min).

## 0. Antes
1. **App de Claude** instalada (claude.ai/download) y con sesión iniciada con la cuenta de __NOMBRE__ (plan de paga: Pro o Max).
2. **Cuenta de GitHub** de __NOMBRE__ (github.com, con su correo de trabajo), ya invitada por Antetodo al repositorio
   privado donde vive el respaldo del cerebro (`__REPO__`) y con la invitación aceptada.
3. **Google Chrome** instalado (se usa para hacer los PDF).

## 1. Windows
Abrir **PowerShell** (Inicio → escribir PowerShell → Enter) y pegar:
```powershell
winget install --id Git.Git -e --silent
```
Cerrar PowerShell, abrirlo de nuevo y pegar:
```powershell
git clone __REPO__ "$env:USERPROFILE\__CARPETA__"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\__CARPETA__\scripts\instalar.ps1"
```
(Se abre el navegador para entrar a GitHub → *Sign in with your browser* → Authorize.) Termina con **LISTO**.

## 1. Mac
Abrir **Terminal** (Cmd+Espacio → Terminal) y pegar, una línea a la vez:
```bash
xcode-select --install
```
(Si dice que ya está instalado, sigue. Si abre una ventana, acepta "Instalar" y espera a que termine.)

Instalar **GitHub CLI**: descargar el instalador `macOS universal .pkg` de https://cli.github.com y abrirlo
(con Homebrew: `brew install gh`). Luego:
```bash
gh auth login --hostname github.com --git-protocol https --web
```
Muestra un código de 8 letras → Enter → se abre el navegador → pegar el código → **Authorize** con la cuenta de __NOMBRE__.
```bash
gh auth setup-git
```
```bash
git clone __REPO__ ~/__CARPETA__ && bash ~/__CARPETA__/scripts/instalar.sh
```
Termina con **LISTO**.

## 2. Abrir el cerebro en Claude
App de Claude → pestaña **Code** → abrir carpeta → `__CARPETA__` (en la carpeta de usuario).
La primera vez pregunta si confías en la carpeta: **sí** (así funcionan la actualización y el guardado automáticos).

## 3. Probar
Escribir en Claude:
> ¿Quién soy, qué skills tienes y qué tengo pendiente?

Debe responder con su nombre, las skills (`__PREFIJO__-entrevista`, `__PREFIJO__-documento`, …) y la lista de pendientes.
Luego: **"hazme la entrevista"**.

## Si algo falla
| Mensaje | Qué hacer |
|---|---|
| `Repository not found` | La cuenta de GitHub no tiene acceso o se entró con otra cuenta. |
| `git no se reconoce` | Cerrar y abrir PowerShell/Terminal y repetir. |
| `No encontré Chrome ni Edge` | Instalar Google Chrome. |
| "[cerebro] No pude actualizar" al abrir | Sin internet o hay un conflicto: decirle a Claude "revisa por qué no se actualizó el cerebro". |
| No aparecen los pendientes al abrir | Decirle a Claude "lee PENDIENTES.md" y avisar a Antetodo. |
| Cualquier otra cosa | Foto de la pantalla a Antetodo. |
