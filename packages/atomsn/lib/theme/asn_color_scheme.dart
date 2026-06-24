import 'package:shadcn_ui/shadcn_ui.dart';

import '../foundations/color/asn_semantic_colors.dart';

/// Derives a [ShadColorScheme] from a theme's [AsnSemanticColors].
///
/// Only maps the roles that `ShadColorScheme` knows about. The additional
/// editorial roles (warning, link, success, highlightMark, borderSection...) travel
/// through `AsnThemeScope` and are also copied into the scheme's `custom` map so
/// they are available via `ShadTheme.of(context).colorScheme.custom`.
abstract final class AsnColorScheme {
  static ShadColorScheme fromSemantic(AsnSemanticColors c) {
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
