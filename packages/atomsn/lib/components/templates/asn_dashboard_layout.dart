import 'package:flutter/widgets.dart';

import '../../theme/asn_theme.dart';

/// Panel layout with sidebar. Own, responsive template.
///
/// At widths >= [breakpoint] it shows [sidebar] and [content] in a row; below
/// that it collapses the sidebar and only the content is visible.
class AsnDashboardLayout extends StatelessWidget {
  const AsnDashboardLayout({
    super.key,
    required this.sidebar,
    required this.content,
    this.sidebarWidth = 260,
    this.breakpoint = 768,
  });

  final Widget sidebar;
  final Widget content;
  final double sidebarWidth;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return ColoredBox(
      color: colors.bgBase,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final collapsed = constraints.maxWidth < breakpoint;
          if (collapsed) return content;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: sidebarWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.bgSurface,
                    border: Border(
                      right: BorderSide(color: colors.borderHairline),
                    ),
                  ),
                  child: sidebar,
                ),
              ),
              Expanded(child: content),
            ],
          );
        },
      ),
    );
  }
}
