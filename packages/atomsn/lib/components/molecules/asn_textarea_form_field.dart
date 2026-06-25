import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Multiline text field bound to an [AsnForm]. Wraps `ShadTextareaFormField`.
class AsnTextareaFormField extends StatelessWidget {
  const AsnTextareaFormField({
    super.key,
    required this.id,
    this.label,
    this.description,
    this.placeholder,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final String? label;
  final String? description;
  final String? placeholder;
  final String? initialValue;
  final String? Function(String value)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadTextareaFormField(
      id: id,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      placeholder: placeholder == null ? null : Text(placeholder!),
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
