import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Visual variants of [AsnIconButton].
enum AsnIconButtonVariant { primary, secondary, destructive, outline, ghost }

/// Icon-only button. Wraps `ShadIconButton`.
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

  /// Icon size. `ShadIconButton` applies it via `IconTheme`.
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
