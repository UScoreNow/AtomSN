import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AsnBadge].
enum AsnBadgeVariant { primary, secondary, outline, destructive }

/// Etiqueta breve de estado o categoria. Envuelve `ShadBadge`.
class AsnBadge extends StatelessWidget {
  const AsnBadge({
    super.key,
    required this.child,
    this.variant = AsnBadgeVariant.primary,
    this.onPressed,
  });

  final Widget child;
  final AsnBadgeVariant variant;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AsnBadgeVariant.primary => ShadBadge(onPressed: onPressed, child: child),
      AsnBadgeVariant.secondary => ShadBadge.secondary(
        onPressed: onPressed,
        child: child,
      ),
      AsnBadgeVariant.outline => ShadBadge.outline(
        onPressed: onPressed,
        child: child,
      ),
      AsnBadgeVariant.destructive => ShadBadge.destructive(
        onPressed: onPressed,
        child: child,
      ),
    };
  }
}
