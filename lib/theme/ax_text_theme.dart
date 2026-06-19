import 'package:flutter/painting.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/typography/ax_type_scale.dart';

/// Construye el [ShadTextTheme] duotono de `atomic_ui`.
///
/// - Serif `Libre Caslon Display` (fuente empaquetada, peso 400, solo >=20px):
///   titulares y display.
/// - Sans `ElmsSans` (fuente empaquetada): cuerpo, UI, labels, captions, stats.
///
/// Ambas familias se cargan desde los assets del paquete; no hay descargas en
/// runtime ni dependencia de google_fonts.
///
/// Las composiciones editoriales que no encajan en los slots estandar de
/// `ShadTextTheme` (masthead, overline, caption, label, stats) se publican en
/// el mapa `custom` y se exponen tipadas en [AxTextStyles].
abstract final class AxTextTheme {
  /// Familia sans empaquetada. El prefijo `packages/` la hace resoluble tanto
  /// dentro del paquete como en las apps consumidoras.
  static const String sansFamily = 'packages/atomic_ui/ElmsSans';

  /// Familia serif empaquetada (solo titulares/display).
  static const String serifFamily = 'packages/atomic_ui/LibreCaslonDisplay';

  static TextStyle _sans(
    double size,
    FontWeight weight, {
    double height = AxLineHeight.normal,
    double trackingEm = AxTracking.normalEm,
    bool tabular = false,
  }) {
    return TextStyle(
      fontFamily: sansFamily,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: AxTracking.toLetterSpacing(trackingEm, size),
      fontFeatures: tabular ? const [FontFeature.tabularFigures()] : null,
    );
  }

  static TextStyle _serif(
    double size, {
    double height = AxLineHeight.snug,
    double trackingEm = AxTracking.normalEm,
  }) {
    return TextStyle(
      fontFamily: serifFamily,
      fontSize: size,
      fontWeight: AxFontWeight.regular,
      height: height,
      letterSpacing: AxTracking.toLetterSpacing(trackingEm, size),
    );
  }

  /// Estilos editoriales extra publicados en `ShadTextTheme.custom`.
  static Map<String, TextStyle> customStyles() => {
    AxTextStyles.masthead: _serif(
      AxFontSize.xl6,
      height: AxLineHeight.tight,
      trackingEm: AxTracking.tightEm,
    ),
    AxTextStyles.displayScore: _sans(
      AxFontSize.xl7,
      AxFontWeight.extrabold,
      height: AxLineHeight.tight,
      trackingEm: AxTracking.tightEm,
      tabular: true,
    ),
    AxTextStyles.statLarge: _sans(
      AxFontSize.xl3,
      AxFontWeight.bold,
      height: AxLineHeight.tight,
      trackingEm: AxTracking.tightEm,
      tabular: true,
    ),
    AxTextStyles.statMedium: _sans(
      AxFontSize.xl,
      AxFontWeight.semibold,
      height: AxLineHeight.tight,
      tabular: true,
    ),
    AxTextStyles.overline: _sans(
      AxFontSize.sm,
      AxFontWeight.semibold,
      height: AxLineHeight.tight,
      trackingEm: AxTracking.kickerEm,
    ),
    AxTextStyles.label: _sans(
      AxFontSize.md,
      AxFontWeight.medium,
      height: AxLineHeight.tight,
    ),
    AxTextStyles.caption: _sans(AxFontSize.sm, AxFontWeight.regular),
  };

  /// Construye el [ShadTextTheme] completo.
  static ShadTextTheme build() {
    return ShadTextTheme.custom(
      family: sansFamily,
      // Titulares serif (>=20px).
      h1Large: _serif(
        AxFontSize.xl6,
        height: AxLineHeight.tight,
        trackingEm: AxTracking.tightEm,
      ),
      h1: _serif(AxFontSize.xl4),
      h2: _serif(AxFontSize.xl3),
      // Titulos de UI: sans.
      h3: _sans(
        AxFontSize.xl2,
        AxFontWeight.semibold,
        height: AxLineHeight.snug,
      ),
      h4: _sans(AxFontSize.xl, AxFontWeight.medium),
      lead: _sans(AxFontSize.lg, AxFontWeight.regular),
      // Cuerpo y UI.
      p: _sans(AxFontSize.md, AxFontWeight.regular),
      blockquote: _sans(
        AxFontSize.md,
        AxFontWeight.regular,
      ).copyWith(fontStyle: FontStyle.italic),
      table: _sans(AxFontSize.md, AxFontWeight.regular, tabular: true),
      list: _sans(AxFontSize.md, AxFontWeight.regular),
      large: _sans(AxFontSize.lg, AxFontWeight.semibold),
      small: _sans(
        AxFontSize.sm,
        AxFontWeight.medium,
        height: AxLineHeight.tight,
      ),
      muted: _sans(AxFontSize.sm, AxFontWeight.regular),
      custom: customStyles(),
    );
  }
}

/// Claves de los estilos editoriales extra en `ShadTextTheme.custom`.
abstract final class AxTextStyles {
  static const String masthead = 'masthead';
  static const String displayScore = 'displayScore';
  static const String statLarge = 'statLarge';
  static const String statMedium = 'statMedium';
  static const String overline = 'overline';
  static const String label = 'label';
  static const String caption = 'caption';
}
