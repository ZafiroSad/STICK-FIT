# STICK FIT — Bitácora del proyecto

## Descripción y objetivo
App personal de entrenamiento de **fuerza** para el Señor Stick. Objetivo: construir un físico
atlético, magro y funcional —no de culturista— mediante sobrecarga progresiva. Pensada para usarse
**desde el celular**. Reemplaza a un prototipo anterior de temática superheroica, ya descartada.

**Convención:** no se nombra a ninguna persona real ni marca de ficción en la app ni en este
repositorio. Los objetivos se describen por sus características físicas, no por referencias.

## Ubicación
`C:\Users\kevin\Documents\KEVIN\02. WORK\03. PROYECTOS PERSONALES\STICK FIT\` (movida desde Downloads
el 2026-08-01, junto a las demás apps de la familia Stick).

## Estado actual — ESTABLE (Tier 1 y 2 completos)
- **Versión:** 1.18.0 — **completar días de semanas anteriores** (tocar el calendario abre ese día).
- v1.18.0 (semanas pasadas): resuelve el pendiente de v1.17.0. `dateOfDay(dayId,off)` acepta ahora un
  desfase de semanas y la vista Hoy guarda ese desfase en `weekOffset` (0 = semana actual, 1 = la
  pasada…). Tres formas de llegar a un día viejo: **tocar su cuadrito** en el calendario de asistencia
  (`openDate()` calcula el `weekOffset` con `weekOffsetOf()` y salta a Hoy), las flechas ‹ › de la
  nueva barra de semana en Hoy, o el botón **Hoy** de esa barra para volver. El botón Hoy del dock
  también reinicia la semana. Caché SW → `stickfit-v16`.
- v1.18.0 (detalles): las píldoras de la semana llevan el **número de día** (`LUN 27`), porque al
  poder viajar entre semanas "Lun" solo ya no identifica una fecha. `lastEntry(exId,antes)` acepta un
  tope: al completar un día pasado el objetivo sugerido sale de la sesión **anterior a ese día**, no
  de una posterior que ya esté registrada.
- **Decisión (v1.18.0):** el calendario **no** deja abrir días posteriores al domingo de la semana en
  curso; ahí el toque sigue mostrando solo el detalle (toast). Hacia atrás no hay límite. Marcar un
  día futuro de la semana en curso se mantiene permitido (con el aviso ámbar de v1.17.0): es el caso
  de quien entrena de noche y adelanta el registro, no el de inventar sesiones de un mes que no llega.
- **Decisión (v1.18.0):** `weekOffset` vive en memoria, no en `localStorage`, igual que `mzOpen`: es
  posición de vista, y abrir la app siempre en la semana actual es lo predecible.
- **Decisión (v1.18.0):** la etiqueta de la semana dice "Esta semana" / "Semana pasada" y solo usa el
  rango de fechas ("20 jul – 26 jul") de dos semanas atrás. Con el rango completo, "Semana pasada ·
  27 jul – 02 ago" se cortaba en un iPhone; los días exactos ya están en las píldoras y en la cabecera.
- **Versión:** 1.17.0 — **calendario a todo el ancho** + el día que marcas se guarda en SU fecha.
- v1.17.0 (fecha correcta): **bug corregido**. `checkKey()` y el registro de pesos usaban siempre
  `todayKey()`, así que elegir el martes en el selector de Hoy y marcar ahí guardaba el check (y la
  entrada de `history`) con la fecha de **hoy**: el calendario pintaba el día equivocado y el día
  olvidado quedaba en "no fuiste". Nuevo `dateOfDay(dayId)` devuelve la fecha real de ese día dentro
  de la **semana en curso** (lunes→domingo, igual que el selector); de ahí salen ahora `checkKey()`,
  `dayEntry()` (antes `todayEntry`) y el `date` de la entrada de historial. Efecto colateral bueno:
  las píldoras de la semana muestran el progreso real de cada día, no el de hoy repetido siete veces.
  Caché SW → `stickfit-v15`.
- v1.17.0 (calendario ancho): `.calgrid` pasa de `repeat(7,13px)` + `width:max-content` a
  `repeat(7,1fr)` con `width:100%` y celdas de `aspect-ratio:1` (≈41 px en un iPhone). Con ese
  tamaño el cuadrito **recupera el número de día** y vuelve la cabecera L-M-M-J-V-S-D; el número
  toma el color del estado (verde a medias, rosa "no fuiste", oscuro sobre el verde sólido).
- **Decisión (v1.17.0):** el día "mudo" de v1.11.0 existía porque el cuadrito medía 13 px y el
  número no cabía. Al llegar a ~41 px la razón desaparece y el número es justo lo que permite
  verificar de un vistazo que lo marcado cayó en el día correcto — que es el bug que se corrigió.
- **Decisión (v1.17.0):** el selector de Hoy mapea a la **semana en curso**, no a "la ocurrencia
  más reciente de ese día". Tocar un día que aún no llega da una fecha futura; se permite (el dato
  es del usuario) pero la vista lo advierte en ámbar, y cuando el día es pasado lo dice en gris
  ("Estás completando el 05 de ago de 2026"). La cabecera de Hoy y la hoja de registro llevan ahora
  la fecha, para que nunca haya duda de dónde se está escribiendo.
- **Pendiente conocido (v1.17.0):** no se podía marcar un día de semanas anteriores. **Resuelto en
  v1.18.0.**
- **Versión:** 1.16.0 — **logo blanco** (el maestro `LOGO.png` cambió de rojo a blanco).
- v1.16.0 (identidad): el Señor Stick reemplazó el maestro `LOGO.png` (2000×2000) por la misma
  mancuerna de 3 discos por lado pero en **blanco `#ffffff`** sobre `#1e1f1f`. La geometría es
  idéntica a la que ya estaba medida en `tools/gen-icons.ps1` (discos de 79.5 px a ±293.5/±415/±535.5
  del centro, altos 262/390/518; barra 424×76), verificado píxel a píxel contra el archivo nuevo, así
  que **solo cambió el color**: `$RED` → `$FG` blanco en el script, `--brand:#9f1313` → `#ffffff` en
  `index.html`, y los cuatro PNG (512/192/180/64) regenerados con el script. Caché SW → `stickfit-v14`.
