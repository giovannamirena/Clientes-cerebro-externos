---
name: __PREFIJO__-crear-skill
description: >-
  Convierte un proceso que __TRATO__ repite en una skill nueva (o mejora una existente) dentro de su cerebro, para que
  Claude lo haga siempre igual. Úsala SIEMPRE que diga "quiero que esto lo hagas siempre así", "conviértelo en skill",
  "aprende este proceso", "guarda cómo lo hicimos", "haz una plantilla de esto", o cuando el mismo tipo de trabajo se haya
  pedido dos veces, aunque no diga "skill".
---

# Crear o mejorar una skill

1. **Entiende el proceso** con ella (o de la conversación): qué le piden, qué datos necesita, pasos, cómo debe verse el
   resultado, qué NO se hace. Si ya hay un ejemplo bueno en `entregables/` o `procesos/`, úsalo como referencia.
2. **¿Ya existe una skill parecida?** Revisa `.claude/skills/`. Si sí, mejórala en lugar de crear otra.
3. **Crea** `.claude/skills/__PREFIJO__-<nombre-corto>/SKILL.md`:
   ```
   ---
   name: __PREFIJO__-<nombre-corto>
   description: >-
     Qué hace en una frase. Úsala SIEMPRE que diga "<frase 1>", "<frase 2>", "<frase 3>", aunque no diga "skill".
     (Y cuándo NO usarla, si se parece a otra.)
   ---
   # Título
   ## 1. Datos que necesitas (y qué preguntar)
   ## 2. Pasos
   ## 3. Cómo debe quedar (estructura / ejemplo)
   ## 4. Qué revisa ella antes de usarlo (lo marcado [verificar])
   ## 5. Guarda (procesos/ + memoria/ + commit y push)
   ```
   - La `description` es lo que hace que la skill se active: pon las frases con las que ella lo pide de verdad.
   - Si el resultado es un PDF, crea su plantilla en `plantillas/` copiando `plantillas/documento.html` (mismo `marca/tokens.css`).
   - Si hace falta un script, va en `scripts/` y debe funcionar en Windows y Mac.
   - Si el proceso usa datos de personas atendidas, la skill dice dónde van (`privado/`) y qué se anonimiza.
4. **Pruébala** en el momento con un caso real y ajusta.
5. Agrégala a la tabla "Tus skills" de `CLAUDE.md`, nota en `procesos/`, commit + push.
6. Dile el nombre y la frase para usarla. (Las skills nuevas se cargan al abrir una nueva sesión.)
