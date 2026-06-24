import 'package:flutter/widgets.dart';

import '../../theme/ax_theme.dart';

/// Numero que anima la transicion al cambiar de valor. Widget propio (gap de
/// shadcn_ui), inspirado en el Number Ticker de shadcn_flutter.
///
/// Usa cifras tabulares para evitar saltos de ancho.
class AxNumberTicker extends StatelessWidget {
  const AxNumberTicker({
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
    final colors = AxTheme.of(context);
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
