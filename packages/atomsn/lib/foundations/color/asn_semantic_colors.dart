import 'package:flutter/widgets.dart';

/// Semantic color roles resolved per mode (light / dark).
///
/// Brand-agnostic foundational layer: defines the *shape* of the color system,
/// not concrete values. Each theme/preset (e.g. `AtomSN`) provides an
/// instance for light and another for dark.
///
/// Components consume these roles via `AsnTheme.of(context)`, never a raw
/// color ramp. The shadcn_ui theme (`ShadColorScheme`) is derived from
/// here; the roles that `ShadColorScheme` does not cover (warning, link, highlightMark,
/// borderSection...) live here and are exposed through the `AtomSN` scope.
@immutable
class AsnSemanticColors {
  const AsnSemanticColors({
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
    required this.statusErrorBg,
    required this.statusSuccess,
    required this.statusSuccessText,
    required this.statusSuccessBg,
    required this.statusWarning,
    required this.statusWarningText,
    required this.statusWarningBg,
    required this.statusInfo,
    required this.statusInfoText,
    required this.statusInfoBg,
    required this.highlightMark,
  });

  /// Brightness associated with this set of roles.
  final Brightness brightness;

  // --- bg: backgrounds and surfaces ---
  final Color bgBase;
  final Color bgSurface;
  final Color bgRaised;
  final Color bgSubtle;

  /// Overlay veil; apply with opacity (e.g. 0.5 light / 0.7 dark).
  final Color bgOverlay;
  final Color bgInverse;

  // --- text ---
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textDisabled;
  final Color textInverse;

  /// Text over primary action fill.
  final Color textOnPrimary;

  /// Link color.
  final Color link;

  // --- action ---
  final Color actionPrimary;
  final Color actionHover;
  final Color actionActive;
  final Color actionDisabled;
  final Color actionSubtle;

  // --- accent ---
  /// High-contrast highlights / stamps.
  final Color accentInk;

  // --- border ---
  final Color borderDefault;
  final Color borderSubtle;
  final Color borderStrong;
  final Color borderActive;

  /// Thin rule (1px).
  final Color borderHairline;

  /// Section rule (2px).
  final Color borderSection;

  // --- status (fill vs text) ---
  final Color statusLive;
  final Color statusLiveText;
  final Color statusError;
  final Color statusErrorText;

  /// Flat, light background fill for error.
  final Color statusErrorBg;
  final Color statusSuccess;
  final Color statusSuccessText;

  /// Flat, light background fill for success.
  final Color statusSuccessBg;
  final Color statusWarning;
  final Color statusWarningText;

  /// Flat, light background fill for warning.
  final Color statusWarningBg;
  final Color statusInfo;
  final Color statusInfoText;

  /// Flat, light background fill for info.
  final Color statusInfoBg;

  // --- highlight ---
  /// Marker wash behind key data.
  final Color highlightMark;

  AsnSemanticColors copyWith({
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
    Color? statusErrorBg,
    Color? statusSuccess,
    Color? statusSuccessText,
    Color? statusSuccessBg,
    Color? statusWarning,
    Color? statusWarningText,
    Color? statusWarningBg,
    Color? statusInfo,
    Color? statusInfoText,
    Color? statusInfoBg,
    Color? highlightMark,
  }) {
    return AsnSemanticColors(
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
      statusErrorBg: statusErrorBg ?? this.statusErrorBg,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusSuccessText: statusSuccessText ?? this.statusSuccessText,
      statusSuccessBg: statusSuccessBg ?? this.statusSuccessBg,
      statusWarning: statusWarning ?? this.statusWarning,
      statusWarningText: statusWarningText ?? this.statusWarningText,
      statusWarningBg: statusWarningBg ?? this.statusWarningBg,
      statusInfo: statusInfo ?? this.statusInfo,
      statusInfoText: statusInfoText ?? this.statusInfoText,
      statusInfoBg: statusInfoBg ?? this.statusInfoBg,
      highlightMark: highlightMark ?? this.highlightMark,
    );
  }
}
