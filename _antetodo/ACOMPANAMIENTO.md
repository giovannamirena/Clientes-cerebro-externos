# Acompañamiento · qué va a pasar en la pantalla de Jacky y de Alma

Para Gio. Sirve para ir un paso adelante mientras las dos instalan al mismo tiempo: qué les va a preguntar su
computadora o su Claude, qué se autoriza y qué debes ver tú antes de pasar al siguiente paso.

| | Jacky (abogada) | Alma (doctora) |
|---|---|---|
| Repo | `giovannamirena/cerebro-abogada` | `giovannamirena/cerebro-doctora` |
| Carpeta en su computadora | `jacky-cerebro` | `alma-cerebro` |
| Prefijo de sus skills | `jk-` | `al-` |
| Tu copia en GIONEW | `Documents\Claude\jacky-cerebro` | `Documents\Claude\alma-cerebro` |

---

## 1. Qué hay dentro del cerebro

| Archivo o carpeta | Para qué sirve | Cuándo lo van a ver |
|---|---|---|
| `CLAUDE.md` | Las reglas: cómo le habla, no inventar datos, secreto profesional, todo lo legal o médico marcado `[verificar]`, guardar siempre. | Nunca lo abren; Claude lo lee solo al iniciar. |
| `PENDIENTES.md` | Su lista de tareas. Trae 5 para empezar (entrevista, logo, documentos, números, usarlo a diario). | Claude se la enseña al abrir cada conversación. |
| `ENTREVISTA.md` | Las preguntas de la entrevista (9 bloques + uno por profesión). | Claude las va haciendo; ellas no abren el archivo. |
| `EMPIEZA-AQUI.md` | Los comandos de instalación con su liga ya puesta. | En el paso 3 de abajo. |
| `conocimiento/` | Lo que Claude sabe de ella. Empieza vacío. | Se llena con la entrevista. |
| `memoria/` | Preferencias y decisiones entre sesiones. | Se llena sola con el uso. |
| `marca/` | Logo, colores y tipografías. Empieza sobrio (negro, blanco, gris). | Cuando den su logo. |
| `bandeja/` | Donde sueltan archivos para que Claude los lea. | Desde hoy. Sus originales no se suben a GitHub. |
| `privado/` | Datos de clientes o pacientes. **Nunca se sube a GitHub.** | Cuando trabajen un caso real. |
| `entregables/` | Los PDF y documentos que Claude genera. | Con el primer documento. |
| `procesos/` | Bitácora de cada trabajo. | Se llena sola. |
| `plantillas/` | Plantilla del documento con su marca. | La usa Claude. |
| `scripts/` | Instalador, convertir a PDF, leer documentos. | Solo el instalador. |
| `.claude/skills/` | Sus 7 skills (abajo). | Se activan solas con sus frases. |
| `.claude/settings.json` | Los automáticos: actualizar al abrir, enseñar pendientes, guardar al final de cada respuesta. | No se toca. |

### Las 7 skills y la frase que las activa

| Skill | Frase | Qué hace |
|---|---|---|
| `entrevista` | "Hazme la entrevista" | Pregunta por bloques y llena `conocimiento/`. |
| `leer-documentos` | "Lee lo que dejé en la bandeja" | Convierte PDF, Word, Excel o fotos en conocimiento. |
| `documento` | "Hazme una carta / propuesta / guía de…" | Documento con su imagen, en PDF. |
| `sistema-de-diseno` | "Armemos mi marca", "aquí está mi logo" | Logo, colores, tipografías y cómo suena su marca. |
| `tablero` | "Analiza este Excel", "¿cómo van mis números?" | Lee sus datos, revisa que cuadren y arma un resumen. |
| `crear-skill` | "Quiero que esto lo hagas siempre así" | Convierte un proceso suyo en una skill nueva. |
| `guardar` | "Guarda", "acuérdate de esto" | Memoria, bitácora y respaldo en GitHub. |

---

## 2. Paso a paso: qué aparece y qué se autoriza

### Paso 1 · App y cuentas (en su computadora)

| Qué hacen | Qué les aparece | Qué se autoriza | Tú verificas |
|---|---|---|---|
| Abrir la app de Claude | Pantalla de inicio de sesión, si no han entrado | Entrar con SU cuenta de paga | Que exista la pestaña **Code**. Si no aparece, el plan no es de paga. |
| Crear cuenta en github.com | Formulario, verificación por correo, a veces un acertijo visual | Ellas escriben su contraseña y resuelven el acertijo | Que te digan su **nombre de usuario**. |

### Paso 2 · Darles acceso (tú, en GIONEW)

1. Abrir su repo en GitHub → **Settings → Collaborators → Add people** → su usuario → permiso **Write**.
2. Ellas abren el correo de GitHub y dan **Accept invitation**.
3. Verificas: en su GitHub ya aparece el repo.

