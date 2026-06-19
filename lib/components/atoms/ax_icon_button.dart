import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AxIconButton].
enum AxIconButtonVariant { primary, secondary, destructive, outline, ghost }

/// Boton de solo icono. Envuelve `ShadIconButton`.
class AxIconButton extends StatelessWidget {
  const AxIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AxIconButtonVariant.primary,
    this.iconSize,
    this.enabled = true,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final AxIconButtonVariant variant;
  final double? iconSize;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AxIconButtonVariant.primary => ShadIconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AxIconButtonVariant.secondary => ShadIconButton.secondary(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AxIconButtonVariant.destructive => ShadIconButton.destructive(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AxIconButtonVariant.outline => ShadIconButton.outline(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
      AxIconButtonVariant.ghost => ShadIconButton.ghost(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
        enabled: enabled,
      ),
    };
  }
}