- **Decisión (v1.16.0):** el halo rojo de la placa de la portada (`#cover .mark-lg`,
  `0 0 34px rgba(159,19,19,.18)`) pasa a `rgba(255,255,255,.09)`. Era el último rastro del rojo: con
  la mancuerna blanca quedaba un aro rojizo alrededor del ícono que ya no correspondía a la marca.
- **Versión:** 1.15.0 — **zoom bloqueado también por pinch y doble toque en iPhone**.
- v1.15.0 (anti-zoom endurecido): el Señor Stick pidió que fuera **imposible** hacer zoom desde el
  iPhone, priorizando esta app y STICK AROS. El bloque de v1.14.0 solo cubría trackpad y teclado.
  Ahora la guardia vive en `document` (no en `window`) con `passive:false` y añade: `touchstart` y
  `touchmove` con **dos dedos** → `preventDefault` (el pinch real de iOS), y `touchend` doble en el
  **mismo punto** (<30px, <300ms) → `preventDefault` (doble toque para hacer zoom).
  Caché SW → `stickfit-v13`. Verificado con eventos sintéticos sobre el archivo real en Chrome
  headless: **12/12** — se cancelan pinch, doble toque, `gesture*` y Ctrl+rueda, y NO se cancelan el
  scroll de un dedo ni dos toques seguidos en puntos lejanos. Con puntero grueso emulado el input
  mide 16px; en escritorio sigue en 14px.
- **Decisión (v1.15.0):** el guardia de doble toque compara **posición además de tiempo**. Un guardia
  solo por tiempo (300ms) habría comido el segundo toque al marcar dos ejercicios seguidos en la
  vista Hoy — exactamente el problema de "toques que se comen" que ya se corrigió en AROS. Con el
  umbral de 30px, dos toques en filas distintas pasan intactos.
- v1.14.0 (anti-zoom): pedido del Señor Stick para toda la familia Stick — al tocar un campo, el
  iPhone hacía zoom y la app perdía el acabado de producto. Tres piezas: meta viewport con
  `maximum-scale=1.0, user-scalable=no`; `html{touch-action:manipulation;text-size-adjust:100%}`; y
  bajo `@media (pointer:coarse)` todos los `input/select/textarea` a `font-size:16px !important`.
