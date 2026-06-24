import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Single-value slider control. Wraps `ShadSlider`.
class AsnSlider extends StatelessWidget {
  const AsnSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.enabled = true,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadSlider(
      initialValue: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      enabled: enabled,
    );
  }
}
