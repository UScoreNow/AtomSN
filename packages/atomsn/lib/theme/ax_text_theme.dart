import 'package:flutter/painting.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/typography/ax_type_scale.dart';

/// Construye el [ShadTextTheme] de `AtomSN`.
///
/// Sistema de **una sola familia**: `ElmsSans` (minimalista, empaquetada como
/// asset). La jerarquia de titulares se logra con tamano y peso, no con una
/// segunda familia. No hay descargas en runtime ni dependencia de google_fonts.
///
/// Las composiciones que no encajan en los slots estandar de `ShadTextTheme`
/// (masthead, overline, caption, label, stats) se publican en el mapa `custom`
/// y se exponen tipadas en [AxTextStyles].
abstract final class AxTextTheme {
  /// Unica familia del sistema (empaquetada). El prefijo `packages/` la hace
  /// resoluble dentro del paquete y en las apps consumidoras.
  static const String fontFamily = 'packages/atomsn/ElmsSans';

  /// Alias historico de [fontFamily].
  static const String sansFamily = fontFamily;

  static TextStyle _sans(
    double size,
    FontWeight weight, {
    double height = AxLineHeight.normal,
    double trackingEm = AxTracking.normalEm,
    bool tabular = false,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: AxTracking.toLetterSpacing(trackingEm, size),
      fontFeatures: tabular ? const [FontFeature.tabularFigures()] : null,
    );
  }

  /// Estilos extra publicados en `ShadTextTheme.custom`.
  static Map<String, TextStyle> customStyles() => {
    AxTextStyles.masthead: _sans(
      AxFontSize.xl6,
      AxFontWeight.extrabold,
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
      family: fontFamily,
      // Titulares: misma familia, jerarquia por tamano + peso.
      h1Large: _sans(
        AxFontSize.xl6,
        AxFontWeight.extrabold,
        height: AxLineHeight.tight,
        trackingEm: AxTracking.tightEm,
      ),
      h1: _sans(
        AxFontSize.xl4,
        AxFontWeight.bold,
        height: AxLineHeight.snug,
        trackingEm: AxTracking.tightEm,
      ),
      h2: _sans(AxFontSize.xl3, AxFontWeight.semibold, height: AxLineHeight.snug),
      h3: _sans(AxFontSize.xl2, AxFontWeight.semibold, height: AxLineHeight.snug),
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

/// Claves de los estilos extra en `ShadTextTheme.custom`.
abstract final class AxTextStyles {
  static const String masthead = 'masthead';
  static const String displayScore = 'displayScore';
  static const String statLarge = 'statLarge';
  static const String statMedium = 'statMedium';
  static const String overline = 'overline';
  static const String label = 'label';
  static const String caption = 'caption';
}
