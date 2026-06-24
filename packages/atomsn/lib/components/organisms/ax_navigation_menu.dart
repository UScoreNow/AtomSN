import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Item de un [AxNavigationMenu].
@immutable
class AxNavItem {
  const AxNavItem({required this.label, this.onTap, this.selected = false});

  final String label;
  final VoidCallback? onTap;
  final bool selected;
}

/// Navegacion horizontal con item activo subrayado. Widget propio.
///
/// El item activo usa `actionPrimary`; el resto `textSecondary`.
class AxNavigationMenu extends StatelessWidget {
  const AxNavigationMenu({super.key, required this.items});

  final List<AxNavItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: item.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AxSpacing.x3),
              child: Container(
                padding: const EdgeInsets.only(bottom: AxSpacing.x2),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: item.selected
                          ? colors.actionPrimary
                          : const Color(0x00000000),
                    ),
                  ),
                ),
                child: Text(
                  item.label,
                  style: TextStyle(
                    color: item.selected
                        ? colors.actionPrimary
                        : colors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
