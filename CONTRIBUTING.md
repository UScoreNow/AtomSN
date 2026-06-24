# Contribuir a AtomSN

Este es el estandar de trabajo del repo. Todo cambio entra por Pull Request con
CI en verde; no se hace push directo a `main` ni a `dev`.

## Modelo de ramas

| Rama        | Rol                                | Protegida | CI/CD                         |
|-------------|------------------------------------|-----------|-------------------------------|
| `main`      | Estable / produccion               | Si        | Fuente de Releases            |
| `dev`       | Integracion                        | Si        | Despliega a GitHub Pages      |
| `feature/*` | Funcionalidad nueva                | No        | PR a `dev`                    |
| `fix/*`     | Correccion de bug                  | No        | PR a `dev`                    |
| `refactor/*`| Refactor sin cambio de comportamiento | No     | PR a `dev`                    |
| `update/*`  | Dependencias, configuracion, chores | No       | PR a `dev`                    |

Las ramas de trabajo se nombran `tipo/nombre-descriptivo`, por ejemplo
`feature/date-picker` o `fix/newsprint-contrast`.

## Ciclo de vida de un cambio

1. Crea tu rama desde `dev`:
   ```bash
   git checkout dev && git pull
   git checkout -b feature/mi-cambio
   ```
2. Abre una **PR contra `dev`**. En la UI de GitHub, selecciona `dev` como base
   (el repo conserva `main` como rama por defecto, asi que la base por defecto
   propuesta es `main`: cambiala a `dev`).
3. El CI (`flutter analyze` en `packages/atomsn` y `apps/demo`) debe pasar para
   poder mergear. Al mergear a `dev` se despliega la demo a GitHub Pages.

## Publicar una Release (promocion `dev -> main`)

1. **Bumpea la version** en `packages/atomsn/pubspec.yaml` (semver). Este es el
   paso clave: el tag de la Release sale de ahi.
2. Abre una PR `dev -> main` y mergeala con CI en verde.
3. `release.yml` crea la Release `v<version>` con notas autogeneradas a partir de
   las PRs incluidas. Si el tag ya existe (olvidaste bumpear), la Release se
   omite sin fallar: bumpea en la siguiente promocion.

## Reglas de proteccion (`main` y `dev`)

- Obligatoria una PR antes de mergear (sin aprobaciones requeridas: puedes
  auto-mergear).
- El CI debe estar en verde y la rama al dia con su base.
- Sin push directo, sin force-push, sin borrado de la rama.
