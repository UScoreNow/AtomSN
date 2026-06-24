import 'package:flutter/widgets.dart';

import '../foundations/color/asn_semantic_colors.dart';

/// InheritedWidget que transporta los [AsnSemanticColors] activos por el arbol.
///
/// `ShadColorScheme` de shadcn_ui no cubre todos los roles editoriales
/// (warning, link, success, highlightMark, borderSection, bgRaised,
/// textSecondary...). Este scope los hace accesibles a los componentes via
/// [AsnTheme.of]. Lo inyecta [AsnApp]; tambien puede colocarse manualmente bajo
/// cualquier `ShadApp` con [AsnThemeScope].
class AsnThemeScope extends InheritedWidget {
  const AsnThemeScope({super.key, required this.colors, required super.child});

  /// Roles semanticos resueltos para el modo (light/dark) activo.
  final AsnSemanticColors colors;

  static AsnSemanticColors? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AsnThemeScope>()?.colors;
  }

  @override
  bool updateShouldNotify(AsnThemeScope oldWidget) => colors != oldWidget.colors;
}
