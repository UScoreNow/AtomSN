# AtomSN

Design system de Flutter brand-neutral y themeable, organizado por **atomic
design** + **clean architecture** sobre [`shadcn_ui`](https://pub.dev/packages/shadcn_ui),
con el tema editorial **newsprint** por defecto.

**Demo en vivo:** https://uscorenow.github.io/AtomSN/

## Estructura (monorepo)

```
packages/atomsn/   # la libreria (import 'package:atomsn/atomsn.dart')
apps/demo/         # app showcase de todos los componentes, se publica en Pages
.github/workflows/ # ci.yml (analyzer) + pages.yml (build + deploy a GitHub Pages)
```

La demo consume la libreria por `path`, asi que cualquier cambio en
`packages/atomsn` se refleja al instante: no hay bumps de version ni repos de
salida aparte.

## Desarrollo

```bash
# Libreria
cd packages/atomsn && flutter pub get && flutter test

# Demo
cd apps/demo && flutter pub get && flutter run -d chrome
```

## Despliegue

Cada push a `main` dispara `.github/workflows/pages.yml`, que compila
`apps/demo` a web y la publica en GitHub Pages. Despliegue constante, sin pasos
manuales.