- **Decisión (v1.14.0):** la pieza que realmente corrige el caso es la de **16px**, no el meta
  viewport: desde iOS 10 Safari **ignora** `maximum-scale`/`user-scalable`, y hace zoom automático al
  enfocar cualquier campo cuya fuente mida menos de 16px (los `.field` estaban en 14px). El meta se
  deja porque sí sirve en Android y en escritorio. El zoom por atajo de teclado (`Ctrl` + `+`/`-`)
  lo reserva el navegador y no siempre es anulable desde la página. Regla en `STICK_UI_SYSTEM.md`
  §6.6.1.
- v1.13.0 — **marcar un ejercicio ya no re-renderiza la vista Hoy**.
- v1.13.0 (marcado fluido): marcar el check llamaba a `renderHoy()`, que reconstruía el `innerHTML`
  entero. Efecto: la animación del check nunca se veía (el nodo nacía ya marcado, sin estado previo
  desde el cual animar), la entrada escalonada `list-stagger` se relanzaba en toda la lista y el
  scroll saltaba. Ahora el click toca solo lo que cambia (`setCheck` + `paintDayProgress`): la clase
  de la fila, el ancho de la barra (`#dayBar`), el porcentaje (`#dayPct`) y la píldora del día.
  "Reiniciar día" usa el mismo camino. Caché SW → `stickfit-v11`.
- v1.13.0 (animación): el visto entra con rebote corto (`cubic-bezier(.34,1.56,.64,1)`) y la casilla
  hace un `chkpop` del 116 %. El tachado del nombre pasa de `text-decoration:line-through` —que no es
  animable— a un degradado de fondo que crece de izquierda a derecha.
- **Decisión (v1.13.0):** el tachado usa `display:inline` + `box-decoration-break:clone` para que un
  nombre que ocupe dos líneas quede tachado en las dos; con `inline-block` o un `::after` absoluto
  habría salido una sola raya a media altura del bloque.
- **Decisión (v1.13.0):** desmarcar ahora **borra** la clave de `S.checks` en vez de guardar `false`.
  El calendario de asistencia ya filtraba por valor verdadero, así que no cambia nada de la lógica,
  pero deja de acumular basura en el respaldo exportado.
- **Pendiente conocido (v1.13.0):** guardar o eliminar un registro de peso desde la hoja sí sigue
  llamando a `renderHoy()`. Ahí cambia también el contenido del botón de la fila, y el re-render
  ocurre mientras la hoja se cierra, así que no se percibe como salto. Si molesta, hay que reconstruir
  el botón `.ex-log` en sitio.
- **Versión:** 1.12.0 — **tarjeta de Medidas plegable**.
- v1.12.0 (medidas plegables): la tarjeta de Medidas corporales llegaba a ~900 px y dominaba Progreso.
  Ahora arranca **cerrada**: solo el título, un resumen de una línea (`measureSummary()`) y el chevron.
  Al tocar la cabecera se despliega **todo** de una vez: diagrama, las 9 tarjetas de zona, la nota de
  próxima toma y los botones Historial/Todas, que bajaron de la cabecera al pie del contenido.
  Caché SW → `stickfit-v10`.
- **Decisión (v1.12.0):** el resumen de la cabecera cerrada **carga el aviso**: en ámbar cuando toca
  medirse ("Toca medirte · última 02 ago") o cuando no hay ninguna toma; en gris el estado normal
  ("Última: 02 ago · 6 de 9 zonas"). Sin esto, plegar la tarjeta habría escondido el recordatorio,
  que es justo lo que dispara el ciclo de medición.
- **Decisión (v1.12.0):** el despliegue se anima con `grid-template-rows: 0fr → 1fr` (clase `.fold-body`)
  en vez de un `max-height` con un número inventado: así llega a la altura real del contenido, que
  cambia según cuántas zonas haya registradas. El toggle se aplica **sobre el DOM ya pintado**
  (`classList.toggle`), no re-renderizando: si la clase llegara puesta desde el render, el navegador
  no tendría estado previo desde el cual animar y el despliegue sería un salto.
- **Decisión (v1.12.0):** `mzOpen` vive en memoria, no en `localStorage` — es preferencia de vista, no
  dato del usuario, y arrancar siempre plegado es el comportamiento predecible. Única excepción: el
  aviso de **Hoy** pone `mzOpen=true` antes de navegar, para que la tarjeta reciba abierta a quien
  llega desde el recordatorio.
