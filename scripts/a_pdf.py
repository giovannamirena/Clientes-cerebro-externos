"""Convierte un HTML (manual, ficha, capacitación) a PDF con Chrome o Edge en modo headless.

Uso:
  python scripts/a_pdf.py manuales/2026-10-20-cata-nueva-zelanda/manual.html
  python scripts/a_pdf.py entrada.html salida.pdf

- Respeta el @page del CSS (tamaño carta, márgenes) y los saltos de página de la plantilla.
- Funciona en Windows y Mac. Si no encuentra navegador, dice cuál instalar.
"""
import os
import pathlib
import platform
import shutil
import subprocess
import sys
import tempfile

CANDIDATOS = {
    "Windows": [
        r"C:\Program Files\Google\Chrome\Application\chrome.exe",
        r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
        r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
        r"C:\Program Files\Microsoft\Edge\Application\msedge.exe",
        os.path.expandvars(r"%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"),
    ],
    "Darwin": [
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
        "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge",
        "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser",
    ],
    "Linux": ["google-chrome", "chromium", "chromium-browser", "microsoft-edge"],
}


def navegador():
    for c in CANDIDATOS.get(platform.system(), []):
        if os.path.isabs(c) and os.path.exists(c):
            return c
        if not os.path.isabs(c) and shutil.which(c):
            return shutil.which(c)
    sys.exit("No encontré Chrome ni Edge. Instala Google Chrome y vuelve a intentar.")


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    src = pathlib.Path(sys.argv[1]).resolve()
    out = pathlib.Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else src.with_suffix(".pdf")
    if not src.exists():
        sys.exit(f"No existe {src}")
    # Chrome falla con rutas muy largas o con OneDrive: escribe a una carpeta temporal y luego mueve
    tmp = pathlib.Path(tempfile.gettempdir()) / "rm_pdf.pdf"
    tmp.unlink(missing_ok=True)
    # perfil aparte (no choca con el Chrome abierto) y espera al archivo: Chrome a veces no se cierra solo (pantalla dormida, actualización pendiente)
    perfil = pathlib.Path(tempfile.gettempdir()) / "rm_pdf_perfil"
    proc = subprocess.Popen(
        [navegador(), "--headless=new", "--disable-gpu", "--no-first-run", f"--user-data-dir={perfil}", "--allow-file-access-from-files",
         "--no-pdf-header-footer", "--virtual-time-budget=8000", f"--print-to-pdf={tmp}", src.as_uri()],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    import time
    tam, fin = -1, time.time() + 240
    while time.time() < fin and proc.poll() is None:
        time.sleep(1.5)
        if tmp.exists() and tmp.stat().st_size > 0:
            if tmp.stat().st_size == tam:
                break
            tam = tmp.stat().st_size
    if proc.poll() is None:
        proc.kill()
    if not tmp.exists():
        sys.exit("El navegador no generó el PDF. Revisa que el HTML abra bien en el navegador.")
    out.parent.mkdir(parents=True, exist_ok=True)
    shutil.move(str(tmp), out)
    print(f"PDF listo: {out}  ({out.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
