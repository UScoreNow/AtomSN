import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Item de un [AsnBreadcrumb]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AsnBreadcrumbItem {
  const AsnBreadcrumbItem({required this.label, this.onTap});

  final Widget label;
  final VoidCallback? onTap;
}

/// Ruta de navegacion jerarquica. Envuelve `ShadBreadcrumb`.
class AsnBreadcrumb extends StatelessWidget {
  const AsnBreadcrumb({super.key, required this.items, this.separator});

  final List<AsnBreadcrumbItem> items;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      separator: separator,
      children: items
          .map(
            (item) =>
                ShadBreadcrumbLink(onPressed: item.onTap, child: item.label),
          )
          .toList(),
    );
  }
}
