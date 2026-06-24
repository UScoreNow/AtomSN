import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../../theme/ax_theme.dart';

/// Color semantico de un [AxText], resuelto desde el tema activo.
enum AxTextColor {
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

enum _AxTextRole {
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

/// Componente de texto del sistema. Aplica los estilos del tema (`AxTextTheme`)
/// segun el rol elegido y un color semantico, sin que el consumidor toque
/// `TextStyle` a mano.
///
/// Usa los constructores nombrados para cada rol editorial:
/// - Titulares: [AxText.masthead], [AxText.h1], [AxText.h2].
/// - Titulos de UI: [AxText.h3], [AxText.h4].
/// - Subtitulo/entradilla: [AxText.lead].
/// - Cuerpo: [AxText.body] (md), [AxText.bodyLarge], [AxText.bodySmall].
/// - Apoyos: [AxText.label], [AxText.caption], [AxText.overline] (mayusculas),
///   [AxText.blockquote], [AxText.listItem].
/// - Datos: [AxText.display] (marcador), [AxText.stat] (cifras tabulares).
/// - [AxText.link] (con [onTap] opcional).
///
/// Todos aceptan [color] (semantico), [textAlign], [maxLines], [overflow] y
/// [style] (override que se fusiona encima).
class AxText extends StatelessWidget {
  const AxText.masthead(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.masthead,
       _uppercase = false,
       onTap = null;

  const AxText.h1(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.h1,
       _uppercase = false,
       onTap = null;

  const AxText.h2(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.h2,
       _uppercase = false,
       onTap = null;

  const AxText.h3(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.h3,
       _uppercase = false,
       onTap = null;

  const AxText.h4(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.h4,
       _uppercase = false,
       onTap = null;

  const AxText.lead(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.lead,
       _uppercase = false,
       onTap = null;

  const AxText.body(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.body,
       _uppercase = false,
       onTap = null;

  const AxText.bodyLarge(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.bodyLarge,
       _uppercase = false,
       onTap = null;

  const AxText.bodySmall(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.bodySmall,
       _uppercase = false,
       onTap = null;

  const AxText.label(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.label,
       _uppercase = false,
       onTap = null;

  const AxText.caption(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.caption,
       _uppercase = false,
       onTap = null;

  /// Kicker/overline en mayusculas (transforma el texto a mayusculas).
  const AxText.overline(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.overline,
       _uppercase = true,
       onTap = null;

  const AxText.blockquote(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.blockquote,
       _uppercase = false,
       onTap = null;

  const AxText.listItem(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.listItem,
       _uppercase = false,
       onTap = null;

  /// Marcador/numero grande con cifras tabulares.
  const AxText.display(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.display,
       _uppercase = false,
       onTap = null;

  /// Estadistica con cifras tabulares.
  const AxText.stat(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  }) : _role = _AxTextRole.stat,
       _uppercase = false,
       onTap = null;

  /// Enlace: color de enlace y subrayado; [onTap] opcional.
  const AxText.link(
    this.data, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
    this.onTap,
  }) : _role = _AxTextRole.link,
       _uppercase = false;

  final String data;
  final _AxTextRole _role;

  /// Color semantico. Si es null se usa el color por defecto del rol.
  final AxTextColor? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  /// Override que se fusiona sobre el estilo del rol.
  final TextStyle? style;

  /// Solo para [AxText.link].
  final VoidCallback? onTap;
  final bool _uppercase;

  TextStyle _roleStyle(ShadTextTheme t) => switch (_role) {
    _AxTextRole.masthead => t.custom['masthead'] ?? t.h1Large,
    _AxTextRole.h1 => t.h1,
    _AxTextRole.h2 => t.h2,
    _AxTextRole.h3 => t.h3,
    _AxTextRole.h4 => t.h4,
    _AxTextRole.lead => t.lead,
    _AxTextRole.body => t.p,
    _AxTextRole.bodyLarge => t.large,
    _AxTextRole.bodySmall => t.small,
    _AxTextRole.label => t.custom['label'] ?? t.small,
    _AxTextRole.caption => t.custom['caption'] ?? t.muted,
    _AxTextRole.overline => t.custom['overline'] ?? t.small,
    _AxTextRole.blockquote => t.blockquote,
    _AxTextRole.listItem => t.list,
    _AxTextRole.display => t.custom['displayScore'] ?? t.h1Large,
    _AxTextRole.stat => t.custom['statLarge'] ?? t.h2,
    _AxTextRole.link => t.p,
  };

  AxTextColor get _defaultColor => switch (_role) {
    _AxTextRole.caption || _AxTextRole.overline => AxTextColor.muted,
    _AxTextRole.blockquote => AxTextColor.secondary,
    _AxTextRole.link => AxTextColor.link,
    _ => AxTextColor.primary,
  };

  Color _resolveColor(AxSemanticColors c, AxTextColor col) => switch (col) {
    AxTextColor.primary => c.textPrimary,
    AxTextColor.secondary => c.textSecondary,
    AxTextColor.tertiary => c.textTertiary,
    AxTextColor.muted => c.textMuted,
    AxTextColor.inverse => c.textInverse,
    AxTextColor.onPrimary => c.textOnPrimary,
    AxTextColor.link => c.link,
    AxTextColor.success => c.statusSuccessText,
    AxTextColor.error => c.statusErrorText,
    AxTextColor.warning => c.statusWarningText,
  };

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colors = AxTheme.of(context);

    var resolved = _roleStyle(
      textTheme,
    ).copyWith(color: _resolveColor(colors, color ?? _defaultColor));
    if (_role == _AxTextRole.link) {
      resolved = resolved.copyWith(decoration: TextDecoration.underline);
    }
    if (style != null) resolved = resolved.merge(style);

    final content = switch (_role) {
      _AxTextRole.overline => data.toUpperCase(),
      _AxTextRole.listItem => '•  $data',
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
