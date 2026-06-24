import 'package:flutter/painting.dart';

/// Base typographic scale (sizes, weights, line height, tracking).
///
/// Brand-agnostic foundational layer. The concrete families and the construction
/// of `TextStyle` (single family ElmsSans, bundled) live in
/// `theme/asn_text_theme.dart`.
abstract final class AsnFontSize {
  static const double sm = 12;
  static const double md = 14;
  static const double lg = 16;
  static const double xl = 18;
  static const double xl2 = 20;
  static const double xl3 = 24;
  static const double xl4 = 32;
  static const double xl5 = 40;
  static const double xl6 = 48;
  static const double xl7 = 60;
}

abstract final class AsnFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

abstract final class AsnLineHeight {
  static const double tight = 1.1;
  static const double snug = 1.25;
  static const double normal = 1.5;
  static const double relaxed = 1.65;
}

/// Tracking expressed as `letterSpacing` in px for a reference `fontSize` of
/// 14px (em * fontSize). For proportional tracking, multiply the `em` value
/// by the actual size when composing styles.
abstract final class AsnTracking {
  static const double tightEm = -0.02;
  static const double normalEm = 0;
  static const double wideEm = 0.02;
  static const double xwideEm = 0.06;

  /// Overline / kicker in uppercase.
  static const double kickerEm = 0.08;

  /// Converts tracking in `em` to absolute `letterSpacing` for a [fontSize].
  static double toLetterSpacing(double em, double fontSize) => em * fontSize;
}
