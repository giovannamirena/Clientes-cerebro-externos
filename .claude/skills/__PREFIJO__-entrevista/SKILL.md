---
name: __PREFIJO__-entrevista
description: >-
  Entrevista inicial para llenar el cerebro de __TRATO__: quién es, qué hace, cómo trabaja, cómo escribe, qué documentos
  repite y dónde viven sus datos. Úsala SIEMPRE que diga "hazme la entrevista", "vamos a llenar mi cerebro", "pregúntame lo
  que necesites saber", o cuando conocimiento/perfil.md siga vacío, aunque no diga "skill".
---

# Entrevista inicial

Las preguntas están en `ENTREVISTA.md` (raíz del cerebro), por bloques.

## Cómo se hace
1. Lee `ENTREVISTA.md` y lo que ya exista en `conocimiento/` para no repetir preguntas contestadas.
2. Pregunta **un bloque a la vez, de 2 a 4 preguntas por mensaje**, en lenguaje sencillo. Ella puede contestar dictando.
   Si contesta corto, pide un ejemplo. Si dice "luego", anótalo en `PENDIENTES.md` y sigue.
3. No completes con suposiciones. Lo que no dijo queda como `[pendiente]`.
4. **Sin nombres de personas atendidas** (clientes, pacientes): si los menciona, guárdalos como "caso A" o con iniciales (regla 3 de `CLAUDE.md`).
5. Al terminar cada bloque, guarda:
   | Bloque | Archivo |
   |---|---|
   | Quién es | `conocimiento/perfil.md` |
   | Su negocio y servicios | `conocimiento/servicios.md` |
   | A quién atiende | `conocimiento/publico.md` |
   | Cómo trabaja, sus documentos | `conocimiento/procesos-de-trabajo.md` |
   | Cómo escribe y habla | `conocimiento/voz.md` |
   | Marca | `marca/README.md` |
   | Datos y números | `conocimiento/datos-y-numeros.md` |
   | Metas y lo que quiere dejar de hacer a mano | `conocimiento/metas.md` y `PENDIENTES.md` |
   | Preferencias de trato y formato | `memoria/preferencias.md` (y su línea en `memoria/MEMORY.md`) |
6. Al final: resumen de una pantalla de lo que aprendiste, lista de `[pendiente]`, y **propón las 3 primeras skills** que
   más tiempo le ahorrarían (según lo que repite), para que elija una y hacerla ahí mismo con `__PREFIJO__-crear-skill`.
7. Guarda con `__PREFIJO__-guardar`.

Se puede pausar y retomar: al volver, lee lo guardado y sigue en el bloque que falte.
