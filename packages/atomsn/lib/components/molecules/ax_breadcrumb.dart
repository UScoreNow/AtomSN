import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Item de un [AxBreadcrumb]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AxBreadcrumbItem {
  const AxBreadcrumbItem({required this.label, this.onTap});

  final Widget label;
  final VoidCallback? onTap;
}

/// Ruta de navegacion jerarquica. Envuelve `ShadBreadcrumb`.
class AxBreadcrumb extends StatelessWidget {
  const AxBreadcrumb({super.key, required this.items, this.separator});

  final List<AxBreadcrumbItem> items;
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
