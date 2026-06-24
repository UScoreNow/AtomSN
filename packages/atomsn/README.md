# AtomSN

Biblioteca de componentes Flutter brand-neutral y themeable, organizada por
**atomic design** + **clean architecture**. Envuelve el catalogo de
[`shadcn_ui`](https://pub.dev/packages/shadcn_ui) e incluye el tema editorial
**newsprint** como preset por defecto.

- **Fuente principal:** `shadcn_ui` (unica dependencia de UI).
- **Gaps:** los componentes que `shadcn_ui` no ofrece se construyen como widgets
  propios sobre el mismo tema, tomando como referencia el diseno de
  [`shadcn_flutter`](https://pub.dev/packages/shadcn_flutter) (sin depender de el).

## Arquitectura

Capas con regla de dependencia hacia dentro (`foundations <- theme <- components`):

```
lib/
├── foundations/   # capa 0, brand-agnostic: color, tipografia, spacing, radius, border
├── theme/         # capa 1: ShadThemeData + AsnThemeScope + preset newsprint + AsnApp
└── components/    # capa 2: atoms / molecules / organisms / templates
```

- Los componentes son **stateless y controlados** (`value` + `onChanged`), sin
  logica de negocio ni dependencias de state-management.
- La API publica nunca expone tipos `Shad*`: cada componente define sus propios
  enums/modelos `Ax*`.
- `ShadColorScheme` no cubre todos los roles editoriales (warning, link, success,
  highlightMark, borderSection...); esos viajan por `AsnThemeScope` y se leen con
  `AsnTheme.of(context)`.

## Instalacion

Forma parte del monorepo [`UScoreNow/atom-sn`](https://github.com/UScoreNow/atom-sn).
Dentro del monorepo, las apps la consumen por `path`:

```yaml
dependencies:
  atomsn:
    path: ../../packages/atomsn
```

Desde un repo externo, anade la dependencia git apuntando al monorepo:

```yaml
dependencies:
  atomsn:
    git:
      url: https://github.com/UScoreNow/atom-sn.git
      path: packages/atomsn
      ref: main
```

## Uso

```dart
import 'package:atomsn/atomsn.dart';
import 'package:flutter/material.dart' show ThemeMode;

void main() => runApp(
  AsnApp(
    themeMode: ThemeMode.system, // por defecto: preset "newsprint" light/dark
    home: const Home(),
  ),
);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Container(
      color: colors.bgBase,
      child: AsnButton(
        onPressed: () {},
        child: const Text('Hola'),
      ),
    );
  }
}
```

Para `Router`/`go_router`, usa `ShadApp.router` y envuelve el arbol con
`AsnThemeScopeBuilder` (publica el `AsnThemeScope` segun el modo activo).

### Tema propio

`AsnApp` acepta `lightColors`/`darkColors` (`AsnSemanticColors`). Construye los
tuyos para re-skinear la biblioteca sin tocar los componentes:

```dart
AsnApp(
  lightColors: AsnNewsprint.light.copyWith(actionPrimary: const Color(0xFF1E66F5)),
  home: const Home(),
);
```

## Catalogo

- **Atoms:** Button, IconButton, Badge, Checkbox, Switch, Input, Textarea,
  InputOTP, Slider, Progress, Separator, Avatar, Tooltip + Skeleton, Toggle,
  StarRating, NumberTicker, CodeSnippet (propios).
- **Molecules:** Select, Alert, Card, Accordion, Tabs, Breadcrumb, DatePicker,
  TimePicker, Popover, FormField + ChipInput, PhoneInput, AvatarGroup,
  Pagination, Collapsible, ColorPicker, Tracker, HoverCard (propios).
- **Organisms:** Dialog, Sheet, ContextMenu, Menubar, Table, Calendar,
  Resizable, Toast + Stepper, Steps, Timeline, Tree, NavigationMenu, Command,
  Carousel, DataTable, Drawer (propios).
- **Templates:** PageScaffold, DashboardLayout, AuthLayout.

## Demo

La app de demostracion (todos los componentes en vivo, con toggle light/dark)
vive en este mismo monorepo, en `apps/demo`, y se publica en
https://uscorenow.github.io/atom-sn/.

## Notas

- Tipografia de **una sola familia**: `ElmsSans` (variable, minimalista),
  empaquetada como asset bajo licencia OFL. La jerarquia de titulares se logra
  con tamano y peso, sin segunda familia ni descargas en runtime.
