import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Controlled on/off switch. Wraps `ShadSwitch`.
class AsnSwitch extends StatelessWidget {
  const AsnSwitch({
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
