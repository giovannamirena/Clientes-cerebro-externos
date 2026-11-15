---
name: __PREFIJO__-tablero
description: >-
  Analiza los datos y números de __TRATO__ (Excel, Google Sheets, CSV, estados de cuenta, exportes de su sistema) y arma un
  resumen o tablero: ingresos, gastos, quién debe, cómo va el mes. Úsala SIEMPRE que diga "analiza este Excel", "hazme un
  tablero", "¿cómo van mis números?", "¿cuánto entró este mes?", "revisa mis ingresos y gastos", aunque no diga "skill".
---

# Datos y tablero

## 1. Primero, la fuente
- ¿De dónde salen los datos? (archivo en `bandeja/`, Google Sheets conectado, exporte de su sistema). Anótalo en
  `conocimiento/datos-y-numeros.md`: qué archivo, qué columnas, cada cuánto se actualiza.
- **Nunca se capturan números a mano ni se rellenan huecos.** Si falta un periodo o una columna, se dice y se pide.
- Archivos con nombres de personas atendidas: trabájalos desde `privado/` y en el tablero muestra totales, no nombres,
  salvo que ella pida el detalle.

## 2. Pasos
1. Lee el archivo (`python scripts/leer_documento.py "<archivo>"` o con Python y openpyxl si es grande).
2. **Valida antes de analizar:** número de renglones, fechas fuera de rango, totales que no suman, duplicados. Si algo no
   cuadra, detente y dile qué encontraste. Un dato que no cuadra casi siempre es una fuente incompleta.
3. Calcula lo que pidió. Di siempre de qué periodo y de qué archivo sale cada cifra.
4. Entrega:
   - Respuesta corta en el chat (3 a 5 cifras y lo que llama la atención).
   - Si pide tablero: una página HTML en `entregables/<AAAA-MM-DD>-tablero/` (gráficas simples, totales arriba), y su PDF si lo quiere.
5. Pregunta si quiere que este mismo corte se haga cada mes igual; si sí, conviértelo en skill propia con
   `__PREFIJO__-crear-skill` (mismas columnas, mismas cuentas, mismo formato).

## 3. Límites
Esto es para que vea su negocio con claridad. No sustituye a su contador: impuestos y declaraciones los calcula él o ella.

## 4. Guarda
`procesos/` (qué archivo, qué periodo, qué salió) · commit + push. Los archivos originales no se suben a GitHub.
