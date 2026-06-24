import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Text tooltip over [child]. Wraps `ShadTooltip`.
class AsnTooltip extends StatelessWidget {
  const AsnTooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadTooltip(builder: (context) => Text(message), child: child);
  }
}
