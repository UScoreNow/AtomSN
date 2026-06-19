import 'package:flutter/widgets.dart';

import '../../foundations/border/ax_borders.dart';
import '../../foundations/radius/ax_radius.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Selector de color por rejilla de muestras. Widget propio controlado.
///
/// Resalta la muestra igual a [value] con el borde activo del tema.
class AxColorPicker extends StatelessWidget {
  const AxColorPicker({
    super.key,
    required this.swatches,
    this.value,
    this.onChanged,
    this.swatchSize = 28,
  });

  final List<Color> swatches;
  final Color? value;
  final ValueChanged<Color>? onChanged;
  final double swatchSize;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Wrap(
      spacing: AxSpacing.x2,
      runSpacing: AxSpacing.x2,
      children: swatches.map((swatch) {
        final selected = value == swatch;
        return GestureDetector(
          onTap: onChanged == null ? null : () => onChanged!(swatch),
          child: Container(
            width: swatchSize,
            height: swatchSize,
            decoration: BoxDecoration(
              color: swatch,
              borderRadius: AxRadius.brSm,
              border: Border.all(
                color: selected ? colors.borderActive : colors.borderDefault,
                width: selected ? AxBorders.section : AxBorders.hairline,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
