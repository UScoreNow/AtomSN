# AtomSN

Design system de Flutter brand-neutral y themeable, organizado por **atomic
design** + **clean architecture** sobre [`shadcn_ui`](https://pub.dev/packages/shadcn_ui),
con el tema editorial **newsprint** por defecto.

**Demo en vivo:** https://uscorenow.github.io/AtomSN/

## Estructura (monorepo)

```
packages/atomsn/   # la libreria (import 'package:atomsn/atomsn.dart')
apps/demo/         # app showcase de todos los componentes, se publica en Pages
.github/workflows/ # ci.yml (analyzer) + pages.yml (deploy a Pages) + release.yml
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

## Flujo de trabajo

`main` y `dev` son ramas permanentes y protegidas; todo entra por PR con CI en
verde. El detalle del modelo de ramas esta en [CONTRIBUTING.md](CONTRIBUTING.md):

- `main`: estable / produccion. Fuente de las Releases.
- `dev`: integracion. **Despliega a GitHub Pages.**
- Trabajo: `feature/…`, `fix/…`, `refactor/…`, `update/…` -> PR a `dev`.
- Promocion: PR `dev -> main`; al mergear se publica una Release.

## Despliegue

Cada push a `dev` dispara `.github/workflows/pages.yml`, que compila `apps/demo`
a web y la publica en GitHub Pages. Cada merge a `main` dispara `release.yml`,
que crea la Release a partir de la version en `packages/atomsn/pubspec.yaml`.