- v1.11.0 — **medidas con diagrama corporal tocable** + calendario de asistencia compacto.
- v1.11.0 (medidas): las medidas pasan de 4 zonas genéricas a **9**: hombro, pecho, bíceps izq/der,
  cintura, muslo izq/der y pantorrilla izq/der. La tarjeta de Medidas muestra un **diagrama frontal
  tocable** (`bodyMeasureSVG`): la zona ya registrada se pinta en verde tenue y al tocarla se alumbra
  y abre la hoja de **esa** medida (consejo de cómo medirla, última toma con fecha, campo en cm,
  botón Quitar si ya hay dato de hoy). Debajo, 9 tarjetas con el valor y el cambio vs. la primera
  toma. Se conserva "Todas" (toma completa de las 9 zonas) e "Historial". Caché SW → `stickfit-v9`.
- v1.11.0 (recordatorio): la app dice **cuándo volver a medirse** según el ritmo de la meta de peso
  (`MEASURE_EVERY`): ±0.5 kg/sem → cada 2 semanas · ±0.25 → 3 semanas · mantener → 4 semanas · sin
  meta → 21 días. La nota en Progreso muestra la próxima fecha y el motivo; cuando ya toca (o si
  nunca se han tomado) aparece además un aviso ámbar en **Hoy** que lleva a Progreso.
- v1.11.0 (asistencia): los cuadritos del mes bajan a **13 px y pierden el número**, se quita la
  cabecera L-M-M-J-V-S-D y la leyenda se compacta; las flechas ‹ › quedan en la misma línea del mes.
  El detalle del día ahora sale al **tocar** el cuadrito (toast) o al pasar el cursor (`title`).
- **Decisión (v1.11.0):** las zonas pares se guardan **por lado** (`biceps_izq`/`biceps_der`, etc.),
  no promediadas: la asimetría entre brazos o piernas es justo lo que hay que vigilar y un promedio
  la escondería. Migración one-shot con la bandera `measureSchema:2` — `brazo` → `biceps_der` y
  `muslo` → `muslo_der` (una medida vieja se tomó de un solo lado; asumir el dominante pierde menos
  información que duplicarla a los dos).
- **Decisión (v1.11.0):** el diagrama es la **vista frontal de la persona**, así que su lado izquierdo
  se dibuja a la derecha de la pantalla (como al mirarla de frente). Los `<rect class="mzhit">`
  transparentes al final del SVG agrandan el área de toque: los músculos dibujados miden pocos
  píxeles en un celular.
- **Decisión (v1.11.0):** el recordatorio **no guarda nada nuevo**; se deriva de la fecha del último
  registro de `measures[]` y del `rate` de `weightGoal`. Misma razón que la asistencia: un estado
  aparte se desincronizaría al corregir o borrar un registro.
- **Versión:** 1.10.0 — **asistencia mensual** (calendario de cuadritos en Progreso).
- v1.10.0 (asistencia): primer bloque de **Progreso**. Calendario del mes con un cuadrito por día
  (semana de lunes a domingo), navegación ‹ › entre meses (el botón "siguiente" se deshabilita en el
  mes actual), leyenda y dos stats: **racha** y **sesiones del mes / días programados**. Estados del
  cuadrito: verde sólido = día completo · verde tenue = entrenó a medias · borde rosa = tocaba y no
  fue · gris = descanso según la rutina · atenuado = futuro · anillo blanco = hoy. Caché SW →
  `stickfit-v8`.
- **Decisión (v1.10.0):** la asistencia **no guarda datos nuevos**; se deriva de `checks` (cuya clave
  ya empieza por la fecha) y de `history[].date`. Un día cuenta como entrenado con marcar un ejercicio
  o registrar un peso, y como completo cuando los checks del día igualan los ejercicios de la rutina.
  Guardar un estado aparte habría duplicado la verdad y se desincronizaría al reiniciar un día.
- **Decisión (v1.10.0):** `currentStreak()` recorre hacia atrás **saltando los días de descanso** de la
  rutina, así que la racha cuenta sesiones consecutivas, no días de calendario. El día de hoy sin
  entrenar todavía no rompe la racha (`i>0` para cortar); si no, la racha se vería en 0 cada mañana.
