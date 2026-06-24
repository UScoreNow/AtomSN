import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Casilla de verificacion controlada. Envuelve `ShadCheckbox`.
class AxCheckbox extends StatelessWidget {
  const AxCheckbox({
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
    return ShadCheckbox(
      value: value,
      onChanged: onChanged,
      enabled: enabled,
      label: label,
      sublabel: sublabel,
      // Tick de Hugeicons (libreria unica del sistema) en vez del check Lucide
      // por defecto de shadcn. Color = primaryForeground (tinta sobre relleno).
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedTick02,
        size: 14,
        strokeWidth: 2,
        color: ShadTheme.of(context).colorScheme.primaryForeground,
      ),
      // El texto principal queda centrado verticalmente con la casilla.
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
