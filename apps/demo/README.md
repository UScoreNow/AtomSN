# AtomSN — demo

App de demostracion de [`atomsn`](../../packages/atomsn): muestra todos los
componentes (atoms, molecules, organisms, templates) en vivo, con toggle de tema
light ("Paper") / dark ("Night Press").

**Demo en vivo:** https://uscorenow.github.io/atom-sn/

> El sitio se compila y publica automaticamente en GitHub Pages mediante el
> workflow `.github/workflows/pages.yml` en cada push a `main`. No hay despliegue
> manual ni repo de salida aparte.

## Ejecutar

```bash
flutter pub get
flutter run -d chrome   # o -d linux
```

La dependencia `atomsn` se resuelve por `path` desde `packages/atomsn` dentro del
mismo monorepo: no hay bumps de version git, los cambios en la libreria se ven al
instante.

## Estructura

- `lib/main.dart`: `AsnApp` + navegacion por secciones + toggle de tema.
- `lib/screens/`: una pantalla por capa de atomic design.
- `lib/widgets/demo_block.dart`: helpers de presentacion (`DemoBlock`, `DemoScreen`).
