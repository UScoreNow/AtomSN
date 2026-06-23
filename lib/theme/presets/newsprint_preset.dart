import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../ax_theme.dart';

/// Rampa de color cruda del tema editorial "newsprint".
///
/// Base apapelada crema + tinta calida; acentos verde cesped y negro tinta.
/// `#FFFFFF` y `#000000` puros estan prohibidos: `ink900` (#0E0D0A) es el negro
/// legal mas oscuro y `paper50` (#FBF8F0) el papel mas claro.
abstract final class AxNewsprintPalette {
  // paper
  // Tramo claro: gris calido tipo newsprint (mas gris, con tinte amarillento)
  // en lugar del crema original.
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
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo700 = Color(0xFF4338CA);
}

/// Preset por defecto: tema editorial "newsprint" (light "Paper" / dark
/// "Night Press").
abstract final class AxNewsprint {
  /// Roles semanticos del modo claro ("Paper").
  static const AxSemanticColors light = AxSemanticColors(
    brightness: Brightness.light,
    bgBase: AxNewsprintPalette.paper50,
    bgSurface: AxNewsprintPalette.paper100,
    bgRaised: AxNewsprintPalette.paper200,
    bgSubtle: AxNewsprintPalette.paper100,
    bgOverlay: AxNewsprintPalette.ink900,
    bgInverse: AxNewsprintPalette.ink900,
    textPrimary: AxNewsprintPalette.ink700,
    textSecondary: AxNewsprintPalette.paper700,
    textTertiary: AxNewsprintPalette.paper600,
    textMuted: AxNewsprintPalette.paper500,
    textDisabled: AxNewsprintPalette.paper400,
    textInverse: AxNewsprintPalette.paper50,
    textOnPrimary: AxNewsprintPalette.paper50,
    link: AxNewsprintPalette.green700,
    actionPrimary: AxNewsprintPalette.green500,
    actionHover: AxNewsprintPalette.green600,
    actionActive: AxNewsprintPalette.green700,
    actionDisabled: AxNewsprintPalette.paper300,
    actionSubtle: AxNewsprintPalette.green50,
    accentInk: AxNewsprintPalette.ink900,
    borderDefault: AxNewsprintPalette.paper300,
    borderSubtle: AxNewsprintPalette.paper200,
    borderStrong: AxNewsprintPalette.paper400,
    borderActive: AxNewsprintPalette.green500,
    borderHairline: AxNewsprintPalette.paper300,
    borderSection: AxNewsprintPalette.ink500,
    statusLive: AxNewsprintPalette.red500,
    statusLiveText: AxNewsprintPalette.red700,
    statusError: AxNewsprintPalette.red500,
    statusErrorText: AxNewsprintPalette.red700,
    statusSuccess: AxNewsprintPalette.green500,
    statusSuccessText: AxNewsprintPalette.green700,
    statusWarning: AxNewsprintPalette.yellow500,
    statusWarningText: AxNewsprintPalette.yellow800,
    statusInfo: AxNewsprintPalette.indigo500,
    statusInfoText: AxNewsprintPalette.indigo700,
    highlightMark: AxNewsprintPalette.yellow100,
  );

  /// Roles semanticos del modo oscuro ("Night Press").
  static const AxSemanticColors dark = AxSemanticColors(
    brightness: Brightness.dark,
    bgBase: AxNewsprintPalette.inkBg,
    bgSurface: AxNewsprintPalette.ink300,
    bgRaised: AxNewsprintPalette.paper800,
    bgSubtle: AxNewsprintPalette.ink300,
    bgOverlay: AxNewsprintPalette.ink900,
    bgInverse: AxNewsprintPalette.paper50,
    textPrimary: AxNewsprintPalette.paper100,
    textSecondary: AxNewsprintPalette.paper400,
    textTertiary: AxNewsprintPalette.paper500,
    textMuted: AxNewsprintPalette.paper500,
    textDisabled: AxNewsprintPalette.paper700,
    textInverse: AxNewsprintPalette.ink900,
    textOnPrimary: AxNewsprintPalette.ink900,
    link: AxNewsprintPalette.green300,
    actionPrimary: AxNewsprintPalette.green300,
    actionHover: AxNewsprintPalette.green200,
    actionActive: AxNewsprintPalette.green100,
    actionDisabled: AxNewsprintPalette.paper700,
    actionSubtle: AxNewsprintPalette.ink300,
    accentInk: AxNewsprintPalette.paper100,
    borderDefault: AxNewsprintPalette.paper700,
    borderSubtle: AxNewsprintPalette.ink300,
    borderStrong: AxNewsprintPalette.paper500,
    borderActive: AxNewsprintPalette.green300,
    borderHairline: AxNewsprintPalette.paper700,
    borderSection: AxNewsprintPalette.paper400,
    statusLive: AxNewsprintPalette.red400,
    statusLiveText: AxNewsprintPalette.red300,
    statusError: AxNewsprintPalette.red400,
    statusErrorText: AxNewsprintPalette.red300,
    statusSuccess: AxNewsprintPalette.green300,
    statusSuccessText: AxNewsprintPalette.green300,
    statusWarning: AxNewsprintPalette.yellow300,
    statusWarningText: AxNewsprintPalette.yellow300,
    statusInfo: AxNewsprintPalette.indigo400,
    statusInfoText: AxNewsprintPalette.indigo400,
    highlightMark: AxNewsprintPalette.yellow700,
  );

  /// `ShadThemeData` del modo claro.
  static ShadThemeData get lightTheme => AxTheme.buildTheme(light);

  /// `ShadThemeData` del modo oscuro.
  static ShadThemeData get darkTheme => AxTheme.buildTheme(dark);
}
