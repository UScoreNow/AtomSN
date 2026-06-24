import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../theme/asn_theme.dart';
import '../atoms/atoms.dart';

/// Cell of an [AsnTracker]. Own model.
@immutable
class AsnTrackerCell {
  const AsnTrackerCell({this.color, this.tooltip});

  /// Fill color; if null uses the theme's status green.
  final Color? color;
  final String? tooltip;
}

/// Horizontal row of status cells (uptime-tracker style). Own widget.
class AsnTracker extends StatelessWidget {
  const AsnTracker({
    super.key,
    required this.cells,
    this.cellWidth = 6,
    this.cellHeight = 28,
    this.gap = 2,
  });

  final List<AsnTrackerCell> cells;
  final double cellWidth;
  final double cellHeight;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    final children = <Widget>[];
    for (var i = 0; i < cells.length; i++) {
      final cell = cells[i];
      Widget bar = Container(
        width: cellWidth,
        height: cellHeight,
        decoration: BoxDecoration(
          color: cell.color ?? colors.statusSuccess,
          borderRadius: AsnRadius.brXs,
        ),
      );
      if (cell.tooltip != null) {
        bar = AsnTooltip(message: cell.tooltip!, child: bar);
      }
      if (i != 0) {
        bar = Padding(
          padding: EdgeInsets.only(left: gap),
          child: bar,
        );
      }
      children.add(bar);
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }
}
