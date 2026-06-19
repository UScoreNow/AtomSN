import 'package:flutter/widgets.dart';

import '../foundations/color/ax_semantic_colors.dart';

/// InheritedWidget que transporta los [AxSemanticColors] activos por el arbol.
///
/// `ShadColorScheme` de shadcn_ui no cubre todos los roles editoriales
/// (warning, link, success, highlightMark, borderSection, bgRaised,
/// textSecondary...). Este scope los hace accesibles a los componentes via
/// [AxTheme.of]. Lo inyecta [AxApp]; tambien puede colocarse manualmente bajo
/// cualquier `ShadApp` con [AxThemeScope].
class AxThemeScope extends InheritedWidget {
  const AxThemeScope({super.key, required this.colors, required super.child});

  /// Roles semanticos resueltos para el modo (light/dark) activo.
  final AxSemanticColors colors;

  static AxSemanticColors? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AxThemeScope>()?.colors;
  }

  @override
  bool updateShouldNotify(AxThemeScope oldWidget) => colors != oldWidget.colors;
}