### Paso 3 · Instalar (terminal de su computadora)

Siguen su `EMPIEZA-AQUI.md`. Lo pueden abrir desde GitHub, en su repo.

**Windows (PowerShell):**

| Comando | Qué les aparece | Qué se autoriza |
|---|---|---|
| `winget install --id Git.Git -e --silent` | Puede preguntar si aceptan los términos de la tienda (`Y`) y una ventana de Windows "¿Permitir que esta aplicación haga cambios?" | **Sí** a las dos. |
| `git clone …` | Se abre el navegador: "Sign in with your browser" y luego **Authorize** | Entrar con SU cuenta de GitHub y autorizar. |
| `…\scripts\instalar.ps1` | Tres bloques: 1. Herramientas, 2. Cerebro, 3. Memoria. Puede instalar Python (otra ventana de permiso). | **Sí** al permiso de instalación. |

**Mac (Terminal):**

| Comando | Qué les aparece | Qué se autoriza |
|---|---|---|
| `xcode-select --install` | Ventana "¿Instalar las herramientas de línea de comandos?" (tarda varios minutos) | **Instalar** y aceptar la licencia. |
| Instalar GitHub CLI (`.pkg`) | Instalador normal de Mac | Su contraseña de la Mac. |
| `gh auth login …` | Un código de 8 letras y se abre el navegador | Pegar el código y **Authorize** con SU cuenta. |
| `git clone … && bash …/instalar.sh` | Los mismos tres bloques | Nada más. |

**Tú verificas:** la última línea dice **LISTO.** en verde. Si dice `Repository not found`, no aceptaron la invitación o entraron con otra cuenta.

Antes del instalador, poner su correo real (el cerebro se generó con "pendiente"):
`git config --global user.email "su-correo"`

### Paso 4 · Abrir el cerebro en Claude

| Qué hacen | Qué les aparece | Qué se autoriza | Tú verificas |
|---|---|---|---|
| App de Claude → **Code** → abrir carpeta → `jacky-cerebro` / `alma-cerebro` | "¿Confías en los archivos de esta carpeta?" | **Sí, confío.** Sin esto no funcionan los automáticos. | — |
| Escribir: *¿Quién soy, qué skills tienes y qué tengo pendiente?* | Claude contesta con su nombre, sus 7 skills y sus 5 pendientes | — | Que salgan las tres cosas. |

Al terminar esa primera respuesta corre el **autoguardado**. Tú verificas en GitHub, en su repo, que aparezca un commit
nuevo llamado **"Autoguardado de sesion"**. Si no aparece (puede pasar en Windows: esto solo se ha usado en Mac), se le
dice a Claude: *"revisa por qué no se guardó en GitHub"*.

### Paso 5 · Los permisos que Claude va a pedir mientras trabaja

Cada vez que Claude quiera hacer algo en la computadora, enseña qué va a hacer y espera un clic.

| Qué pide | Qué contestar |
|---|---|
| Crear o editar un archivo **dentro de su cerebro** | **Permitir.** Pueden elegir "permitir siempre en este proyecto" para que no pregunte en cada archivo. |
| Correr `git …` o `python scripts/…` | No pregunta: ya viene autorizado. |
| Correr cualquier otro comando (instalar algo, abrir un programa) | Leer qué dice. Si es para hacer el PDF o leer un documento, **permitir**. Si no se entiende, preguntarte. |
| Tocar algo **fuera** de la carpeta del cerebro | **No**, salvo que tú lo veas. |
| Leer un documento con datos de una persona | Claude avisa antes: "lo que yo leo se procesa en los servidores de Anthropic, ¿lo leo así o me pasas una versión sin nombres?". Ellas deciden. |

### Paso 6 · La entrevista ("Hazme la entrevista")

Claude pregunta **un bloque a la vez, de 2 a 4 preguntas por mensaje**. Pueden dictar, decir "luego" y pausar.
Recordarles: sin nombres de clientes ni pacientes.

