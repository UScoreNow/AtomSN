import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../asn_theme.dart';

/// Raw color ramp of the AtomSN theme.
///
/// Cream paper-like base + warm ink; lawn green and ink black accents.
/// Pure `#FFFFFF` and `#000000` are forbidden: `ink900` (#0E0D0A) is the darkest
/// legal black and `paper50` (#FBF8F0) the lightest paper.
abstract final class AsnPalette {
  // paper
  // Light range: warm editorial gray (grayer, with a yellowish tint)
  // instead of the original cream.
  static const Color paper50 = Color(0xFFECEAE0);
  static const Color paper100 = Color(0xFFE5E2D6);
  static const Color paper200 = Color(0xFFDBD7C8);
  static const Color paper300 = Color(0xFFCDC8B6);
  static const Color paper400 = Color(0xFFC2B69D);
  static const Color paper500 = Color(0xFFA6987C);
  static const Color paper600 = Color(0xFF857862);
  static const Color paper700 = Color(0xFF615847);
  static const Color paper800 = Color(0xFF403A30);
  static const Color paper900 = Color(0xFF2B2820);

  // ink
  static const Color ink50 = Color(0xFF6E6A60);
  static const Color ink100 = Color(0xFF514D44);
  static const Color ink300 = Color(0xFF39362E);
  static const Color ink500 = Color(0xFF26241E);
  static const Color ink700 = Color(0xFF1A1814);
  static const Color ink900 = Color(0xFF0E0D0A);
  static const Color inkBg = Color(0xFF16140F);

  // green
  static const Color green50 = Color(0xFFEAF1E4);
  static const Color green100 = Color(0xFFCDDFC0);
  static const Color green200 = Color(0xFFAECF96);
  static const Color green300 = Color(0xFF8FBE6F);
  static const Color green400 = Color(0xFF5FA453);
  static const Color green500 = Color(0xFF3E8E45);
  static const Color green600 = Color(0xFF327237);
  static const Color green700 = Color(0xFF27592C);
  static const Color green800 = Color(0xFF1D4421);
  static const Color green900 = Color(0xFF163518);

  // yellow
  static const Color yellow50 = Color(0xFFFBF4D8);
  static const Color yellow100 = Color(0xFFF6E8BE);
  static const Color yellow200 = Color(0xFFF0D89B);
  static const Color yellow300 = Color(0xFFE8C863);
  static const Color yellow400 = Color(0xFFDFB740);
  static const Color yellow500 = Color(0xFFD6A52E);
  static const Color yellow600 = Color(0xFFB98A1F);
  static const Color yellow700 = Color(0xFF9A7416);
  static const Color yellow800 = Color(0xFF7A5B13);
  static const Color yellow900 = Color(0xFF5C4410);

  // red
  static const Color red50 = Color(0xFFF7E6E4);
  static const Color red100 = Color(0xFFEFC9C6);
  static const Color red200 = Color(0xFFE29E99);
  static const Color red300 = Color(0xFFD5736C);
  static const Color red400 = Color(0xFFCC554D);
  static const Color red500 = Color(0xFFC5403A);
  static const Color red600 = Color(0xFFA8332E);
  static const Color red700 = Color(0xFF8C2A26);
  static const Color red800 = Color(0xFF6E211E);
  static const Color red900 = Color(0xFF511817);

  // indigo
  static const Color indigo50 = Color(0xFFE8EAFD);
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo700 = Color(0xFF4338CA);
  static const Color indigo900 = Color(0xFF1E1B4B);
}

