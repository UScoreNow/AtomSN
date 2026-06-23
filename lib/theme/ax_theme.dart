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
  /// Offset (hueco) entre el borde del elemento y su anillo de foco.
  static const double _focusOffset = 4;

  /// Construye el `ShadThemeData` de shadcn_ui a partir de [colors].
  static ShadThemeData buildTheme(AxSemanticColors colors) {
    final ring = colors.actionPrimary;

    // Anillo de foco concentrico con la esquina del elemento:
    // R_anillo = R_elemento + offset. shadcn usa por defecto radio*1.5, lo que
    // descuadra las esquinas (sobre todo cuando el elemento tiene radio pequeno).
    ShadBorder focusRing(double childRadius) => ShadBorder.all(
      width: 2,
      color: ring,
      radius: AxRadius.brConcentric(childRadius, _focusOffset),
      offset: _focusOffset,
    );

    return ShadThemeData(
      colorScheme: AxColorScheme.fromSemantic(colors),
      brightness: colors.brightness,
      radius: AxRadius.brMd,
      textTheme: AxTextTheme.build(),
      // Anillo global para elementos de radio md (inputs, select, textarea,
      // botones).
      decoration: ShadDecoration(
        secondaryFocusedBorder: focusRing(AxRadius.md),
      ),
      // Cada pestana usa radio xs (4); su anillo debe ser 4 + offset, no el
      // global (que descuadraba las esquinas).
      tabsTheme: ShadTabsTheme(
        tabDecoration: ShadDecoration(
          secondaryFocusedBorder: focusRing(AxRadius.xs),
        ),
      ),
      // El menubar desactiva el anillo secundario por defecto; lo habilitamos
      // con radio concentrico para que el foco siga la esquina del boton.
      menubarTheme: ShadMenubarTheme(
        buttonDecoration: ShadDecoration(
          disableSecondaryBorder: false,
          secondaryFocusedBorder: focusRing(AxRadius.md),
        ),
      ),
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
