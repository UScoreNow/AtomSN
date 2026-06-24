import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Centered layout for authentication forms. Own template.
///
/// Centered card with [title], the [child] form and an optional [footer],
/// with the theme's card style.
class AsnAuthLayout extends StatelessWidget {
  const AsnAuthLayout({
    super.key,
    required this.title,
    required this.child,
    this.footer,
    this.maxWidth = 400,
  });

  final Widget title;
  final Widget child;
  final Widget? footer;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return ColoredBox(
      color: colors.bgBase,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AsnSpacing.x6),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                padding: const EdgeInsets.all(AsnSpacing.x6),
                decoration: BoxDecoration(
                  color: colors.bgSurface,
                  borderRadius: AsnRadius.brMd,
                  border: Border.all(color: colors.borderDefault),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTextStyle.merge(
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      child: title,
                    ),
                    const SizedBox(height: AsnSpacing.x6),
                    child,
                    if (footer != null) ...[
                      const SizedBox(height: AsnSpacing.x5),
                      DefaultTextStyle.merge(
                        style: TextStyle(color: colors.textTertiary),
                        textAlign: TextAlign.center,
                        child: footer!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