| Bloque | Qué pregunta | Dónde lo guarda |
|---|---|---|
| 1. Quién eres | Nombre como firma, título y cédula, formación, especialidad, en qué es buena, cómo quiere que le hable | `conocimiento/perfil.md` |
| 2. Tu negocio | Nombre del despacho o consultorio, equipo, servicios, cuál quiere crecer, cuál le quita tiempo, dónde atiende | `conocimiento/servicios.md` |
| 3. A quién atiendes | Cliente o paciente típico e ideal, las 5 dudas más frecuentes, miedos, cómo llegan | `conocimiento/publico.md` |
| 4. Tu trabajo diario | Un día y una semana normales, documentos que repite, formatos propios, qué hace a mano, herramientas | `conocimiento/procesos-de-trabajo.md` |
| 5. Cómo escribes | Tú o usted, frases que usa y que no soporta, 2 o 3 textos reales, saludo y despedida | `conocimiento/voz.md` |
| 6. Tu marca | Logo, colores, papelería, tres palabras, redes y web, una referencia que le guste | `marca/README.md` |
| 7. Datos y números | Dónde lleva ingresos y gastos, asuntos o pacientes, agenda, qué número quiere ver, quién más toca los datos | `conocimiento/datos-y-numeros.md` |
| 8. Reglas y cuidado | Qué nunca sale de su computadora, qué revisa siempre ella, qué jamás hacer en su nombre | `memoria/preferencias.md` |
| 9. Metas | Qué quiere lograr en un mes y en seis, la primera cosa que le pediría | `conocimiento/metas.md` y `PENDIENTES.md` |
| Solo Jacky | Materias y plaza, escritos y contratos, control de términos, cómo cobra, fuentes legales | junto con el bloque que toque |
| Solo Alma | Especialidad, padecimientos, material para pacientes, expediente electrónico, clases y congresos, fuentes clínicas | junto con el bloque que toque |

Al final Claude entrega: un resumen de una pantalla, la lista de lo que quedó `[pendiente]` y **propone 3 skills**
para que elijan una. Durante la entrevista va a pedir permiso para escribir archivos en `conocimiento/`: permitir.

Si no da tiempo, basta con los bloques 1, 2 y 4: con eso ya puede hacer el primer documento.

### Paso 7 · Conexiones (opcional)

En claude.ai → Configuración → Conectores. Cada uno abre la pantalla de Google.

| Conector | Qué les aparece | Qué están autorizando |
|---|---|---|
| Gmail | "Claude quiere acceder a tu cuenta de Google" | Leer y redactar correos. Claude no envía sin que ellas lo aprueben. |
| Google Drive | Igual | Buscar y leer sus archivos de Drive. |
| Google Calendar | Igual | Ver y crear eventos. |

Decirles: con la cuenta de trabajo, no la personal; se puede quitar cuando quieran. Si en esa cuenta hay expedientes o
historias clínicas, mejor no conectar Drive todavía.

### Paso 8 · Primer documento

Frase: *"hazme una carta / propuesta / guía de…"* (lo que dijeron que más repiten).

1. Claude pregunta en un solo mensaje: para quién es, para qué, qué debe decir, extensión y fecha.
2. Pide permiso para crear la carpeta en `entregables/` y el archivo: permitir.
3. Lo convierte a PDF solo (usa Chrome por dentro; no se abre ninguna ventana).
4. Lo enseña y dice qué quedó marcado `[verificar]`.

**Tú verificas:** que exista el PDF en `entregables/<fecha>-<nombre>/`. Si les gusta: *"conviértelo en una skill"*.

Si ya traen logo, antes: *"aquí está mi logo, armemos mi marca"* (skill `sistema-de-diseno`) para que el PDF salga con su imagen.

### Paso 9 · Cierre

- Enseñarles `bandeja/` (ahí sueltan lo que quieran que aprenda) y `privado/` (lo sensible).
- Tarea: usarlo todos los días esta semana.
- Tú verificas en GitHub que cada repo tenga commits de hoy.

---

## 3. Tu tablero para llevar a las dos

| Paso | Jacky | Alma |
|---|---|---|
| App de Claude con pestaña Code | ☐ | ☐ |
| Cuenta de GitHub (usuario anotado) | ☐ | ☐ |
| Invitada y aceptó | ☐ | ☐ |
| Instalador dijo LISTO | ☐ | ☐ |
| Abrió la carpeta y confió | ☐ | ☐ |
| Contestó quién es, skills y pendientes | ☐ | ☐ |
| Commit "Autoguardado de sesion" en GitHub | ☐ | ☐ |
| Entrevista (bloques 1, 2 y 4 mínimo) | ☐ | ☐ |
| Conectores que quiso | ☐ | ☐ |
| Primer PDF en `entregables/` | ☐ | ☐ |

## 4. Si algo falla

| Qué pasa | Qué hacer |
|---|---|
| No aparece la pestaña Code | El plan no es de paga o falta actualizar la app. |
| `Repository not found` | No aceptó la invitación o entró a GitHub con otra cuenta. |
| `git no se reconoce` | Cerrar y abrir PowerShell y repetir. |
| No salen los pendientes al abrir | Decirle a Claude "lee PENDIENTES.md"; después revisas `.claude/settings.json`. |
| No aparece el autoguardado en GitHub | Decirle a Claude "guarda" (skill `guardar`) y revisar el error que muestre. |
| El PDF no se genera | Falta Google Chrome o Edge. |
| Claude pide permiso para algo que no entienden | Que no lo aprueben hasta que lo veas tú. |
