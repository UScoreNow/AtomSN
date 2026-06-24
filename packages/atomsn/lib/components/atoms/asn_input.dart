import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Campo de texto de una linea. Envuelve `ShadInput`.
class AsnInput extends StatelessWidget {
  const AsnInput({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      controller: controller,
      initialValue: initialValue,
      placeholder: placeholder == null ? null : Text(placeholder!),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      keyboardType: keyboardType,
      leading: leading,
      trailing: trailing,
      enabled: enabled,
    );
  }
}
