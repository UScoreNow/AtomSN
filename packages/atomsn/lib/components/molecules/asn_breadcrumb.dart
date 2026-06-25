import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Entry of an [AsnBreadcrumb] dropdown menu. Own model (no `Shad*` leak).
@immutable
class AsnBreadcrumbMenuItem {
  const AsnBreadcrumbMenuItem({required this.label, this.onTap});

  final Widget label;
  final VoidCallback? onTap;
}

enum _AsnBreadcrumbItemKind { link, ellipsis, dropdown }

/// Item of an [AsnBreadcrumb]. Custom model (does not leak `Shad*` types).
///
/// Three kinds: a navigable [AsnBreadcrumbItem.link] (also the default
/// constructor), a collapsed [AsnBreadcrumbItem.ellipsis] indicator, or an
/// [AsnBreadcrumbItem.dropdown] that reveals hidden levels in a menu.
@immutable
class AsnBreadcrumbItem {
  /// A navigable link. Equivalent to [AsnBreadcrumbItem.link].
  const AsnBreadcrumbItem({required this.label, this.onTap})
    : _kind = _AsnBreadcrumbItemKind.link,
      trigger = null,
      menuItems = const [];

  /// A navigable link.
  const AsnBreadcrumbItem.link({required this.label, this.onTap})
    : _kind = _AsnBreadcrumbItemKind.link,
      trigger = null,
      menuItems = const [];

  /// A "…" indicator for collapsed levels.
  const AsnBreadcrumbItem.ellipsis()
    : _kind = _AsnBreadcrumbItemKind.ellipsis,
      label = null,
      onTap = null,
      trigger = null,
      menuItems = const [];

  /// A [trigger] that opens a dropdown listing the collapsed [menuItems].
  const AsnBreadcrumbItem.dropdown({
    required Widget this.trigger,
    required this.menuItems,
  }) : _kind = _AsnBreadcrumbItemKind.dropdown,
       label = null,
       onTap = null;

  final _AsnBreadcrumbItemKind _kind;
  final Widget? label;
  final VoidCallback? onTap;
  final Widget? trigger;
  final List<AsnBreadcrumbMenuItem> menuItems;

  Widget _build() {
    return switch (_kind) {
      _AsnBreadcrumbItemKind.link => ShadBreadcrumbLink(
        onPressed: onTap,
        child: label!,
      ),
      _AsnBreadcrumbItemKind.ellipsis => const ShadBreadcrumbEllipsis(),
      _AsnBreadcrumbItemKind.dropdown => ShadBreadcrumbDropdown(
        items: menuItems
            .map(
              (item) => ShadBreadcrumbDropMenuItem(
                onPressed: item.onTap,
                child: item.label,
              ),
            )
            .toList(),
        child: trigger!,
      ),
    };
  }
}

/// Hierarchical navigation path. Wraps `ShadBreadcrumb`.
class AsnBreadcrumb extends StatelessWidget {
  const AsnBreadcrumb({super.key, required this.items, this.separator});

  final List<AsnBreadcrumbItem> items;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      separator: separator,
      children: items.map((item) => item._build()).toList(),
    );
  }
}