- **Versión:** 1.9.0 — **registro por ejercicio, serie por serie, en libras**.
- v1.9.0 (registro): desaparece el botón único "Registrar pesos" del día. Cada fila de **Hoy** lleva su
  propio botón a la derecha ("+ Peso"); al tocarlo se abre la hoja de **ese** ejercicio con una fila por
  serie (pre-cargadas con el objetivo), botón "Añadir serie" hasta 12, historial completo del ejercicio
  serie por serie y "Eliminar registro de hoy". Guardar **marca el ejercicio como hecho**; si ya hay
  registro de hoy el botón muestra el rango de carga (`85-100 lb`) y nº de series, y la hoja **edita**
  esa entrada en vez de duplicarla. Las cargas pasan de **kg a lb**; el peso corporal y la nutrición
  siguen en kg (Mifflin-St Jeor y g/kg lo exigen). Caché SW → `stickfit-v7`.
- **Decisión (v1.9.0):** ninguna vista colapsa ya las series en un solo número. `setPills()` pinta cada
  serie tal como se registró (`S1 100 lb × 10 · S2 95 lb × 9 …`) en Hoy, en la ficha del ejercicio y en
  Progreso, con la mejor serie resaltada en verde. `weight`/`reps` de la entrada se conservan = mejor
  serie (1RM Epley) porque son lo que alimenta la progresión, pero dejan de ser lo que se muestra.
- **Decisión (v1.9.0):** migración de unidades one-shot con la bandera `liftUnit`. Al cargar, si no es
  `"lb"` se multiplica ×2.20462 todo `history[].weight` y `history[].sets[].weight` y se marca. Sin eso
  los registros viejos en kg se leerían como libras y la progresión daría saltos falsos. Incrementos de
  sobrecarga en `nextTargetObj()`: **5 lb** en barra/máquina/prensa, **2.5 lb** en el resto.
- v1.8.0 — **Protocolo Base revisado** (hombro corregido + acondicionamiento).
- v1.8.0 (rutina semilla): auditoría de la rutina contra el objetivo declarado (físico atlético magro).
  El hombro estaba en **7 series/semana**, por debajo de la banda mínima de 10, siendo el deltoides
  medio el músculo que define la silueta buscada. Correcciones: `elevaciones-laterales` 3×12-15 a
  **Torso A** y `face-pull` 3×15-20 a **Torso B** → hombro **7 → 13** series con frecuencia 2×,
  repartidas en dos días en vez de amontonadas en uno. Añadido `hiit-sprints` 6×(30 s / 90 s) al
  final de **Pierna B**, que era la única carencia frente a la alternativa evaluada: la rutina no
  tenía acondicionamiento y el % de grasa gobierna la mitad del resultado. Se mantiene el esquema de
  3 días de descanso (jue/sáb/dom) poniendo el HIIT el mismo día de fuerza, no en un día libre.
  Sesiones resultantes: Lun 25 · Mar 18 · Mié 23 · Vie 18 series (~65-90 min). `SEED_VERSION` → **3**.
  Caché SW → `stickfit-v6`.
- **Decisión (v1.8.0):** `ex()` acepta un 11.º parámetro `cardio`; `weeklyVolume()` **excluye** los
  ejercicios con `cardio:true`. Sin esto las 6 series de sprints sumaban al grupo Pierna (26 → 32) y
  la tarjeta de volumen pintaba "alto" un dato que no es volumen de hipertrofia — corrompía la única
  métrica que gobierna las decisiones de la rutina. El catálogo semilla pasa a **32 ejercicios**.
- **Pendiente conocido (v1.8.0):** Brazo (9) y Core (6) siguen bajo la banda 10-20 en Protocolo Base.
  Es un rasgo del diseño Torso/Pierna, no un error; corregirlo exige alargar las sesiones. No se tocó
  porque no formaba parte del encargo.
