import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Entry of a menu (context, menubar, etc.).
@immutable
class AsnMenuItem {
  const AsnMenuItem({
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

/// Region with a context menu (right click / long press).
/// Wraps `ShadContextMenuRegion` with its own item model.
class AsnContextMenu extends StatelessWidget {
  const AsnContextMenu({super.key, required this.child, required this.items});

  /// Anchor on which the menu is triggered.
  final Widget child;
  final List<AsnMenuItem> items;

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
