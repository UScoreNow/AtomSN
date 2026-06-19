import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'ax_context_menu.dart';

/// Menu de nivel superior dentro de un [AxMenubar].
@immutable
class AxMenu {
  const AxMenu({required this.label, required this.items});

  final String label;
  final List<AxMenuItem> items;
}

/// Barra de menus horizontal. Envuelve `ShadMenubar` con modelo propio.
class AxMenubar extends StatelessWidget {
  const AxMenubar({super.key, required this.menus});

  final List<AxMenu> menus;

  @override
  Widget build(BuildContext context) {
    return ShadMenubar(
      items: [
        for (final menu in menus)
          ShadMenubarItem(
            items: [
              for (final item in menu.items)
                ShadContextMenuItem(
                  enabled: item.enabled,
                  leading: item.icon,
                  onPressed: item.onTap,
                  child: Text(item.label),
                ),
            ],
            child: Text(menu.label),
          ),
      ],
    );
  }
}
