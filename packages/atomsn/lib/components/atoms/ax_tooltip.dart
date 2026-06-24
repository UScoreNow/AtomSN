import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Tooltip de texto sobre [child]. Envuelve `ShadTooltip`.
class AxTooltip extends StatelessWidget {
  const AxTooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadTooltip(builder: (context) => Text(message), child: child);
  }
}
