import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Interruptor on/off controlado. Envuelve `ShadSwitch`.
class AxSwitch extends StatelessWidget {
  const AxSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.sublabel,
    this.enabled = true,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? label;
  final Widget? sublabel;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadSwitch(
      value: value,
      onChanged: onChanged,
      enabled: enabled,
      label: label,
      sublabel: sublabel,
    );
  }
}
