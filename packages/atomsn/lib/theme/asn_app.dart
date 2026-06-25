import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/asn_semantic_colors.dart';
import 'asn_theme.dart';
import 'asn_theme_extension.dart';
import 'presets/atomsn_preset.dart';

/// Application root of `AtomSN`.
///
/// Wraps `ShadApp` with the theme (by default, the AtomSN preset) and injects
/// the [AsnThemeScope] with the semantic colors of the active mode, so that
/// `AsnTheme.of(context)` works across the whole tree.
///
/// For `Router`/`go_router` scenarios, use `ShadApp.router` directly and
/// wrap your tree with [AsnThemeScope] (or reuse [AsnThemeScopeBuilder]).
class AsnApp extends StatelessWidget {
  const AsnApp({
    super.key,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.navigatorKey,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.title = '',
    this.themeMode,
    this.debugShowCheckedModeBanner = false,
    this.lightColors = AsnColors.light,
    this.darkColors = AsnColors.dark,
  });

  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver> navigatorObservers;
  final String title;
  final ThemeMode? themeMode;
  final bool debugShowCheckedModeBanner;

  /// Light mode colors. By default, AtomSN Light.
  final AsnSemanticColors lightColors;

  /// Dark mode colors. By default, AtomSN Dark.
  final AsnSemanticColors darkColors;

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: title,
      navigatorKey: navigatorKey,
      navigatorObservers: navigatorObservers,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      home: home,
      routes: routes,
      themeMode: themeMode,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      theme: AsnTheme.buildTheme(lightColors),
      darkTheme: AsnTheme.buildTheme(darkColors),
      builder: (context, child) => AsnThemeScopeBuilder(
        lightColors: lightColors,
        darkColors: darkColors,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

/// Resolves the active mode from the ancestor `ShadTheme` and publishes the
/// corresponding [AsnThemeScope]. Useful as a `builder` under any `ShadApp`.
class AsnThemeScopeBuilder extends StatelessWidget {
  const AsnThemeScopeBuilder({
    super.key,
    required this.child,
    this.lightColors = AsnColors.light,
    this.darkColors = AsnColors.dark,
  });

  final Widget child;
  final AsnSemanticColors lightColors;
  final AsnSemanticColors darkColors;

  @override
  Widget build(BuildContext context) {
    final brightness = ShadTheme.of(context).brightness;
    final colors = brightness == Brightness.dark ? darkColors : lightColors;
    return AsnThemeScope(colors: colors, child: child);
  }
}
