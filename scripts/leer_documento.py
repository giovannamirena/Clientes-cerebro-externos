"""Convierte un documento a texto (Markdown) para que Claude lo lea y lo guarde en conocimiento/.

Uso:
  python scripts/leer_documento.py bandeja/Curso-Nueva-Zelanda.pdf
  python scripts/leer_documento.py bandeja/temario.docx conocimiento/documentos/temario.md

Formatos: .pdf, .docx, .pptx, .xlsx, .txt, .md, .csv
Si falta una librería, la instala sola (pypdf, python-docx, python-pptx, openpyxl).
Un PDF escaneado (solo imágenes) sale casi vacío: en ese caso Claude debe abrir las páginas como imagen.
"""
import importlib
import pathlib
import subprocess
import sys

LIBS = {"pypdf": "pypdf", "docx": "python-docx", "pptx": "python-pptx", "openpyxl": "openpyxl"}


def lib(nombre):
    try:
        return importlib.import_module(nombre)
    except ImportError:
        subprocess.run([sys.executable, "-m", "pip", "install", "-q", LIBS[nombre]], check=False)
        return importlib.import_module(nombre)


def pdf(p):
    r = lib("pypdf").PdfReader(str(p))
    partes = []
    for i, pg in enumerate(r.pages, 1):
        partes.append(f"\n<!-- página {i} -->\n{(pg.extract_text() or '').strip()}")
    return "\n".join(partes)


def docx(p):
    d = lib("docx").Document(str(p))
    out = []
    for par in d.paragraphs:
        t = par.text.strip()
        if not t:
            continue
        estilo = (par.style.name or "").lower()
        if estilo.startswith("heading") or estilo.startswith("título"):
            nivel = "".join(ch for ch in estilo if ch.isdigit()) or "2"
            out.append("#" * min(int(nivel) + 1, 6) + " " + t)
        elif "list" in estilo or "lista" in estilo:
            out.append("- " + t)
        else:
            out.append(t)
    for tabla in d.tables:
        filas = [[c.text.strip().replace("\n", " ") for c in f.cells] for f in tabla.rows]
        if filas:
            out.append("")
            out.append("| " + " | ".join(filas[0]) + " |")
            out.append("|" + "---|" * len(filas[0]))
            out += ["| " + " | ".join(f) + " |" for f in filas[1:]]
    return "\n\n".join(out)


def pptx(p):
    prs = lib("pptx").Presentation(str(p))
    out = []
    for i, s in enumerate(prs.slides, 1):
        out.append(f"\n## Diapositiva {i}")
        for sh in s.shapes:
            if sh.has_text_frame and sh.text_frame.text.strip():
                out.append(sh.text_frame.text.strip())
    return "\n".join(out)


def xlsx(p):
    wb = lib("openpyxl").load_workbook(str(p), data_only=True, read_only=True)
    out = []
    for ws in wb.worksheets:
        out.append(f"\n## Hoja: {ws.title}")
        for fila in ws.iter_rows(values_only=True):
            if any(v is not None for v in fila):
                out.append("| " + " | ".join("" if v is None else str(v) for v in fila) + " |")
    return "\n".join(out)


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    src = pathlib.Path(sys.argv[1])
    ext = src.suffix.lower()
    lector = {".pdf": pdf, ".docx": docx, ".pptx": pptx, ".xlsx": xlsx}.get(ext)
    texto = lector(src) if lector else src.read_text(encoding="utf-8", errors="replace")
    cab = f"<!-- fuente: {src.name} -->\n# {src.stem}\n\n"
    if len(sys.argv) > 2:
        dst = pathlib.Path(sys.argv[2])
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text(cab + texto, encoding="utf-8")
        print(f"Guardado: {dst}  ({len(texto)} caracteres)")
    else:
        sys.stdout.reconfigure(encoding="utf-8")
        print(cab + texto)
    if len(texto.strip()) < 200 and ext == ".pdf":
        print("\nOJO: casi no salió texto. Probablemente es un PDF escaneado: ábrelo como imagen.", file=sys.stderr)


if __name__ == "__main__":
    main()
