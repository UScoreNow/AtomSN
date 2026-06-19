import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Orientacion de [AxSeparator].
enum AxSeparatorAxis { horizontal, vertical }

/// Regla separadora. Envuelve `ShadSeparator`.
class AxSeparator extends StatelessWidget {
  const AxSeparator({
    super.key,
    this.axis = AxSeparatorAxis.horizontal,
    this.thickness,
    this.margin,
  });

  final AxSeparatorAxis axis;
  final double? thickness;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      AxSeparatorAxis.horizontal => ShadSeparator.horizontal(
        thickness: thickness,
        margin: margin,
      ),
      AxSeparatorAxis.vertical => ShadSeparator.vertical(
        thickness: thickness,
        margin: margin,
      ),
    };
  }
}
