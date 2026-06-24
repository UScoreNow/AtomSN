import 'package:flutter/widgets.dart';

import '../foundations/color/asn_semantic_colors.dart';

/// InheritedWidget that carries the active [AsnSemanticColors] through the tree.
///
/// shadcn_ui's `ShadColorScheme` does not cover all editorial roles
/// (warning, link, success, highlightMark, borderSection, bgRaised,
/// textSecondary...). This scope makes them accessible to components via
/// [AsnTheme.of]. Injected by [AsnApp]; it can also be placed manually under
/// any `ShadApp` with [AsnThemeScope].
class AsnThemeScope extends InheritedWidget {
  const AsnThemeScope({super.key, required this.colors, required super.child});

  /// Semantic roles resolved for the active (light/dark) mode.
  final AsnSemanticColors colors;

  static AsnSemanticColors? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AsnThemeScope>()?.colors;
  }

  @override
  bool updateShouldNotify(AsnThemeScope oldWidget) => colors != oldWidget.colors;
}
