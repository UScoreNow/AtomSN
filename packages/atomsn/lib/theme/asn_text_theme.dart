import 'package:flutter/painting.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/typography/asn_type_scale.dart';

/// Construye el [ShadTextTheme] de `AtomSN`.
///
/// Sistema de **una sola familia**: `ElmsSans` (minimalista, empaquetada como
/// asset). La jerarquia de titulares se logra con tamano y peso, no con una
/// segunda familia. No hay descargas en runtime ni dependencia de google_fonts.
///
/// Las composiciones que no encajan en los slots estandar de `ShadTextTheme`
/// (masthead, overline, caption, label, stats) se publican en el mapa `custom`
/// y se exponen tipadas en [AsnTextStyles].
abstract final class AsnTextTheme {
  /// Unica familia del sistema (empaquetada). El prefijo `packages/` la hace
  /// resoluble dentro del paquete y en las apps consumidoras.
  static const String fontFamily = 'packages/atomsn/ElmsSans';

  /// Alias historico de [fontFamily].
  static const String sansFamily = fontFamily;

  static TextStyle _sans(
    double size,
    FontWeight weight, {
    double height = AsnLineHeight.normal,
    double trackingEm = AsnTracking.normalEm,
    bool tabular = false,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: AsnTracking.toLetterSpacing(trackingEm, size),
      fontFeatures: tabular ? const [FontFeature.tabularFigures()] : null,
    );
  }

  /// Estilos extra publicados en `ShadTextTheme.custom`.
  static Map<String, TextStyle> customStyles() => {
    AsnTextStyles.masthead: _sans(
      AsnFontSize.xl6,
      AsnFontWeight.extrabold,
      height: AsnLineHeight.tight,
      trackingEm: AsnTracking.tightEm,
    ),
    AsnTextStyles.displayScore: _sans(
      AsnFontSize.xl7,
      AsnFontWeight.extrabold,
      height: AsnLineHeight.tight,
      trackingEm: AsnTracking.tightEm,
      tabular: true,
    ),
    AsnTextStyles.statLarge: _sans(
      AsnFontSize.xl3,
      AsnFontWeight.bold,
      height: AsnLineHeight.tight,
      trackingEm: AsnTracking.tightEm,
      tabular: true,
    ),
    AsnTextStyles.statMedium: _sans(
      AsnFontSize.xl,
      AsnFontWeight.semibold,
      height: AsnLineHeight.tight,
      tabular: true,
    ),
    AsnTextStyles.overline: _sans(
      AsnFontSize.sm,
      AsnFontWeight.semibold,
      height: AsnLineHeight.tight,
      trackingEm: AsnTracking.kickerEm,
    ),
    AsnTextStyles.label: _sans(
      AsnFontSize.md,
      AsnFontWeight.medium,
      height: AsnLineHeight.tight,
    ),
    AsnTextStyles.caption: _sans(AsnFontSize.sm, AsnFontWeight.regular),
  };

  /// Construye el [ShadTextTheme] completo.
  static ShadTextTheme build() {
    return ShadTextTheme.custom(
      family: fontFamily,
      // Titulares: misma familia, jerarquia por tamano + peso.
      h1Large: _sans(
        AsnFontSize.xl6,
        AsnFontWeight.extrabold,
        height: AsnLineHeight.tight,
        trackingEm: AsnTracking.tightEm,
      ),
      h1: _sans(
        AsnFontSize.xl4,
        AsnFontWeight.bold,
        height: AsnLineHeight.snug,
        trackingEm: AsnTracking.tightEm,
      ),
      h2: _sans(AsnFontSize.xl3, AsnFontWeight.semibold, height: AsnLineHeight.snug),
      h3: _sans(AsnFontSize.xl2, AsnFontWeight.semibold, height: AsnLineHeight.snug),
      h4: _sans(AsnFontSize.xl, AsnFontWeight.medium),
      lead: _sans(AsnFontSize.lg, AsnFontWeight.regular),
      // Cuerpo y UI.
      p: _sans(AsnFontSize.md, AsnFontWeight.regular),
      blockquote: _sans(
        AsnFontSize.md,
        AsnFontWeight.regular,
      ).copyWith(fontStyle: FontStyle.italic),
      table: _sans(AsnFontSize.md, AsnFontWeight.regular, tabular: true),
      list: _sans(AsnFontSize.md, AsnFontWeight.regular),
      large: _sans(AsnFontSize.lg, AsnFontWeight.semibold),
      small: _sans(
        AsnFontSize.sm,
        AsnFontWeight.medium,
        height: AsnLineHeight.tight,
      ),
      muted: _sans(AsnFontSize.sm, AsnFontWeight.regular),
      custom: customStyles(),
    );
  }
}

/// Claves de los estilos extra en `ShadTextTheme.custom`.
abstract final class AsnTextStyles {
  static const String masthead = 'masthead';
  static const String displayScore = 'displayScore';
  static const String statLarge = 'statLarge';
  static const String statMedium = 'statMedium';
  static const String overline = 'overline';
  static const String label = 'label';
  static const String caption = 'caption';
}
