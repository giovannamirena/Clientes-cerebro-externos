---
name: __PREFIJO__-sistema-de-diseno
description: >-
  Construye y mantiene el sistema de diseño (design system) de __NEGOCIO__: logo, colores, tipografías y reglas de uso, más
  la estrategia de marca (esencia, público, personalidad, voz), para que todo documento, presentación o pieza salga igual.
  Úsala SIEMPRE que __TRATO__ diga "armemos mi marca", "mi design system", "mi sistema de diseño", "aquí está mi logo",
  "estos son mis colores", "quiero cambiar un color / la letra / el logo", "¿cómo debe verse / sonar mi marca?", o cuando
  deje su logo o papelería en la bandeja, aunque no diga "skill".
---

# Sistema de diseño de __NEGOCIO__

Todo vive en `marca/`: `README.md` (las reglas), `tokens.css` (colores y tipografías que usan las plantillas) y `logo/`.
Las plantillas de `plantillas/` leen `marca/tokens.css`: se cambia ahí una vez y cambia en todos los documentos.

## A. Lo visual
1. **Revisa qué hay:** `marca/README.md`, `marca/logo/` y `bandeja/` (logo, papelería, tarjetas, capturas de sus redes o web).
2. **Si ya tiene logo:**
   - Cópialo a `marca/logo/` (PNG con fondo transparente o SVG). Si hay versión clara y oscura, las dos.
   - No lo redibujes ni lo recolorees. Si solo hay una foto o captura, anótalo como provisional y pide el archivo original.
   - Saca sus colores del logo o de su papelería (códigos hex) y propón la paleta: tinta, fondo, fondo alterno, acento y línea.
3. **Si no tiene logo ni colores:** no inventes una marca. Pregunta 3 cosas (qué quiere transmitir, colores que le gustan y
   que no, una referencia que le guste) y propón **2 o 3 direcciones** en un documento de prueba para que elija. El logo se
   deja como su nombre en tipografía hasta que tenga uno; dile que el diseño del logo lo puede hacer Antetodo.
4. **Tipografías:** una para títulos y una para texto. Si su papelería usa una fuente con licencia, anótala y usa la
   alternativa libre más parecida.
5. **Escribe los tokens** en `marca/tokens.css` (nunca colores directos en una plantilla) y revisa el contraste: el texto
   debe leerse bien sobre su fondo.
6. **Documento de prueba:** genera uno con `__PREFIJO__-documento`, enséñaselo y ajusta con lo que diga.
7. **Deja las reglas** en `marca/README.md`: colores con su código y para qué se usa cada uno, tipografías, dónde va el logo
   y a qué tamaño, qué no le gusta, y un ejemplo de portada.

## B. La estrategia (cómo suena)
1. Lee `conocimiento/` (perfil, servicios, público, voz) para no preguntar lo que ya respondió en la entrevista.
2. Pregunta **un bloque a la vez**, 3 a 5 preguntas: para qué existe su marca, a quién le habla, qué la hace distinta,
   tres palabras de personalidad, cómo habla y cómo no habla. Donde ayude, dale 2 o 3 opciones escritas para elegir.
3. Guarda sus respuestas **textuales** con fecha en `marca/respuestas.md`.
4. Con eso escribe la sección **Estrategia** de `marca/README.md`: esencia, promesa, público, personalidad, voz (con
   ejemplos "sí suena así / no suena así") y frases de marca.

## C. Mantenerlo
- **Cambio de color, letra o logo:** se cambia en `marca/tokens.css` o `marca/logo/`, se regenera un documento de prueba y
  se anota la decisión con fecha en `memoria/decisiones.md`.
- Toda pieza nueva (presentación, carta, tablero, publicación) usa los mismos tokens y el mismo logo.
- En comunicación de servicios legales o de salud: nada de promesas de resultado ni testimonios inventados; lo que publique
  lo revisa ella.

## D. Guarda
Nota en `procesos/` · decisión en `memoria/decisiones.md` · commit + push (`__PREFIJO__-guardar`).
