import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Item of an [AsnNavigationMenu].
@immutable
class AsnNavItem {
  const AsnNavItem({required this.label, this.onTap, this.selected = false});

  final String label;
  final VoidCallback? onTap;
  final bool selected;
}

/// Horizontal navigation with the active item underlined. Custom widget.
///
/// The active item uses `actionPrimary`; the rest `textSecondary`.
class AsnNavigationMenu extends StatelessWidget {
  const AsnNavigationMenu({super.key, required this.items});

  final List<AsnNavItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: item.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AsnSpacing.x3),
              child: Container(
                padding: const EdgeInsets.only(bottom: AsnSpacing.x2),
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
