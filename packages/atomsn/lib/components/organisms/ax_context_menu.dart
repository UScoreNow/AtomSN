import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Entrada de un menu (contextual, menubar, etc.).
@immutable
class AxMenuItem {
  const AxMenuItem({
    required this.label,
    this.onTap,
    this.icon,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool enabled;
}

/// Region con menu contextual (click derecho / pulsacion larga).
/// Envuelve `ShadContextMenuRegion` con un modelo de items propio.
class AxContextMenu extends StatelessWidget {
  const AxContextMenu({super.key, required this.child, required this.items});

  /// Ancla sobre la que se dispara el menu.
  final Widget child;
  final List<AxMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return ShadContextMenuRegion(
      items: [
        for (final item in items)
          ShadContextMenuItem(
            enabled: item.enabled,
            leading: item.icon,
            onPressed: item.onTap,
            child: Text(item.label),
          ),
      ],
      child: child,
    );
  }
}
