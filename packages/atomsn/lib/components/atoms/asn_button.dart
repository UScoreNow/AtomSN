import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AsnButton].
enum AsnButtonVariant { primary, secondary, destructive, outline, ghost, link }

/// Tamanos de [AsnButton].
enum AsnButtonSize { regular, sm, lg }

/// Boton de accion. Envuelve `ShadButton` exponiendo una API estable y
/// controlada (sin filtrar tipos `Shad*`).
///
/// Acepta un icono [leading] (izquierda) y/o [trailing] (derecha) del texto; el
/// icono se dimensiona segun [size]. El contenido (icono + texto) queda siempre
/// centrado vertical y horizontalmente, tambien cuando [expanded] es true y el
/// boton ocupa todo el ancho disponible.
class AsnButton extends StatelessWidget {
  const AsnButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = AsnButtonVariant.primary,
    this.size = AsnButtonSize.regular,
    this.leading,
    this.trailing,
    this.expanded = false,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final AsnButtonVariant variant;
  final AsnButtonSize size;

  /// Icono a la izquierda del texto.
  final Widget? leading;

  /// Icono a la derecha del texto.
  final Widget? trailing;

  /// Si es true, el boton ocupa todo el ancho disponible (contenido centrado).
  final bool expanded;
  final bool enabled;

  ShadButtonSize get _size => switch (size) {
    AsnButtonSize.regular => ShadButtonSize.regular,
    AsnButtonSize.sm => ShadButtonSize.sm,
    AsnButtonSize.lg => ShadButtonSize.lg,
  };

  ShadButtonVariant get _variant => switch (variant) {
    AsnButtonVariant.primary => ShadButtonVariant.primary,
    AsnButtonVariant.secondary => ShadButtonVariant.secondary,
    AsnButtonVariant.destructive => ShadButtonVariant.destructive,
    AsnButtonVariant.outline => ShadButtonVariant.outline,
    AsnButtonVariant.ghost => ShadButtonVariant.ghost,
    AsnButtonVariant.link => ShadButtonVariant.link,
  };

  double get _iconSize => switch (size) {
    AsnButtonSize.sm => 16,
    AsnButtonSize.regular => 18,
    AsnButtonSize.lg => 20,
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
    // Boton de ancho completo: el contenido (icono + texto) se agrupa en un Row
    // centrado y se expande (`expands`) para quedar centrado horizontalmente.
    if (expanded) {
      final items = <Widget>[
        if (leading != null) _sizedIcon(leading)!,
        child,
        if (trailing != null) _sizedIcon(trailing)!,
      ];
      return ShadButton.raw(
        variant: _variant,
        size: _size,
        onPressed: onPressed,
        enabled: enabled,
        width: double.infinity,
        expands: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              items[i],
            ],
          ],
        ),
      );
    }

    // Boton ajustado al contenido: ShadButton ya centra leading/child/trailing.
    return ShadButton.raw(
      variant: _variant,
      size: _size,
      onPressed: onPressed,
      enabled: enabled,
      leading: _sizedIcon(leading),
      trailing: _sizedIcon(trailing),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      child: child,
    );
  }
}
