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
- **Versión:** 1.8.0 — **Protocolo Base revisado** (hombro corregido + acondicionamiento).
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
  (PowerShell + System.Drawing). Ejecutar solo si cambia el logo; no forma parte de la app.
- Persistencia en **`localStorage`** bajo la clave `stickfit-v1`.
- Se abre directo en el navegador del celular (doble click al archivo, o servir por HTTP).
- Lenguaje visual: **sistema STICK** replicado en CSS puro (dark-first zinc, sin emojis, CTA blanco,
  mono para valores, tarjetas blur, dock inferior). Tipografía: stack Century Gothic (variante AROS).
- **Identidad:** logo mancuerna rojo `--brand:#9f1313`. El rojo se reserva a la marca (portada, header,
  íconos); no se usa como color de datos ni de acciones — eso sigue en zinc/emerald/amber/sky.

## Estructura funcional
- **Portada** → botón "Entrenar hoy" (flag `onboarded`).
- **Dock (5 vistas):** Hoy · Progreso · Rutinas · Ejercicios · Nutrición.
- **Progreso:** peso corporal (meta con ritmo, barra inicio→meta, sparkline, "esperado hoy" vs real,
  **historial** con corrección y borrado)
  + medidas corporales (cintura/pecho/brazo/muslo con tendencia e **historial**) + fuerza por ejercicio (sparkline,
  1RM Epley, próximo objetivo) + volumen semanal por grupo muscular (series/grupo de la rutina activa,
  banda 10-20) + respaldo Exportar/Importar. Datos: `weightLog[]`, `weightGoal`, `measures[]`.
- **Hoy:** selector de semana, checklist del día activo, barra de progreso, botón "Registrar pesos"
  (registro **set por set**: una fila por serie, pre-cargadas con el objetivo). Los checks se guardan
  por fecha (`checks[fecha|dia|idx]`).
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
- `history[]`: registros {date, exId, weight, reps, sets:[{weight,reps}]} (weight/reps = mejor serie).

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
