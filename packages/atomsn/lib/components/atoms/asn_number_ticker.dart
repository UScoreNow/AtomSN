import 'package:flutter/widgets.dart';

import '../../theme/asn_theme.dart';

/// Number that animates the transition when its value changes. Own widget
/// (shadcn_ui gap), inspired by the Number Ticker from shadcn_flutter.
///
/// Uses tabular figures to avoid width jumps.
class AsnNumberTicker extends StatelessWidget {
  const AsnNumberTicker({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 600),
    this.fractionDigits = 0,
    this.style,
  });

  final double value;
  final Duration duration;
  final int fractionDigits;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    final baseStyle = (style ?? const TextStyle()).copyWith(
      color: style?.color ?? colors.textPrimary,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, animated, _) {
        return Text(animated.toStringAsFixed(fractionDigits), style: baseStyle);
      },
    );
  }
}
