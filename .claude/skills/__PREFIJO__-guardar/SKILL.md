---
name: __PREFIJO__-guardar
description: >-
  Guarda el trabajo y lo aprendido en el cerebro de __TRATO__: nota del proceso, memoria (preferencias, decisiones) y
  respaldo en GitHub (commit + push). Úsala SIEMPRE que diga "guarda", "acuérdate de esto", "anótalo", "no se te olvide",
  "respáldalo", al terminar un documento o cambio importante, y antes de cerrar una sesión larga.
---

# Guardar (memoria + proceso + respaldo)

1. **Memoria** (`memoria/`): una nota por tema, no un diario.
   - `memoria/preferencias.md`: cómo le gusta (tono, formatos, cosas que no quiere).
   - `memoria/decisiones.md`: decisiones con fecha (AAAA-MM-DD).
   - Antes de escribir, revisa si ya existe una nota del tema y actualízala. Borra lo que ya no sea cierto.
   - Mantén `memoria/MEMORY.md` como índice: una línea por nota con su liga.
2. **Proceso** (`procesos/<AAAA-MM-DD>-<tarea>.md`): qué se pidió, qué se hizo, archivos y rutas, pendientes.
3. **Datos sensibles:** nada que identifique a una persona atendida fuera de `privado/` (regla 3 de `CLAUDE.md`). Revisa
   lo que vas a guardar antes del commit.
4. **Respaldo:**
   ```
   git add -A
   git commit -m "<qué se hizo, en español>"
   git push
   ```
   Si `push` es rechazado: `git pull --rebase` y otra vez `git push`. Nunca `--force`. Sin internet: avísale y reintenta luego.
