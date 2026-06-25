import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Switch bound to an [AsnForm]. Wraps `ShadSwitchFormField`.
class AsnSwitchFormField extends StatelessWidget {
  const AsnSwitchFormField({
    super.key,
    required this.id,
    this.initialValue = false,
    this.label,
    this.description,
    this.inputLabel,
    this.inputSublabel,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final bool initialValue;

  /// Field label, rendered above the control.
  final String? label;
  final String? description;

  /// Label rendered next to the switch itself.
  final Widget? inputLabel;
  final Widget? inputSublabel;
  final String? Function(bool value)? validator;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadSwitchFormField(
      id: id,
      initialValue: initialValue,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      inputLabel: inputLabel,
      inputSublabel: inputSublabel,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
