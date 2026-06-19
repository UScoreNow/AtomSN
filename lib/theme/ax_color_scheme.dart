import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/ax_semantic_colors.dart';

/// Deriva un [ShadColorScheme] desde los [AxSemanticColors] de un tema.
///
/// Solo mapea los roles que `ShadColorScheme` conoce. Los roles editoriales
/// adicionales (warning, link, success, highlightMark, borderSection...) viajan
/// por `AxThemeScope` y, ademas, se copian al mapa `custom` del esquema para
/// que esten disponibles via `ShadTheme.of(context).colorScheme.custom`.
abstract final class AxColorScheme {
  static ShadColorScheme fromSemantic(AxSemanticColors c) {
    return ShadColorScheme(
      background: c.bgBase,
      foreground: c.textPrimary,
      card: c.bgSurface,
      cardForeground: c.textPrimary,
      popover: c.bgSurface,
      popoverForeground: c.textPrimary,
      primary: c.actionPrimary,
      primaryForeground: c.textOnPrimary,
      secondary: c.bgRaised,
      secondaryForeground: c.textPrimary,
      muted: c.bgRaised,
      mutedForeground: c.textMuted,
      accent: c.bgRaised,
      accentForeground: c.textPrimary,
      destructive: c.statusError,
      destructiveForeground: c.textOnPrimary,
      border: c.borderDefault,
      input: c.borderDefault,
      ring: c.actionPrimary,
      selection: c.actionSubtle,
      custom: {
        'link': c.link,
        'warning': c.statusWarning,
        'warningText': c.statusWarningText,
        'success': c.statusSuccess,
        'successText': c.statusSuccessText,
        'live': c.statusLive,
        'info': c.statusInfo,
        'highlightMark': c.highlightMark,
        'borderSection': c.borderSection,
        'accentInk': c.accentInk,
      },
    );
  }
}
