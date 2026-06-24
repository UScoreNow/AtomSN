import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/asn_semantic_colors.dart';
import '../foundations/radius/asn_radius.dart';
import 'asn_color_scheme.dart';
import 'asn_text_theme.dart';
import 'asn_theme_extension.dart';

/// Punto de acceso al tema de `AtomSN`.
///
/// - [buildTheme] construye el `ShadThemeData` que consume `ShadApp`.
/// - [of] devuelve los [AsnSemanticColors] activos (roles editoriales completos),
///   util para componentes propios que necesitan colores fuera de
///   `ShadColorScheme`.
abstract final class AsnTheme {
  /// Offset (hueco) entre el borde del elemento y su anillo de foco.
  static const double _focusOffset = 4;

  /// Construye el `ShadThemeData` de shadcn_ui a partir de [colors].
  static ShadThemeData buildTheme(AsnSemanticColors colors) {
    final ring = colors.actionPrimary;

    // Anillo de foco concentrico con la esquina del elemento:
    // R_anillo = R_elemento + offset. shadcn usa por defecto radio*1.5, lo que
    // descuadra las esquinas (sobre todo cuando el elemento tiene radio pequeno).
    ShadBorder focusRing(double childRadius) => ShadBorder.all(
      width: 2,
      color: ring,
      radius: AsnRadius.brConcentric(childRadius, _focusOffset),
      offset: _focusOffset,
    );

    return ShadThemeData(
      colorScheme: AsnColorScheme.fromSemantic(colors),
      brightness: colors.brightness,
      radius: AsnRadius.brMd,
      textTheme: AsnTextTheme.build(),
      // Anillo global para elementos de radio md (inputs, select, textarea,
      // botones).
      decoration: ShadDecoration(
        secondaryFocusedBorder: focusRing(AsnRadius.md),
      ),
      // La pestana activa usa radio sm (8) para quedar concentrica dentro del
      // track (radio md); el anillo de foco va a 8 + offset.
      tabsTheme: ShadTabsTheme(
        tabDecoration: ShadDecoration(
          border: ShadBorder.all(radius: AsnRadius.brSm, width: 0),
          secondaryFocusedBorder: focusRing(AsnRadius.sm),
        ),
      ),
      // El boton de menu activo usa radio sm (8) para sus esquinas; ademas
      // habilitamos el anillo de foco concentrico (shadcn lo desactiva).
      menubarTheme: ShadMenubarTheme(
        buttonDecoration: ShadDecoration(
          disableSecondaryBorder: false,
          border: ShadBorder.all(radius: AsnRadius.brSm, width: 0),
          secondaryFocusedBorder: focusRing(AsnRadius.sm),
        ),
      ),
    );
  }

  /// Colores semanticos activos. Requiere un [AsnThemeScope] ancestro
  /// (lo inyecta `AsnApp`).
  static AsnSemanticColors of(BuildContext context) {
    final colors = AsnThemeScope.maybeOf(context);
    assert(
      colors != null,
      'No se encontro un AsnThemeScope. Envuelve la app en AsnApp o coloca un '
      'AsnThemeScope bajo tu ShadApp.',
    );
    return colors!;
  }

  /// Igual que [of] pero devuelve null si no hay scope.
  static AsnSemanticColors? maybeOf(BuildContext context) =>
      AsnThemeScope.maybeOf(context);
}
