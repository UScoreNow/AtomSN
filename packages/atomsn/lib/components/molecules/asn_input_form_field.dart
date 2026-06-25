import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Single-line text field bound to an [AsnForm]. Wraps `ShadInputFormField`.
class AsnInputFormField extends StatelessWidget {
  const AsnInputFormField({
    super.key,
    required this.id,
    this.label,
    this.description,
    this.placeholder,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
  });

  final String id;
  final String? label;
  final String? description;
  final String? placeholder;
  final String? initialValue;
  final String? Function(String value)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: id,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      placeholder: placeholder == null ? null : Text(placeholder!),
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
