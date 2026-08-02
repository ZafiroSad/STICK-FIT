# STICK FIT — Bitácora del proyecto

## Descripción y objetivo
App personal de entrenamiento de **fuerza** para el Señor Stick. Objetivo: construir un físico
atlético y magro tipo Tom Holland mediante sobrecarga progresiva. Pensada para usarse **desde el
celular**. Reemplaza al viejo prototipo `rutina-tom-holland` (temática Spider-Man, descartada).

## Ubicación
`C:\Users\kevin\Documents\KEVIN\02. WORK\03. PROYECTOS PERSONALES\STICK FIT\` (movida desde Downloads
el 2026-08-01, junto a las demás apps de la familia Stick).

## Estado actual
- **Versión:** 1.3.0 — verificada en vivo (Chrome headless vía puppeteer-core), sin errores de consola.
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
- Las 5 vistas, la ficha muscular, el registro de pesos, el progreso, la nutrición y el timer funcionan.

## Arquitectura
- **Un solo archivo** `index.html` autónomo (HTML + CSS + JS vanilla). Sin build, sin dependencias.
- Persistencia en **`localStorage`** bajo la clave `stickfit-v1`.
- Se abre directo en el navegador del celular (doble click al archivo, o servir por HTTP).
- Lenguaje visual: **sistema STICK** replicado en CSS puro (dark-first zinc, sin emojis, CTA blanco,
  mono para valores, tarjetas blur, dock inferior). Tipografía: stack Century Gothic (variante AROS).

## Estructura funcional
- **Portada** → botón "Entrenar hoy" (flag `onboarded`).
- **Dock (5 vistas):** Hoy · Progreso · Rutinas · Ejercicios · Nutrición.
- **Progreso:** peso corporal (registro por día, meta con ritmo, barra inicio→meta, sparkline,
  "esperado hoy" vs real) + fuerza por ejercicio (desde `history`: sparkline, 1RM Epley, próximo
  objetivo). Datos: `weightLog[]` {date,kg} y `weightGoal` {target,rate,startKg,startDate}.
- **Hoy:** selector de semana, checklist del día activo, barra de progreso, botón "Registrar pesos",
  timer flotante. Los checks se guardan por fecha (`checks[fecha|dia|idx]`).
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
- `history[]`: registros {date, exId, weight, reps} para progresión.

## Decisiones tomadas (no re-litigar sin discusión)
1. Un solo HTML + localStorage (no React/Vite) — elegido por portabilidad.
2. Navegación por dock inferior de 4 secciones.
3. Ficha de ejercicio con diagrama SVG + técnica (no fotos incrustadas por peso; URL opcional).
4. Rutina = plan semanal completo.
5. Nutrición completa (kcal + macros + agua).
6. Split 4 días Torso/Pierna.
7. Entrada: mini-portada + dashboard.
8. Nombre: STICK FIT.
9. Tipografía: Century Gothic (variante AROS).
10. Progreso: checklist + registro de peso/reps con historial.

## Pendientes / ideas futuras
- Ampliar catálogo de ejercicios si el Señor Stick lo pide.
- Posible sección de método/filosofía reescrita sin Spider-Man (descartada en v1).
- Progresión visual (sparkline) en la ficha en vez de lista.
- Evaluar convertir a PWA instalable si más adelante quiere React/Vercel.
- Evaluar repositorio Git.
