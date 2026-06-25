import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../atoms/asn_radio.dart';

/// Single-choice radio group bound to an [AsnForm].
/// Wraps `ShadRadioGroupFormField`.
class AsnRadioGroupFormField<T> extends StatelessWidget {
  const AsnRadioGroupFormField({
    super.key,
    required this.id,
    required this.options,
    this.initialValue,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.axis,
    this.spacing,
  });

  final String id;
  final List<AsnRadioOption<T>> options;
  final T? initialValue;
  final String? label;
  final String? description;
  final String? Function(T? value)? validator;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final Axis? axis;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return ShadRadioGroupFormField<T>(
      id: id,
      initialValue: initialValue,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator,
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
