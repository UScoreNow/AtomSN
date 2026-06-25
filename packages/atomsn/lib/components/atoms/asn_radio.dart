import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Single option of an [AsnRadioGroup]. Own model (does not leak `Shad*` types).
@immutable
class AsnRadioOption<T> {
  const AsnRadioOption({
    required this.value,
    required this.label,
    this.sublabel,
    this.enabled = true,
  });

  final T value;
  final Widget label;
  final Widget? sublabel;
  final bool enabled;
}

/// Single-choice radio group. Wraps `ShadRadioGroup`.
///
/// The selection lives in the group: each [AsnRadioOption] becomes a
/// `ShadRadio` that reads the active value from the group scope. The group is
/// uncontrolled, seed it with [initialValue] and observe [onChanged].
class AsnRadioGroup<T> extends StatelessWidget {
  const AsnRadioGroup({
    super.key,
    required this.options,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.axis,
    this.spacing,
  });

  final List<AsnRadioOption<T>> options;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final Axis? axis;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return ShadRadioGroup<T>(
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled,
      axis: axis,
      spacing: spacing,
      items: options
          .map(
            (option) => ShadRadio<T>(
              value: option.value,
              enabled: option.enabled,
              label: option.label,
              sublabel: option.sublabel,
            ),
          )
          .toList(),
    );
  }
}
