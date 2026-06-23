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
