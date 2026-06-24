import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Campo de texto multilinea. Envuelve `ShadTextarea`.
class AxTextarea extends StatelessWidget {
  const AxTextarea({
    super.key,
    this.controller,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadTextarea(
      controller: controller,
      placeholder: placeholder == null ? null : Text(placeholder!),
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
