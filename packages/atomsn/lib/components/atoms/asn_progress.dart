import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Progress bar. Wraps `ShadProgress`.
///
/// If [value] is null, shows indeterminate progress.
class AsnProgress extends StatelessWidget {
  const AsnProgress({super.key, this.value, this.minHeight});

  final double? value;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return ShadProgress(value: value, minHeight: minHeight);
  }
}