- v1.7.0 — **historial de peso y medidas** con corrección y borrado.
- v1.7.0 (historial): botón "Historial" en los bloques de Peso corporal y Medidas corporales (solo
  aparece si hay registros) que abre una hoja con la lista completa, más reciente arriba. Peso: fecha,
  valor y diferencia contra el registro anterior, con resumen (nº de registros, días transcurridos y
  cambio total). Medidas: chips por zona con el valor y su diferencia contra la medida anterior **de
  esa misma zona** (no contra el registro anterior, que puede no incluirla). Cada fila permite
  **corregir** (hoja en `overlay2`) o **eliminar** (`confirmSheet`). Helpers nuevos `fechaCorta`/
  `fechaLarga` (parten el string ISO; `new Date()` interpreta medianoche UTC y en Colombia mostraría
  el día anterior). Clase `.card-head` para que en pantallas angostas los botones bajen a su línea en
  vez de partir el título. Caché SW → `stickfit-v5`.
- **Decisión (v1.7.0):** al corregir o borrar un registro de peso, `syncGoalStart()` recalcula
  `weightGoal.startKg`/`startDate` desde el registro más antiguo que quede. Sin eso, la proyección de
  "esperado hoy" seguiría anclada a un dato borrado. No se toca en el registro normal del día.
- v1.6.1 — dock alineado al `STICK_UI_SYSTEM.md` §4.5 y scrim de modales al §4.7.
- v1.6.1 (auditoría UI): el dock mostraba las 5 etiquetas a la vez (9 px mayúsculas, "Nutrición" se
  cortaba). Ahora sigue el **TabBar canónico**: solo la pestaña activa lleva label en píldora
  (`rgba(255,255,255,.10)` + borde `/10`), las demás quedan solo con ícono; geometría exacta del
  sistema (alto 62 px, ancho 92 % / máx. 384 px, `bottom` 20 px + safe-area, ícono 19 px con
  `stroke-width` 1.75 → 2 al activarse, label 11 px). Scrim de `.overlay`: `rgba(4,5,9,.72)`+blur 6
  → `rgba(0,0,0,.8)`+blur 4 (§4.7). Verificado en vivo: 5 vistas OK, 1 sola etiqueta visible,
  dock 384×62 centrado, sin scroll horizontal, sin errores de consola.
- **Versión:** 1.6.0 — **identidad visual del logo aplicada** (mancuerna roja sobre grafito).
- v1.6.0 (identidad): logo oficial = mancuerna de 3 discos por lado, rojo `#9f1313` sobre `#1e1f1f`.
  Maestro en `logo.png` (2000×2000, antes "LOGOS APPS.png"). Íconos PNG **regenerados vectorialmente**
  a cada tamaño (512/192/180/64) con el script de dibujo, no por reescalado. La marca dentro de la app
  (portada y header) se rehízo como SVG fiel al logo, con token CSS `--brand:#9f1313`; ocupa ~62 % de
  la placa, igual proporción que el ícono. Añadidos meta `og:`/`twitter:` para el enlace compartido.
  Caché SW → `stickfit-v4`. El resto de la paleta sigue siendo zinc dark-first con CTA blanco.
- v1.5.1 — QA final integral en vivo (22/22), sin errores de consola ni recursos fallidos.
- v1.5.1 (pulido de cierre): eliminado código muerto (`lastLog`); Medidas muestra "primer registro"
  en el primer dato; gramática del aviso corregida ("1 ejercicio registrado"). Caché SW → `stickfit-v3`.
- v1.5.0 (Tier 2): **registro set por set** en "Registrar pesos" — una fila por serie (según `item.sets`),
  pre-cargadas con el objetivo sugerido. Entrada de historial ahora lleva `sets:[{weight,reps}]` y
  `weight`/`reps` = **mejor serie** (mayor 1RM Epley), que alimenta tendencia/progresión. Backward
  compatible con entradas viejas (sin `sets`).
- v1.4.0 (Tier 2 + pulido): **Hojas del sistema** en vez de `prompt()`/`confirm()` nativos
  (`promptSheet`/`confirmSheet` sobre `#overlay2`). **Medidas corporales** en Progreso (cintura/pecho/
  brazo/muslo con tendencia; `S.measures[]`). **Volumen semanal por grupo muscular** (series/grupo de
  la rutina activa, con banda 10-20 y color ámbar/verde/azul).
- v1.3.2: **fix** — el constructor de rutinas no permitía añadir ejercicios a un día porque el selector
  (`pickExercise`) reutilizaba el mismo overlay y destruía el editor. Solución: **segundo overlay
  apilado** (`#overlay2`/`#sheet2` + `openSheet2`/`closeSheet2`). Detectado por la suite de QA.
