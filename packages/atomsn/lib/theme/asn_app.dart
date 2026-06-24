import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/asn_semantic_colors.dart';
import 'asn_theme.dart';
import 'asn_theme_extension.dart';
import 'presets/newsprint_preset.dart';

/// Raiz de aplicacion de `AtomSN`.
///
/// Envuelve `ShadApp` con el tema (por defecto, el preset "newsprint") e inyecta
/// el [AsnThemeScope] con los colores semanticos del modo activo, de modo que
/// `AsnTheme.of(context)` funcione en todo el arbol.
///
/// Para escenarios con `Router`/`go_router`, usa `ShadApp.router` directamente y
/// envuelve tu arbol con [AsnThemeScope] (o reutiliza [AsnThemeScopeBuilder]).
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
    this.lightColors = AsnNewsprint.light,
    this.darkColors = AsnNewsprint.dark,
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
  final AsnSemanticColors lightColors;

  /// Colores del modo oscuro. Por defecto, "newsprint" Night Press.
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

/// Resuelve el modo activo desde el `ShadTheme` ancestro y publica el
/// [AsnThemeScope] correspondiente. Util como `builder` bajo cualquier `ShadApp`.
class AsnThemeScopeBuilder extends StatelessWidget {
  const AsnThemeScopeBuilder({
    super.key,
    required this.child,
    this.lightColors = AsnNewsprint.light,
    this.darkColors = AsnNewsprint.dark,
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
