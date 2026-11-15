---
name: __PREFIJO__-documento
description: >-
  Hace un documento con la imagen de __NEGOCIO__ y lo entrega en PDF: carta, propuesta, cotización, guía, informe, resumen
  o material informativo. Úsala SIEMPRE que __TRATO__ diga "hazme una carta / propuesta / guía / informe", "pásalo a PDF
  con mi logo", "redacta un documento para…", aunque no diga "skill". Si ya existe una skill específica para ese tipo de
  documento, usa esa.
---

# Documento con su marca (PDF)

## 1. Datos que necesitas
Para quién es, para qué, qué debe decir, extensión y fecha. Lo que falte y no esté en `conocimiento/`, pregúntalo en un solo
mensaje. No inventes cifras, nombres ni fechas (regla 2).

## 2. Pasos
1. Busca en `conocimiento/formatos/` si ya hay un formato suyo parecido y en `conocimiento/voz.md` cómo escribe.
2. Redacta el contenido. Lo legal o médico que no venga de ella va con fuente y `[verificar]` (regla 4).
3. Crea `entregables/<AAAA-MM-DD>-<nombre>/documento.html` copiando `plantillas/documento.html` y llenando el contenido.
4. Convierte: `python scripts/a_pdf.py entregables/<carpeta>/documento.html` (en Mac `python3`).
5. Abre el PDF, revisa página por página (nada cortado ni encimado, logo bien) y corrige.
6. Enséñaselo, dile qué quedó marcado `[verificar]` y pregunta si ajusta algo.

## 3. Cómo debe quedar
Logo arriba, título, cuerpo en párrafos cortos, datos de contacto al pie. Sin emojis. Tamaño carta.

## 4. Guarda
Si el documento lleva datos de una persona atendida, la carpeta va en `privado/entregables/`, no en `entregables/`.
Nota en `procesos/` (sin nombres) · commit + push.
