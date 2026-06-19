import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AxBadge].
enum AxBadgeVariant { primary, secondary, outline, destructive }

/// Etiqueta breve de estado o categoria. Envuelve `ShadBadge`.
class AxBadge extends StatelessWidget {
  const AxBadge({
    super.key,
    required this.child,
    this.variant = AxBadgeVariant.primary,
    this.onPressed,
  });

  final Widget child;
  final AxBadgeVariant variant;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AxBadgeVariant.primary => ShadBadge(onPressed: onPressed, child: child),
      AxBadgeVariant.secondary => ShadBadge.secondary(
        onPressed: onPressed,
        child: child,
      ),
      AxBadgeVariant.outline => ShadBadge.outline(
        onPressed: onPressed,
        child: child,
      ),
      AxBadgeVariant.destructive => ShadBadge.destructive(
        onPressed: onPressed,
        child: child,
      ),
    };
  }
}
