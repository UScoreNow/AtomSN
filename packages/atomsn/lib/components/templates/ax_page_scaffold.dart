import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Andamiaje de pagina simple. Plantilla propia (sin `Scaffold` de Material).
///
/// Cabecera con [title] y [actions] sobre `bgBase`, seguida del [body].
class AxPageScaffold extends StatelessWidget {
  const AxPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  /// Titulo de la cabecera (texto o widget).
  final Widget title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return ColoredBox(
      color: colors.bgBase,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(AxSpacing.x4),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultTextStyle.merge(
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      child: title,
                    ),
                  ),
                  if (actions != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final action in actions!) ...[
                          action,
                          const SizedBox(width: AxSpacing.x2),
                        ],
                      ],
                    ),
                ],
              ),
            ),
            Container(height: 1, color: colors.borderHairline),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AxSpacing.x4),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