- v1.3.1: **Temporizador eliminado por completo** a pedido del Señor Stick (descanso automático al
  marcar, FAB, modal, CSS y funciones). Se conserva la vibración breve al marcar. No reintroducir.
- **Deploy:** GitHub Pages, repo público `ZafiroSad/STICK-FIT` → https://zafirosad.github.io/STICK-FIT/
  (2026-08-01). Actualizar = commit + push a `main`; Pages redepliega solo. Repo git independiente
  (no confundir con el repo del home). Datos personales NO viven en el repo (solo localStorage).
- v1.3.0 (Tier 1 de mejoras): **PWA real** (`manifest.json` + `service-worker.js` network-first +
  íconos PNG 192/512/180/48) → instalable con ícono y offline. **Timer integrado**: al marcar un
  ejercicio auto-inicia el descanso con duración por ejercicio (≤8 reps 180 s · ≤12 90 s · resto 60 s)
  + vibración. **Progresión conectada**: Hoy muestra "objetivo X kg × Y" según la última sesión y
  pre-carga ese valor en "Registrar pesos". Fix: `fmt()` del timer (redondeo min/seg).
- v1.2.1: **Respaldo de datos** (Exportar/Importar JSON) en Progreso, para no perder el avance.
- v1.2.0: nueva pestaña **Progreso** (meta de peso corporal con tendencia y estimación de si vas en
  línea/adelantado/atrasado según el ritmo del objetivo; fuerza por ejercicio con sparkline, 1RM
  estimado por Epley y próximo objetivo por sobrecarga progresiva). Nutrición ahora genera **3 días
  de comidas** de ejemplo escalados a las kcal objetivo.
- v1.1.0: Protocolo Base con Jueves de descanso; diagramas musculares rediseñados. Migración `seedVersion`.
- Las 5 vistas, la ficha muscular, el registro de pesos, el progreso y la nutrición funcionan.

## Arquitectura
- **Un solo archivo** `index.html` autónomo (HTML + CSS + JS vanilla). Sin build, sin dependencias.
- `tools/gen-icons.ps1`: regenera los cuatro PNG de ícono dibujando el logo vectorialmente
  (PowerShell + System.Drawing) a partir de la geometría medida de `LOGO.png`. Ejecutar solo si
  cambia el logo; no forma parte de la app. Si cambia la **forma** (no solo el color) hay que volver
  a medir el maestro y actualizar las constantes del script.
- Persistencia en **`localStorage`** bajo la clave `stickfit-v1`.
- Se abre directo en el navegador del celular (doble click al archivo, o servir por HTTP).
- Lenguaje visual: **sistema STICK** replicado en CSS puro (dark-first zinc, sin emojis, CTA blanco,
  mono para valores, tarjetas blur, dock inferior). Tipografía: stack Century Gothic (variante AROS).
- **Identidad:** logo mancuerna **blanco** `--brand:#ffffff` sobre placa grafito (desde v1.16.0; antes
  rojo `#9f1313`). Maestro: `LOGO.png` en la raíz. La marca no aporta color propio: los datos y las
  acciones siguen en zinc/emerald/amber/sky.

## Estructura funcional
- **Portada** → botón "Entrenar hoy" (flag `onboarded`).
- **Dock (5 vistas):** Hoy · Progreso · Rutinas · Ejercicios · Nutrición.
- **Progreso:** asistencia del mes (calendario a todo el ancho con el número de día, flechas ‹ ›,
  racha, % de cumplimiento; tocar un día lo abre en Hoy para completarlo)
  + peso corporal (meta con ritmo, barra inicio→meta, sparkline, "esperado hoy" vs real,
  **historial** con corrección y borrado)
  + medidas corporales (**tarjeta plegable**: cerrada muestra solo el resumen; abierta, diagrama
  tocable de 9 zonas + recordatorio de próxima toma + Historial/Todas) + fuerza por ejercicio (sparkline,
  1RM Epley, próximo objetivo) + volumen semanal por grupo muscular (series/grupo de la rutina activa,
  banda 10-20) + respaldo Exportar/Importar. Datos: `weightLog[]`, `weightGoal`, `measures[]`.
