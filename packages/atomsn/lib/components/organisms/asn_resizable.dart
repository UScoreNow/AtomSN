import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Axis of an [AsnResizable].
enum AsnResizableAxis { horizontal, vertical }

/// Group of resizable panels. Wraps `ShadResizablePanelGroup`.
///
/// Distributes the space in equal parts among [panels] by default.
class AsnResizable extends StatelessWidget {
  const AsnResizable({
    super.key,
    required this.panels,
    this.axis = AsnResizableAxis.horizontal,
    this.minSize = 0.1,
  });

  final List<Widget> panels;
  final AsnResizableAxis axis;

  /// Minimum size of each panel as a fraction of the total (0..1).
  final double minSize;

  @override
  Widget build(BuildContext context) {
    final defaultSize = panels.isEmpty ? 1.0 : 1.0 / panels.length;
    return ShadResizablePanelGroup(
      axis: axis == AsnResizableAxis.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        for (var i = 0; i < panels.length; i++)
          ShadResizablePanel(
            id: i,
            defaultSize: defaultSize,
            minSize: minSize,
            child: panels[i],
          ),
      ],
    );
  }
}
