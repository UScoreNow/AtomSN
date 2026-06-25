import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Date picker bound to an [AsnForm]. Wraps `ShadDatePickerFormField`.
class AsnDatePickerFormField extends StatelessWidget {
  const AsnDatePickerFormField({
    super.key,
    required this.id,
    this.initialValue,
    this.placeholder,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final DateTime? initialValue;
  final String? placeholder;
  final String? label;
  final String? description;
  final String? Function(DateTime? value)? validator;
  final ValueChanged<DateTime?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadDatePickerFormField(
      id: id,
      initialValue: initialValue,
      enabled: enabled,
      placeholder: placeholder == null ? null : Text(placeholder!),
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
