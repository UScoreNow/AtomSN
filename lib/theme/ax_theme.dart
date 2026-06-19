import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/ax_semantic_colors.dart';
import '../foundations/radius/ax_radius.dart';
import 'ax_color_scheme.dart';
import 'ax_text_theme.dart';
import 'ax_theme_extension.dart';

/// Punto de acceso al tema de `atomic_ui`.
///
/// - [buildTheme] construye el `ShadThemeData` que consume `ShadApp`.
/// - [of] devuelve los [AxSemanticColors] activos (roles editoriales completos),
///   util para componentes propios que necesitan colores fuera de
///   `ShadColorScheme`.
abstract final class AxTheme {
  /// Construye el `ShadThemeData` de shadcn_ui a partir de [colors].
  static ShadThemeData buildTheme(AxSemanticColors colors) {
    return ShadThemeData(
      colorScheme: AxColorScheme.fromSemantic(colors),
      brightness: colors.brightness,
      radius: AxRadius.brMd,
      textTheme: AxTextTheme.build(),
    );
  }

  /// Colores semanticos activos. Requiere un [AxThemeScope] ancestro
  /// (lo inyecta `AxApp`).
  static AxSemanticColors of(BuildContext context) {
    final colors = AxThemeScope.maybeOf(context);
    assert(
      colors != null,
      'No se encontro un AxThemeScope. Envuelve la app en AxApp o coloca un '
      'AxThemeScope bajo tu ShadApp.',
    );
    return colors!;
  }

  /// Igual que [of] pero devuelve null si no hay scope.
  static AxSemanticColors? maybeOf(BuildContext context) =>
      AxThemeScope.maybeOf(context);
}
