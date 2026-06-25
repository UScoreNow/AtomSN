import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Checkbox bound to an [AsnForm]. Wraps `ShadCheckboxFormField`.
class AsnCheckboxFormField extends StatelessWidget {
  const AsnCheckboxFormField({
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

  /// Label rendered next to the checkbox itself.
  final Widget? inputLabel;
  final Widget? inputSublabel;
  final String? Function(bool value)? validator;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadCheckboxFormField(
      id: id,
      initialValue: initialValue,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      inputLabel: inputLabel,
      inputSublabel: inputSublabel,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      // Hugeicons tick (the system's single icon library), like AsnCheckbox.
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedTick02,
        size: 14,
        strokeWidth: 2,
        color: ShadTheme.of(context).colorScheme.primaryForeground,
      ),
    );
  }
}
