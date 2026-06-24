import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

/// Labeled block that wraps the demonstration of a component.
class DemoBlock extends StatelessWidget {
  const DemoBlock({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AsnSpacing.x4),
      padding: const EdgeInsets.all(AsnSpacing.x4),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        // Concentric corners: the standard child (md radius) is inset by the
        // x4 padding -> the container uses md + x4 so the curves match up.
        borderRadius: AsnRadius.brConcentric(AsnRadius.md, AsnSpacing.x4),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AsnTextTheme.sansFamily,
              fontSize: AsnFontSize.sm,
              fontWeight: AsnFontWeight.semibold,
              letterSpacing: 0.6,
              color: colors.textMuted,
            ),
          ),
          const AsnSeparator(space: AsnSpacing.x5),
          DefaultTextStyle.merge(
            style: TextStyle(color: colors.textPrimary),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Vertical list of blocks with consistent padding for a screen.
class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key, required this.blocks});

  final List<Widget> blocks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AsnSpacing.x4),
      children: blocks,
    );
  }
}
