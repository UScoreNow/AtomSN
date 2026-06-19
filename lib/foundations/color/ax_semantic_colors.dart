import 'package:flutter/widgets.dart';

/// Roles semanticos de color resueltos por modo (light / dark).
///
/// Capa fundacional brand-agnostic: define la *forma* del sistema de color,
/// no valores concretos. Cada tema/preset (p. ej. `newsprint`) provee una
/// instancia para light y otra para dark.
///
/// Los componentes consumen estos roles via `AxTheme.of(context)`, nunca una
/// rampa de color cruda. El tema de shadcn_ui (`ShadColorScheme`) se deriva de
/// aqui; los roles que `ShadColorScheme` no cubre (warning, link, highlightMark,
/// borderSection...) viven aqui y se exponen mediante el scope de `atomic_ui`.
@immutable
class AxSemanticColors {
  const AxSemanticColors({
    required this.brightness,
    required this.bgBase,
    required this.bgSurface,
    required this.bgRaised,
    required this.bgSubtle,
    required this.bgOverlay,
    required this.bgInverse,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textDisabled,
    required this.textInverse,
    required this.textOnPrimary,
    required this.link,
    required this.actionPrimary,
    required this.actionHover,
    required this.actionActive,
    required this.actionDisabled,
    required this.actionSubtle,
    required this.accentInk,
    required this.borderDefault,
    required this.borderSubtle,
    required this.borderStrong,
    required this.borderActive,
    required this.borderHairline,
    required this.borderSection,
    required this.statusLive,
    required this.statusLiveText,
    required this.statusError,
    required this.statusErrorText,
    required this.statusSuccess,
    required this.statusSuccessText,
    required this.statusWarning,
    required this.statusWarningText,
    required this.statusInfo,
    required this.statusInfoText,
    required this.highlightMark,
  });

  /// Brillo asociado a este conjunto de roles.
  final Brightness brightness;

  // --- bg: fondos y superficies ---
  final Color bgBase;
  final Color bgSurface;
  final Color bgRaised;
  final Color bgSubtle;

  /// Velo de overlay; aplicar con opacidad (p. ej. 0.5 light / 0.7 dark).
  final Color bgOverlay;
  final Color bgInverse;

  // --- text ---
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textDisabled;
  final Color textInverse;

  /// Texto sobre relleno de accion primaria.
  final Color textOnPrimary;

  /// Color de enlace.
  final Color link;

  // --- action ---
  final Color actionPrimary;
  final Color actionHover;
  final Color actionActive;
  final Color actionDisabled;
  final Color actionSubtle;

  // --- accent ---
  /// Destacados / sellos de alto contraste.
  final Color accentInk;

  // --- border ---
  final Color borderDefault;
  final Color borderSubtle;
  final Color borderStrong;
  final Color borderActive;

  /// Regla fina (1px).
  final Color borderHairline;

  /// Regla de seccion (2px).
  final Color borderSection;

  // --- status (fill vs text) ---
  final Color statusLive;
  final Color statusLiveText;
  final Color statusError;
  final Color statusErrorText;
  final Color statusSuccess;
  final Color statusSuccessText;
  final Color statusWarning;
  final Color statusWarningText;
  final Color statusInfo;
  final Color statusInfoText;

  // --- highlight ---
  /// Wash de marcador tras datos clave.
  final Color highlightMark;

  AxSemanticColors copyWith({
    Brightness? brightness,
    Color? bgBase,
    Color? bgSurface,
    Color? bgRaised,
    Color? bgSubtle,
    Color? bgOverlay,
    Color? bgInverse,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textMuted,
    Color? textDisabled,
    Color? textInverse,
    Color? textOnPrimary,
    Color? link,
    Color? actionPrimary,
    Color? actionHover,
    Color? actionActive,
    Color? actionDisabled,
    Color? actionSubtle,
    Color? accentInk,
    Color? borderDefault,
    Color? borderSubtle,
    Color? borderStrong,
    Color? borderActive,
    Color? borderHairline,
    Color? borderSection,
    Color? statusLive,
    Color? statusLiveText,
    Color? statusError,
    Color? statusErrorText,
    Color? statusSuccess,
    Color? statusSuccessText,
    Color? statusWarning,
    Color? statusWarningText,
    Color? statusInfo,
    Color? statusInfoText,
    Color? highlightMark,
  }) {
    return AxSemanticColors(
      brightness: brightness ?? this.brightness,
      bgBase: bgBase ?? this.bgBase,
      bgSurface: bgSurface ?? this.bgSurface,
      bgRaised: bgRaised ?? this.bgRaised,
      bgSubtle: bgSubtle ?? this.bgSubtle,
      bgOverlay: bgOverlay ?? this.bgOverlay,
      bgInverse: bgInverse ?? this.bgInverse,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textMuted: textMuted ?? this.textMuted,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      link: link ?? this.link,
      actionPrimary: actionPrimary ?? this.actionPrimary,
      actionHover: actionHover ?? this.actionHover,
      actionActive: actionActive ?? this.actionActive,
      actionDisabled: actionDisabled ?? this.actionDisabled,
      actionSubtle: actionSubtle ?? this.actionSubtle,
      accentInk: accentInk ?? this.accentInk,
      borderDefault: borderDefault ?? this.borderDefault,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderStrong: borderStrong ?? this.borderStrong,
      borderActive: borderActive ?? this.borderActive,
      borderHairline: borderHairline ?? this.borderHairline,
      borderSection: borderSection ?? this.borderSection,
      statusLive: statusLive ?? this.statusLive,
      statusLiveText: statusLiveText ?? this.statusLiveText,
      statusError: statusError ?? this.statusError,
      statusErrorText: statusErrorText ?? this.statusErrorText,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusSuccessText: statusSuccessText ?? this.statusSuccessText,
      statusWarning: statusWarning ?? this.statusWarning,
      statusWarningText: statusWarningText ?? this.statusWarningText,
      statusInfo: statusInfo ?? this.statusInfo,
      statusInfoText: statusInfoText ?? this.statusInfoText,
      highlightMark: highlightMark ?? this.highlightMark,
    );
  }
}
