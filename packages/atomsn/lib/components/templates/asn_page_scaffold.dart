import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Simple page scaffold. Own template (without Material's `Scaffold`).
///
/// Header with [title] and [actions] over `bgBase`, followed by the [body].
class AsnPageScaffold extends StatelessWidget {
  const AsnPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  /// Header title (text or widget).
  final Widget title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return ColoredBox(
      color: colors.bgBase,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(AsnSpacing.x4),
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
                          const SizedBox(width: AsnSpacing.x2),
                        ],
                      ],
                    ),
                ],
              ),
            ),
            Container(height: 1, color: colors.borderHairline),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AsnSpacing.x4),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
