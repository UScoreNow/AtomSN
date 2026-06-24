import 'package:flutter/widgets.dart';

import '../../foundations/border/asn_borders.dart';
import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Color selector via a grid of swatches. Controlled custom widget.
///
/// Highlights the swatch equal to [value] with the theme's active border.
class AsnColorPicker extends StatelessWidget {
  const AsnColorPicker({
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
    final colors = AsnTheme.of(context);
    return Wrap(
      spacing: AsnSpacing.x2,
      runSpacing: AsnSpacing.x2,
      children: swatches.map((swatch) {
        final selected = value == swatch;
        return GestureDetector(
          onTap: onChanged == null ? null : () => onChanged!(swatch),
          child: Container(
            width: swatchSize,
            height: swatchSize,
            decoration: BoxDecoration(
              color: swatch,
              borderRadius: AsnRadius.brSm,
              border: Border.all(
                color: selected ? colors.borderActive : colors.borderDefault,
                width: selected ? AsnBorders.section : AsnBorders.hairline,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
