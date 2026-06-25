import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'asn_time_picker.dart';

ShadTimeOfDay? _toShadTime(AsnTime? time) => time == null
    ? null
    : ShadTimeOfDay(hour: time.hour, minute: time.minute, second: time.second);

AsnTime? _fromShadTime(ShadTimeOfDay? time) => time == null
    ? null
    : AsnTime(hour: time.hour, minute: time.minute, second: time.second);

/// Time picker bound to an [AsnForm]. Wraps `ShadTimePickerFormField`.
class AsnTimePickerFormField extends StatelessWidget {
  const AsnTimePickerFormField({
    super.key,
    required this.id,
    this.initialValue,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final AsnTime? initialValue;
  final String? label;
  final String? description;
  final String? Function(AsnTime? value)? validator;
  final ValueChanged<AsnTime?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadTimePickerFormField(
      id: id,
      initialValue: _toShadTime(initialValue),
      enabled: enabled,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator == null
          ? null
          : (time) => validator!(_fromShadTime(time)),
      onChanged: onChanged == null
          ? null
          : (time) => onChanged!(_fromShadTime(time)),
    );
  }
}
