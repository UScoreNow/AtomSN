import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AsnIconButton].
enum AsnIconButtonVariant { primary, secondary, destructive, outline, ghost }

/// Boton de solo icono. Envuelve `ShadIconButton`.
class AsnIconButton extends StatelessWidget {
  const AsnIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AsnIconButtonVariant.primary,
    this.iconSize = 18,
    this.enabled = true,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final AsnIconButtonVariant variant;

  /// Tamano del icono. `ShadIconButton` lo aplica via `IconTheme`.
  final double iconSize;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AsnIconButtonVariant.primary => ShadIconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AsnIconButtonVariant.secondary => ShadIconButton.secondary(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AsnIconButtonVariant.destructive => ShadIconButton.destructive(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AsnIconButtonVariant.outline => ShadIconButton.outline(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AsnIconButtonVariant.ghost => ShadIconButton.ghost(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
    };
  }
}
