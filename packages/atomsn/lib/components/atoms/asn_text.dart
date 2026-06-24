import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../../theme/asn_theme.dart';

/// Semantic color of an [AsnText], resolved from the active theme.
enum AsnTextColor {
  primary,
  secondary,
  tertiary,
  muted,
  inverse,
  onPrimary,
  link,
  success,
  error,
  warning,
}

enum _AsnTextRole {
  masthead,
  h1,
  h2,
  h3,
  h4,
  lead,
  body,
  bodyLarge,
  bodySmall,
  label,
  caption,
  overline,
  blockquote,
  listItem,
  display,
  stat,
  link,
}

/// System text component. Applies the theme styles (`AsnTextTheme`)
/// according to the chosen role and a semantic color, without the consumer
/// touching `TextStyle` by hand.
///
/// Use the named constructors for each editorial role:
/// - Headlines: [AsnText.masthead], [AsnText.h1], [AsnText.h2].
/// - UI titles: [AsnText.h3], [AsnText.h4].
/// - Subtitle/lead-in: [AsnText.lead].
/// - Body: [AsnText.body] (md), [AsnText.bodyLarge], [AsnText.bodySmall].
/// - Supporting: [AsnText.label], [AsnText.caption], [AsnText.overline] (uppercase),
///   [AsnText.blockquote], [AsnText.listItem].
/// - Data: [AsnText.display] (marker), [AsnText.stat] (tabular figures).
/// - [AsnText.link] (with optional [onTap]).
///
/// All accept [color] (semantic), [textAlign], [maxLines], [overflow] and
/// [style] (override merged on top).
class AsnText extends StatelessWidget {
  const AsnText.masthead(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.masthead,
       _uppercase = false,
       onTap = null;

  const AsnText.h1(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.h1,
       _uppercase = false,
       onTap = null;

  const AsnText.h2(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.h2,
       _uppercase = false,
       onTap = null;

  const AsnText.h3(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.h3,
       _uppercase = false,
       onTap = null;

  const AsnText.h4(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.h4,
       _uppercase = false,
       onTap = null;

  const AsnText.lead(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.lead,
       _uppercase = false,
       onTap = null;

  const AsnText.body(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.body,
       _uppercase = false,
       onTap = null;

  const AsnText.bodyLarge(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.bodyLarge,
       _uppercase = false,
       onTap = null;

  const AsnText.bodySmall(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.bodySmall,
       _uppercase = false,
       onTap = null;

  const AsnText.label(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.label,
       _uppercase = false,
       onTap = null;

  const AsnText.caption(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.caption,
       _uppercase = false,
       onTap = null;

  /// Kicker/overline in uppercase (transforms the text to uppercase).
  const AsnText.overline(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.overline,
       _uppercase = true,
       onTap = null;

  const AsnText.blockquote(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.blockquote,
       _uppercase = false,
       onTap = null;

  const AsnText.listItem(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.listItem,
       _uppercase = false,
       onTap = null;

  /// Marker/large number with tabular figures.
  const AsnText.display(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.display,
       _uppercase = false,
       onTap = null;

  /// Statistic with tabular figures.
  const AsnText.stat(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AsnTextRole.stat,
       _uppercase = false,
       onTap = null;

  /// Link: link color and underline; optional [onTap].
  const AsnText.link(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
    this.onTap,
  }) : _role = _AsnTextRole.link,
       _uppercase = false;

  final String data;
  final _AsnTextRole _role;

  /// Semantic color. If null, the role's default color is used.
  final AsnTextColor? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  /// Override merged on top of the role's style.
  final TextStyle? style;

  /// Only for [AsnText.link].
  final VoidCallback? onTap;
  final bool _uppercase;

  TextStyle _roleStyle(ShadTextTheme t) => switch (_role) {
    _AsnTextRole.masthead => t.custom['masthead'] ?? t.h1Large,
    _AsnTextRole.h1 => t.h1,
    _AsnTextRole.h2 => t.h2,
    _AsnTextRole.h3 => t.h3,
    _AsnTextRole.h4 => t.h4,
    _AsnTextRole.lead => t.lead,
    _AsnTextRole.body => t.p,
    _AsnTextRole.bodyLarge => t.large,
    _AsnTextRole.bodySmall => t.small,
    _AsnTextRole.label => t.custom['label'] ?? t.small,
    _AsnTextRole.caption => t.custom['caption'] ?? t.muted,
    _AsnTextRole.overline => t.custom['overline'] ?? t.small,
    _AsnTextRole.blockquote => t.blockquote,
    _AsnTextRole.listItem => t.list,
    _AsnTextRole.display => t.custom['displayScore'] ?? t.h1Large,
    _AsnTextRole.stat => t.custom['statLarge'] ?? t.h2,
    _AsnTextRole.link => t.p,
  };

  AsnTextColor get _defaultColor => switch (_role) {
    _AsnTextRole.caption || _AsnTextRole.overline => AsnTextColor.muted,
    _AsnTextRole.blockquote => AsnTextColor.secondary,
    _AsnTextRole.link => AsnTextColor.link,
    _ => AsnTextColor.primary,
  };

  Color _resolveColor(AsnSemanticColors c, AsnTextColor col) => switch (col) {
    AsnTextColor.primary => c.textPrimary,
    AsnTextColor.secondary => c.textSecondary,
    AsnTextColor.tertiary => c.textTertiary,
    AsnTextColor.muted => c.textMuted,
    AsnTextColor.inverse => c.textInverse,
    AsnTextColor.onPrimary => c.textOnPrimary,
    AsnTextColor.link => c.link,
    AsnTextColor.success => c.statusSuccessText,
    AsnTextColor.error => c.statusErrorText,
    AsnTextColor.warning => c.statusWarningText,
  };

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colors = AsnTheme.of(context);

    var resolved = _roleStyle(
      textTheme,
    ).copyWith(color: _resolveColor(colors, color ?? _defaultColor));
    if (_role == _AsnTextRole.link) {
      resolved = resolved.copyWith(decoration: TextDecoration.underline);
    }
    if (style != null) resolved = resolved.merge(style);

    final content = switch (_role) {
      _AsnTextRole.overline => data.toUpperCase(),
      _AsnTextRole.listItem => '•  $data',
      _ => data,
    };

    Widget text = Text(
      _uppercase ? content.toUpperCase() : content,
      style: resolved,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
    );

    if (onTap != null) {
      text = GestureDetector(onTap: onTap, child: text);
    }
    return text;
  }
}
