---
name: __PREFIJO__-leer-documentos
description: >-
  Lee los documentos de __TRATO__ (PDF, Word, PowerPoint, Excel, notas, fotos de apuntes) y los convierte en conocimiento
  ordenado en conocimiento/ para usarlos después. Úsala SIEMPRE que diga "lee lo que dejé en la bandeja", "guarda este
  documento", "aprende cómo hago mis…", "¿qué dice mi documento de…?", o arrastre un archivo a la conversación, aunque no
  diga "skill".
---

# Leer y ordenar documentos

## Antes de leer
Si el documento puede traer datos de una persona atendida (expediente, historia clínica, contrato firmado, demanda), dile en
una línea: "Este documento parece tener datos de una persona. Lo que yo leo se procesa en los servidores de Anthropic.
¿Lo leo así, o me pasas una versión sin nombres?" y espera su respuesta (regla 3 de `CLAUDE.md`).

## Entrada
- Archivos en `bandeja/` (o la ruta que diga, o adjuntos en la conversación).
- Para cada uno: `python scripts/leer_documento.py "<archivo>"` (en Mac `python3`). Si es PDF escaneado o foto, ábrelo como
  imagen y transcribe tú.

## Dónde va cada cosa
| Si el documento es… | Va a |
|---|---|
| Un formato o machote suyo (contrato, carta, receta, consentimiento, guía, informe) **sin datos de personas** | `conocimiento/formatos/<nombre>.md`: estructura, cláusulas o secciones, y su forma de redactar |
| Datos de ella (CV, cédula, certificaciones, biografía) | `conocimiento/perfil.md` |
| Lista de servicios, precios u honorarios | `conocimiento/servicios.md` (con fecha) |
| Material con su marca (papelería, logo) | `marca/` |
| Brief o lista de cosas que quiere automatizar | `conocimiento/automatizaciones.md`: una sección por proceso (qué pasa hoy, quién lo hace, con qué herramienta, cada cuánto, qué quiere que pase solo, qué datos toca). Al terminar, propón en qué orden hacerlas (lo que más tiempo le ahorra y menos riesgo tiene primero) y pásalas a `PENDIENTES.md`. Las que se resuelvan con una skill, hazlas con `__PREFIJO__-crear-skill`; las que necesiten conectar sistemas, anótalas como "con Antetodo" |
| Cualquier cosa con datos de una persona atendida | `privado/<caso>/` (texto completo). En `conocimiento/` solo lo aprendido del **formato**, sin datos de la persona |
| Cualquier otro | `conocimiento/documentos/<nombre>.md` (texto completo convertido) |

Siempre: arriba de cada `.md` la fuente (`<!-- fuente: archivo, fecha -->`).

## Después
- Dile qué guardaste y dónde; **no borres** nada de la bandeja sin su permiso.
- Si ves que un tipo de documento se repite, proponle convertirlo en skill (`__PREFIJO__-crear-skill`).
- Índice de lo nuevo en `memoria/MEMORY.md` si es relevante · `procesos/` · commit + push.
