import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../asn_theme.dart';

/// Raw color ramp of the "newsprint" editorial theme.
///
/// Cream paper-like base + warm ink; lawn green and ink black accents.
/// Pure `#FFFFFF` and `#000000` are forbidden: `ink900` (#0E0D0A) is the darkest
/// legal black and `paper50` (#FBF8F0) the lightest paper.
abstract final class AsnNewsprintPalette {
  // paper
  // Light range: warm newsprint-like gray (grayer, with a yellowish tint)
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

/// Default preset: "newsprint" editorial theme (light "Paper" / dark
/// "Night Press").
abstract final class AsnNewsprint {
  /// Semantic roles of the light mode ("Paper").
  static const AsnSemanticColors light = AsnSemanticColors(
    brightness: Brightness.light,
    bgBase: AsnNewsprintPalette.paper50,
    bgSurface: AsnNewsprintPalette.paper100,
    bgRaised: AsnNewsprintPalette.paper200,
    bgSubtle: AsnNewsprintPalette.paper100,
    bgOverlay: AsnNewsprintPalette.ink900,
    bgInverse: AsnNewsprintPalette.ink900,
    textPrimary: AsnNewsprintPalette.ink700,
    textSecondary: AsnNewsprintPalette.paper700,
    textTertiary: AsnNewsprintPalette.paper600,
    textMuted: AsnNewsprintPalette.paper500,
    textDisabled: AsnNewsprintPalette.paper400,
    textInverse: AsnNewsprintPalette.paper50,
    textOnPrimary: AsnNewsprintPalette.paper50,
    link: AsnNewsprintPalette.green700,
    actionPrimary: AsnNewsprintPalette.green500,
    actionHover: AsnNewsprintPalette.green600,
    actionActive: AsnNewsprintPalette.green700,
    actionDisabled: AsnNewsprintPalette.paper300,
    actionSubtle: AsnNewsprintPalette.green50,
    accentInk: AsnNewsprintPalette.ink900,
    borderDefault: AsnNewsprintPalette.paper300,
    borderSubtle: AsnNewsprintPalette.paper200,
    borderStrong: AsnNewsprintPalette.paper400,
    borderActive: AsnNewsprintPalette.green500,
    borderHairline: AsnNewsprintPalette.paper300,
    borderSection: AsnNewsprintPalette.ink500,
    statusLive: AsnNewsprintPalette.red500,
    statusLiveText: AsnNewsprintPalette.red700,
    statusError: AsnNewsprintPalette.red500,
    statusErrorText: AsnNewsprintPalette.red700,
    statusErrorBg: AsnNewsprintPalette.red50,
    statusSuccess: AsnNewsprintPalette.green500,
    statusSuccessText: AsnNewsprintPalette.green700,
    statusSuccessBg: AsnNewsprintPalette.green50,
    statusWarning: AsnNewsprintPalette.yellow500,
    statusWarningText: AsnNewsprintPalette.yellow800,
    statusWarningBg: AsnNewsprintPalette.yellow50,
    statusInfo: AsnNewsprintPalette.indigo500,
    statusInfoText: AsnNewsprintPalette.indigo700,
    statusInfoBg: AsnNewsprintPalette.indigo50,
    highlightMark: AsnNewsprintPalette.yellow100,
  );

  /// Semantic roles of the dark mode ("Night Press").
  static const AsnSemanticColors dark = AsnSemanticColors(
    brightness: Brightness.dark,
    bgBase: AsnNewsprintPalette.inkBg,
    bgSurface: AsnNewsprintPalette.ink300,
    bgRaised: AsnNewsprintPalette.paper800,
    bgSubtle: AsnNewsprintPalette.ink300,
    bgOverlay: AsnNewsprintPalette.ink900,
    bgInverse: AsnNewsprintPalette.paper50,
    textPrimary: AsnNewsprintPalette.paper100,
    textSecondary: AsnNewsprintPalette.paper400,
    textTertiary: AsnNewsprintPalette.paper500,
    textMuted: AsnNewsprintPalette.paper500,
    textDisabled: AsnNewsprintPalette.paper700,
    textInverse: AsnNewsprintPalette.ink900,
    textOnPrimary: AsnNewsprintPalette.ink900,
    link: AsnNewsprintPalette.green300,
    actionPrimary: AsnNewsprintPalette.green300,
    actionHover: AsnNewsprintPalette.green200,
    actionActive: AsnNewsprintPalette.green100,
    actionDisabled: AsnNewsprintPalette.paper700,
    actionSubtle: AsnNewsprintPalette.ink300,
    accentInk: AsnNewsprintPalette.paper100,
    borderDefault: AsnNewsprintPalette.paper700,
    borderSubtle: AsnNewsprintPalette.ink300,
    borderStrong: AsnNewsprintPalette.paper500,
    borderActive: AsnNewsprintPalette.green300,
    borderHairline: AsnNewsprintPalette.paper700,
    borderSection: AsnNewsprintPalette.paper400,
    statusLive: AsnNewsprintPalette.red400,
    statusLiveText: AsnNewsprintPalette.red300,
    statusError: AsnNewsprintPalette.red400,
    statusErrorText: AsnNewsprintPalette.red300,
    statusErrorBg: AsnNewsprintPalette.red900,
    statusSuccess: AsnNewsprintPalette.green300,
    statusSuccessText: AsnNewsprintPalette.green300,
    statusSuccessBg: AsnNewsprintPalette.green900,
    statusWarning: AsnNewsprintPalette.yellow300,
    statusWarningText: AsnNewsprintPalette.yellow300,
    statusWarningBg: AsnNewsprintPalette.yellow900,
    statusInfo: AsnNewsprintPalette.indigo400,
    statusInfoText: AsnNewsprintPalette.indigo400,
    statusInfoBg: AsnNewsprintPalette.indigo900,
    highlightMark: AsnNewsprintPalette.yellow700,
  );

  /// `ShadThemeData` of the light mode.
  static ShadThemeData get lightTheme => AsnTheme.buildTheme(light);

  /// `ShadThemeData` of the dark mode.
  static ShadThemeData get darkTheme => AsnTheme.buildTheme(dark);
}
