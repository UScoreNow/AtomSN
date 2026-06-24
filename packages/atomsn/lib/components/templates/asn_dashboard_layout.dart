import 'package:flutter/widgets.dart';

import '../../theme/asn_theme.dart';

/// Disposicion de panel con barra lateral. Plantilla propia y responsive.
///
/// En anchos >= [breakpoint] muestra [sidebar] y [content] en fila; por debajo
/// colapsa la barra lateral y solo se ve el contenido.
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