/// Default preset: AtomSN theme (light "AtomSN Light" / dark
/// "AtomSN Dark").
abstract final class AsnColors {
  /// Semantic roles of the light mode ("AtomSN Light").
  static const AsnSemanticColors light = AsnSemanticColors(
    brightness: Brightness.light,
    bgBase: AsnPalette.paper50,
    bgSurface: AsnPalette.paper100,
    bgRaised: AsnPalette.paper200,
    bgSubtle: AsnPalette.paper100,
    bgOverlay: AsnPalette.ink900,
    bgInverse: AsnPalette.ink900,
    textPrimary: AsnPalette.ink700,
    textSecondary: AsnPalette.paper700,
    textTertiary: AsnPalette.paper600,
    textMuted: AsnPalette.paper500,
    textDisabled: AsnPalette.paper400,
    textInverse: AsnPalette.paper50,
    textOnPrimary: AsnPalette.paper50,
    link: AsnPalette.green700,
    actionPrimary: AsnPalette.green500,
    actionHover: AsnPalette.green600,
    actionActive: AsnPalette.green700,
    actionDisabled: AsnPalette.paper300,
    actionSubtle: AsnPalette.green50,
    accentInk: AsnPalette.ink900,
    borderDefault: AsnPalette.paper300,
    borderSubtle: AsnPalette.paper200,
    borderStrong: AsnPalette.paper400,
    borderActive: AsnPalette.green500,
    borderHairline: AsnPalette.paper300,
    borderSection: AsnPalette.ink500,
    statusLive: AsnPalette.red500,
    statusLiveText: AsnPalette.red700,
    statusError: AsnPalette.red500,
    statusErrorText: AsnPalette.red700,
    statusErrorBg: AsnPalette.red50,
    statusSuccess: AsnPalette.green500,
    statusSuccessText: AsnPalette.green700,
    statusSuccessBg: AsnPalette.green50,
    statusWarning: AsnPalette.yellow500,
    statusWarningText: AsnPalette.yellow800,
    statusWarningBg: AsnPalette.yellow50,
    statusInfo: AsnPalette.indigo500,
    statusInfoText: AsnPalette.indigo700,
    statusInfoBg: AsnPalette.indigo50,
    highlightMark: AsnPalette.yellow100,
  );

  /// Semantic roles of the dark mode ("AtomSN Dark").
  static const AsnSemanticColors dark = AsnSemanticColors(
    brightness: Brightness.dark,
    bgBase: AsnPalette.inkBg,
    bgSurface: AsnPalette.ink300,
    bgRaised: AsnPalette.paper800,
    bgSubtle: AsnPalette.ink300,
    bgOverlay: AsnPalette.ink900,
    bgInverse: AsnPalette.paper50,
    textPrimary: AsnPalette.paper100,
    textSecondary: AsnPalette.paper400,
    textTertiary: AsnPalette.paper500,
    textMuted: AsnPalette.paper500,
    textDisabled: AsnPalette.paper700,
    textInverse: AsnPalette.ink900,
    textOnPrimary: AsnPalette.ink900,
    link: AsnPalette.green300,
    actionPrimary: AsnPalette.green300,
    actionHover: AsnPalette.green200,
    actionActive: AsnPalette.green100,
    actionDisabled: AsnPalette.paper700,
    actionSubtle: AsnPalette.ink300,
    accentInk: AsnPalette.paper100,
    borderDefault: AsnPalette.paper700,
    borderSubtle: AsnPalette.ink300,
    borderStrong: AsnPalette.paper500,
    borderActive: AsnPalette.green300,
    borderHairline: AsnPalette.paper700,
    borderSection: AsnPalette.paper400,
    statusLive: AsnPalette.red400,
    statusLiveText: AsnPalette.red300,
    statusError: AsnPalette.red400,
    statusErrorText: AsnPalette.red300,
    statusErrorBg: AsnPalette.red900,
    statusSuccess: AsnPalette.green300,
    statusSuccessText: AsnPalette.green300,
    statusSuccessBg: AsnPalette.green900,
    statusWarning: AsnPalette.yellow300,
    statusWarningText: AsnPalette.yellow300,
    statusWarningBg: AsnPalette.yellow900,
    statusInfo: AsnPalette.indigo400,
    statusInfoText: AsnPalette.indigo400,
    statusInfoBg: AsnPalette.indigo900,
    highlightMark: AsnPalette.yellow700,
  );

  /// `ShadThemeData` of the light mode.
  static ShadThemeData get lightTheme => AsnTheme.buildTheme(light);

  /// `ShadThemeData` of the dark mode.
  static ShadThemeData get darkTheme => AsnTheme.buildTheme(dark);
}
