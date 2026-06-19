import 'package:flutter/widgets.dart';

import '../../foundations/radius/ax_radius.dart';
import '../../theme/ax_theme.dart';
import '../atoms/atoms.dart';

/// Celda de un [AxTracker]. Modelo propio.
@immutable
class AxTrackerCell {
  const AxTrackerCell({this.color, this.tooltip});

  /// Color de relleno; si es null usa el verde de estado del tema.
  final Color? color;
  final String? tooltip;
}

/// Fila horizontal de celdas de estado (tipo tracker de uptime). Widget propio.
class AxTracker extends StatelessWidget {
  const AxTracker({
    super.key,
    required this.cells,
    this.cellWidth = 6,
    this.cellHeight = 28,
    this.gap = 2,
  });

  final List<AxTrackerCell> cells;
  final double cellWidth;
  final double cellHeight;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    final children = <Widget>[];
    for (var i = 0; i < cells.length; i++) {
      final cell = cells[i];
      Widget bar = Container(
        width: cellWidth,
        height: cellHeight,
        decoration: BoxDecoration(
          color: cell.color ?? colors.statusSuccess,
          borderRadius: AxRadius.brXs,
        ),
      );
      if (cell.tooltip != null) {
        bar = AxTooltip(message: cell.tooltip!, child: bar);
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
