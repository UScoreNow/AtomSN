import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/ax_semantic_colors.dart';
import 'ax_theme.dart';
import 'ax_theme_extension.dart';
import 'presets/newsprint_preset.dart';

/// Raiz de aplicacion de `atomic_ui`.
///
/// Envuelve `ShadApp` con el tema (por defecto, el preset "newsprint") e inyecta
/// el [AxThemeScope] con los colores semanticos del modo activo, de modo que
/// `AxTheme.of(context)` funcione en todo el arbol.
///
/// Para escenarios con `Router`/`go_router`, usa `ShadApp.router` directamente y
/// envuelve tu arbol con [AxThemeScope] (o reutiliza [AxThemeScopeBuilder]).
class AxApp extends StatelessWidget {
  const AxApp({
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
    this.lightColors = AxNewsprint.light,
    this.darkColors = AxNewsprint.dark,
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

  /// Colores del modo claro. Por defecto, "newsprint" Paper.
  final AxSemanticColors lightColors;

  /// Colores del modo oscuro. Por defecto, "newsprint" Night Press.
  final AxSemanticColors darkColors;

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
      theme: AxTheme.buildTheme(lightColors),
      darkTheme: AxTheme.buildTheme(darkColors),
      builder: (context, child) => AxThemeScopeBuilder(
        lightColors: lightColors,
        darkColors: darkColors,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

/// Resuelve el modo activo desde el `ShadTheme` ancestro y publica el
/// [AxThemeScope] correspondiente. Util como `builder` bajo cualquier `ShadApp`.
class AxThemeScopeBuilder extends StatelessWidget {
  const AxThemeScopeBuilder({
    super.key,
    required this.child,
    this.lightColors = AxNewsprint.light,
    this.darkColors = AxNewsprint.dark,
  });

  final Widget child;
  final AxSemanticColors lightColors;
  final AxSemanticColors darkColors;

  @override
  Widget build(BuildContext context) {
    final brightness = ShadTheme.of(context).brightness;
    final colors = brightness == Brightness.dark ? darkColors : lightColors;
    return AxThemeScope(colors: colors, child: child);
  }
}
