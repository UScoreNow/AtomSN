import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Entry of an [AsnTimeline].
@immutable
class AsnTimelineEntry {
  const AsnTimelineEntry({required this.title, this.time, this.child});

  final String title;
  final String? time;
  final Widget? child;
}

/// Vertical timeline. Own widget.
///
/// Draws the rail with `borderSection` and the nodes with `borderStrong`.
class AsnTimeline extends StatelessWidget {
  const AsnTimeline({super.key, required this.entries});

  final List<AsnTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < entries.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      width: AsnSpacing.x3,
                      height: AsnSpacing.x3,
                      margin: const EdgeInsets.only(top: AsnSpacing.x1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.borderStrong,
                      ),
                    ),
                    if (i != entries.length - 1)
                      Expanded(
                        child: Container(width: 2, color: colors.borderSection),
                      ),
                  ],
                ),
                const SizedBox(width: AsnSpacing.x3),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AsnSpacing.x5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entries[i].title,
                          style: TextStyle(color: colors.textPrimary),
                        ),
                        if (entries[i].time != null) ...[
                          const SizedBox(height: AsnSpacing.x1),
                          Text(
                            entries[i].time!,
                            style: TextStyle(
                              color: colors.textTertiary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                        if (entries[i].child != null) ...[
                          const SizedBox(height: AsnSpacing.x2),
                          entries[i].child!,
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
