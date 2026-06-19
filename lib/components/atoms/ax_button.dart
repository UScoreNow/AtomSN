import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AxButton].
enum AxButtonVariant { primary, secondary, destructive, outline, ghost, link }

/// Tamanos de [AxButton].
enum AxButtonSize { regular, sm, lg }

/// Boton de accion. Envuelve `ShadButton` exponiendo una API estable y
/// controlada (sin filtrar tipos `Shad*`).
class AxButton extends StatelessWidget {
  const AxButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = AxButtonVariant.primary,
    this.size = AxButtonSize.regular,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final AxButtonVariant variant;
  final AxButtonSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;

  ShadButtonSize get _size => switch (size) {
    AxButtonSize.regular => ShadButtonSize.regular,
    AxButtonSize.sm => ShadButtonSize.sm,
    AxButtonSize.lg => ShadButtonSize.lg,
  };

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AxButtonVariant.primary => ShadButton(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
      AxButtonVariant.secondary => ShadButton.secondary(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
      AxButtonVariant.destructive => ShadButton.destructive(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
      AxButtonVariant.outline => ShadButton.outline(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
      AxButtonVariant.ghost => ShadButton.ghost(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
      AxButtonVariant.link => ShadButton.link(
        onPressed: onPressed,
        size: _size,
        leading: leading,
        trailing: trailing,
        enabled: enabled,
        child: child,
      ),
    };
  }
}
