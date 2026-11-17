# Guía de la sesión · instalar un cerebro a una persona nueva

Para quien da la sesión (Antetodo). Esta carpeta `_antetodo/` **no se copia** al cerebro de la clienta.
Sale del cerebro de Romina (RM Wine Club, oct-2026), generalizado. Duración: 1.5 a 2 h por persona; con dos personas a la
vez, los pasos 1 a 5 se hacen en paralelo y la entrevista (paso 6) cada quien en su computadora.

## Antes de que lleguen (15 min)
- [ ] Saber de cada una: nombre completo, cómo le dicen, nombre del despacho/consultorio, correo de trabajo, **Mac o Windows**.
- [ ] Presentación abierta: https://claude.ai/artifact/LiyvRMVMZ6KfrnVTqz5o4k
- [ ] Internet de la oficina y un contacto por WhatsApp para pasarles ligas y comandos.

## Lo que ellas deben traer
- Su computadora (con cargador y la contraseña de administrador).
- Cuenta de Claude **de paga** (Pro o Max) con sesión iniciada. Con el plan gratis no hay Claude Code.
- Acceso a su correo de trabajo en esa computadora (para verificar GitHub).
- Si pueden: logo, y 3 a 5 documentos que hacen seguido, **sin datos de clientes o pacientes**.

## Paso 1 · Presentación (15 min)
Las 13 láminas. Detenerse en "Las siete piezas", "Qué instalamos hoy" y "Tus datos sensibles".

## Antes de la sesión · Crear su repositorio y su cerebro (10 min por persona), en la PC de Antetodo
1. En GitHub, con la cuenta de Antetodo que decida Gio: **New repository** → `cerebro-<apellido>` → **Private** → sin README.
2. Generar el cerebro con sus datos:
```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\OneDrive\Documents\Claude\cerebro-plantilla\_antetodo\crear-cerebro.ps1" -Nombre "<Nombre completo>" -Trato "<cómo le dicen>" -Negocio "<despacho o consultorio>" -Profesion abogada -Prefijo "<2 a 5 letras>" -Carpeta "<apellido>-cerebro" -Correo "<su correo>" -Repo "https://github.com/<cuenta>/cerebro-<apellido>.git"
```
   (`-Profesion`: abogada o doctora.) Queda en `Documents\Claude\<apellido>-cerebro`.
3. Subirlo:
```powershell
git -C "$env:USERPROFILE\OneDrive\Documents\Claude\<apellido>-cerebro" push -u origin main
```
4. Comprobar en GitHub que están `CLAUDE.md`, `EMPIEZA-AQUI.md` y la carpeta `.claude`.

## Paso 2 · Cuentas y app (15 min), en SU computadora
1. App de Claude de escritorio: claude.ai/download → entrar con su cuenta → comprobar que aparece la pestaña **Code**.
2. Google Chrome instalado.
3. Cuenta de **GitHub** con su correo de trabajo (github.com → Sign up). La contraseña la escribe ella; que la guarde en su
   llavero. Verificar el correo. Anotar su **nombre de usuario**.

## Paso 3 · Darle acceso a su repositorio (3 min)
1. En la PC de Antetodo: repo `cerebro-<apellido>` → Settings → Collaborators → Add people → su usuario → permiso **Write**.
2. Ella abre el correo de GitHub (o github.com/notifications) y da **Accept invitation**.
3. Comprobar que ya ve el repo en su GitHub.

Nota: el repositorio queda a nombre de Antetodo y ella entra como colaboradora. Si después lo quiere a su nombre, se le
transfiere (Settings → Transfer ownership) y Antetodo queda de colaborador; hay que actualizar la liga en su computadora.

## Paso 4 · Instalar en su computadora (15 min)
Seguir `EMPIEZA-AQUI.md` de su cerebro (ya trae sus datos y su liga): Windows = 3 comandos; Mac = 5.
Termina con **LISTO**.

## Paso 5 · Abrir y probar (5 min)
App de Claude → Code → abrir carpeta → confiar. Escribir: *"¿Quién soy, qué skills tienes y qué tengo pendiente?"*
- [ ] Contesta con su nombre y sus skills.
- [ ] Muestra los pendientes al abrir. **Ojo en Windows:** los ganchos de inicio y autoguardado solo se han probado en la
      Mac de Romina. Si no salen los pendientes o no se guarda solo, revisar `.claude/settings.json` ahí mismo.
- [ ] Después de una respuesta, en GitHub aparece un commit "Autoguardado de sesion".

## Paso 6 · Entrevista (30–40 min)
*"Hazme la entrevista."* Su Claude primero investiga en internet lo público de ella y de su negocio (con SU cuenta, no
la de Antetodo), se lo enseña para que corrija y luego solo pregunta lo que falta. Que conteste dictando.
Si es clienta de Antetodo y ya tenemos su sistema de diseño, se carga en `marca/` antes de la sesión (versión para
compartir de sistemadiseno, logos de su carpeta de Identidad; nada interno). No hace falta terminarla: se retoma sola.
Recordarle: sin nombres de clientes ni pacientes.

## Paso 7 · Conexiones (10 min, opcional)
En claude.ai → Configuración → Conectores: Gmail, Google Drive, Google Calendar (y Sheets si ahí lleva sus números).
Solo los que ella quiera. Explicar que puede quitarlos cuando quiera.

## Paso 8 · Primer resultado (15 min)
Elegir, de lo que salió en la entrevista, **un** documento que haga seguido y pedirlo: *"hazme una carta / propuesta / guía de…"*.
Debe salir un PDF en `entregables/`. Si le gusta: *"conviértelo en una skill"*.

## Cierre (5 min)
- Enseñarle `PENDIENTES.md` y la carpeta `bandeja/` (ahí suelta lo que quiera que Claude aprenda) y `privado/` (lo sensible).
- Tarea: usarlo todos los días una semana.
- Agendar la revisión a la semana.

## Después, en Antetodo
- Anotar en el `CLAUDE.md` de su cerebro lo que se haya decidido en la sesión.
- Lo que no quedó (marca, tablero, conectores) va a su `PENDIENTES.md`, sección "Lo está haciendo Antetodo".
