# atomic_ui_demo

App de demostracion de [`atomic_ui`](https://github.com/UScoreNow/atomic_ui): muestra
todos los componentes (atoms, molecules, organisms, templates) en vivo, con toggle
de tema light ("Paper") / dark ("Night Press").

**Demo en vivo:** https://uscorenow.github.io/atomic_ui_demo_web/

> Este repo es privado. El sitio publicado en GitHub Pages vive en un repo publico
> aparte que solo contiene el build compilado: `UScoreNow/atomic_ui_demo_web`.
> Para redesplegar tras cambios: `bash deploy_web.sh`.

## Ejecutar

```bash
flutter pub get
flutter run -d chrome   # o -d linux
```

La dependencia `atomic_ui` se resuelve via git desde el repo privado
`UScoreNow/atomic_ui`; necesitas acceso a la organizacion y `gh auth setup-git`
(o credenciales git) configurado.

## Estructura

- `lib/main.dart`: `AxApp` + navegacion por secciones + toggle de tema.
- `lib/screens/`: una pantalla por capa de atomic design.
- `lib/widgets/demo_block.dart`: helpers de presentacion (`DemoBlock`, `DemoScreen`).
