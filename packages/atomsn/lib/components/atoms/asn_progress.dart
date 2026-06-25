import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Progress bar. Wraps `ShadProgress`.
///
/// Two modes: determinate (a [value] in 0..1) or indeterminate (animated, no
/// value). The default constructor infers the mode from [value]; use the
/// [AsnProgress.determinate] / [AsnProgress.indeterminate] factories to state
/// it explicitly.
class AsnProgress extends StatelessWidget {
  const AsnProgress({super.key, this.value, this.minHeight});

  /// Determinate bar filled to [value] (clamped to 0..1 by shadcn).
  const AsnProgress.determinate(double this.value, {super.key, this.minHeight});

  /// Indeterminate (animated) bar with no fixed value.
  const AsnProgress.indeterminate({super.key, this.minHeight}) : value = null;

  final double? value;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return ShadProgress(value: value, minHeight: minHeight);
  }
}
