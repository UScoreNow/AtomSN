import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Entrada de un [AxTimeline].
@immutable
class AxTimelineEntry {
  const AxTimelineEntry({required this.title, this.time, this.child});

  final String title;
  final String? time;
  final Widget? child;
}

/// Linea de tiempo vertical. Widget propio.
///
/// Dibuja el rail con `borderSection` y los nodos con `borderStrong`.
class AxTimeline extends StatelessWidget {
  const AxTimeline({super.key, required this.entries});

  final List<AxTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
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
                      width: AxSpacing.x3,
                      height: AxSpacing.x3,
                      margin: const EdgeInsets.only(top: AxSpacing.x1),
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
                const SizedBox(width: AxSpacing.x3),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AxSpacing.x5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entries[i].title,
                          style: TextStyle(color: colors.textPrimary),
                        ),
                        if (entries[i].time != null) ...[
                          const SizedBox(height: AxSpacing.x1),
                          Text(
                            entries[i].time!,
                            style: TextStyle(
                              color: colors.textTertiary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                        if (entries[i].child != null) ...[
                          const SizedBox(height: AxSpacing.x2),
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
