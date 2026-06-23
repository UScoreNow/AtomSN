import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AxButton].
enum AxButtonVariant { primary, secondary, destructive, outline, ghost, link }

/// Tamanos de [AxButton].
enum AxButtonSize { regular, sm, lg }

/// Boton de accion. Envuelve `ShadButton` exponiendo una API estable y
/// controlada (sin filtrar tipos `Shad*`).
///
/// Acepta un icono [leading] (izquierda) y/o [trailing] (derecha) del texto; el
/// icono se dimensiona segun [size]. El contenido (icono + texto) queda siempre
/// centrado vertical y horizontalmente, tambien cuando [expanded] es true y el
/// boton ocupa todo el ancho disponible.
class AxButton extends StatelessWidget {
  const AxButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = AxButtonVariant.primary,
    this.size = AxButtonSize.regular,
    this.leading,
    this.trailing,
    this.expanded = false,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final AxButtonVariant variant;
  final AxButtonSize size;

  /// Icono a la izquierda del texto.
  final Widget? leading;

  /// Icono a la derecha del texto.
  final Widget? trailing;

  /// Si es true, el boton ocupa todo el ancho disponible (contenido centrado).
  final bool expanded;
  final bool enabled;

  ShadButtonSize get _size => switch (size) {
    AxButtonSize.regular => ShadButtonSize.regular,
    AxButtonSize.sm => ShadButtonSize.sm,
    AxButtonSize.lg => ShadButtonSize.lg,
  };

  ShadButtonVariant get _variant => switch (variant) {
    AxButtonVariant.primary => ShadButtonVariant.primary,
    AxButtonVariant.secondary => ShadButtonVariant.secondary,
    AxButtonVariant.destructive => ShadButtonVariant.destructive,
    AxButtonVariant.outline => ShadButtonVariant.outline,
    AxButtonVariant.ghost => ShadButtonVariant.ghost,
    AxButtonVariant.link => ShadButtonVariant.link,
  };

  double get _iconSize => switch (size) {
    AxButtonSize.sm => 16,
    AxButtonSize.regular => 18,
    AxButtonSize.lg => 20,
  };

  /// Fija el tamano del icono manteniendo el color que aporta el boton.
  Widget? _sizedIcon(Widget? icon) {
    if (icon == null) return null;
    return IconTheme.merge(
      data: IconThemeData(size: _iconSize),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShadButton.raw(
      variant: _variant,
      size: _size,
      onPressed: onPressed,
      enabled: enabled,
      leading: _sizedIcon(leading),
      trailing: _sizedIcon(trailing),
      width: expanded ? double.infinity : null,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      child: child,
    );
  }
}