- **Hoy:** barra de semana (‹ › + "Hoy" para volver, `weekOffset`), selector de día con la fecha
  (`LUN 27`), checklist del día activo, barra de progreso y, **por ejercicio**, su
  propio botón de registro (hoja con una fila por serie en **lb**, pre-cargadas con el objetivo).
  Los checks se guardan por fecha (`checks[fecha|dia|idx]`), y esa `fecha` es la del **día y la semana
  que se estén viendo** (`dateOfDay(dayId,weekOffset)`), no la de hoy: marcar ayer queda en ayer.
- **Rutinas:** lista de planes; crear / renombrar / duplicar / activar / eliminar. Editor por día
  (enfoque, descanso, añadir/quitar ejercicios del catálogo, series/reps).
- **Ejercicios:** catálogo de 31 ejercicios de fuerza agrupados por músculo. Ficha al click con
  diagrama SVG frente/espalda (resalta músculos), ejecución, errores, tips, campo URL de imagen.
  Botón "Crear" para ejercicios propios.
- **Nutrición:** Mifflin-St Jeor → TDEE (factor de actividad) → objetivo (recomp / superávit magro /
  déficit) → kcal + macros (proteína 2 g/kg, grasa 25%, carbos resto) + agua (35 ml/kg). Guarda perfil.

## Modelo de datos
- `rutina` = plan semanal completo (7 días). Varias guardadas, una activa (`activeRoutineId`).
- Rutina semilla: **Protocolo Base**, split Torso/Pierna ×2 (Lun Torso A · Mar Pierna A · Mié Torso B
  · Vie Pierna B; Jue/Sáb/Dom descanso). Cambiar la semilla exige subir `SEED_VERSION` en el código.
- Ejercicio: `{id,name,group,muscles,sets,reps,eq,steps,errors,tips,cardio}`. `cardio:true` marca
  acondicionamiento (solo `hiit-sprints`): cuenta como ejercicio del día pero **no** suma en
  `weeklyVolume()`.
- `history[]`: registros {date, exId, weight, reps, sets:[{weight,reps}]} en **lb**. `sets[]` es la
  verdad (cada serie tal cual se hizo) y es lo que se muestra; `weight`/`reps` = mejor serie por Epley,
  se usan solo para la progresión. Una entrada por ejercicio y día: volver a guardar la edita.
- `liftUnit`: bandera de la migración kg→lb del historial de fuerza. El peso corporal (`weightLog`,
  `weightGoal`) y la nutrición siguen en kg; las medidas en cm.
- `measures[]`: un registro por día `{date, hombro, pecho, biceps_izq, biceps_der, cintura,
  muslo_izq, muslo_der, pantorrilla_izq, pantorrilla_der}` en **cm**; cada zona es opcional.
  `measureSchema`: bandera de la migración de las 4 zonas viejas a las 9 por lado.

## Decisiones tomadas (no re-litigar sin discusión)
1. Un solo HTML + localStorage (no React/Vite) — elegido por portabilidad.
2. Navegación por dock inferior (5 secciones: Hoy · Progreso · Rutinas · Ejercicios · Nutrición).
3. Ficha de ejercicio con diagrama SVG + técnica (no fotos incrustadas por peso; URL opcional).
4. Rutina = plan semanal completo.
5. Nutrición completa (kcal + macros + agua).
6. Split 4 días Torso/Pierna.
7. Entrada: mini-portada + dashboard.
8. Nombre: STICK FIT.
9. Tipografía: Century Gothic (variante AROS).
10. Progreso: checklist + registro de peso/reps con historial.

## Completado
- **Tier 1:** PWA real (instalable, offline, ícono propio), progresión conectada al día. (El timer
  integrado se construyó y luego se retiró a pedido del Señor Stick.)
- **Tier 2:** medidas corporales, volumen semanal por grupo muscular, registro set por set.
- **Deploy:** GitHub Pages + repo git independiente `ZafiroSad/STICK-FIT`.

## Pendientes / ideas futuras (Tier 3, opcional)
- Plan de comidas con kcal reales por alimento y porciones escaladas.
- Reordenar ejercicios en el constructor.
- Nutrición: Katch-McArdle (si conoce % grasa) y semana de descarga (deload).
- Ampliar catálogo de ejercicios si el Señor Stick lo pide.
