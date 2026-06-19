import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Valoracion por estrellas controlada. Widget propio (gap de shadcn_ui),
/// inspirado en el StarRating de shadcn_flutter.
///
/// Dibuja las estrellas con glifos para no depender de una libreria de iconos.
class AxStarRating extends StatelessWidget {
  const AxStarRating({
    super.key,
    required this.value,
    this.count = 5,
    this.onChanged,
    this.size = 24,
  });

  /// Numero de estrellas llenas (0..[count]).
  final int value;
  final int count;
  final ValueChanged<int>? onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final filled = i < value;
        return GestureDetector(
          onTap: onChanged == null ? null : () => onChanged!(i + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AxSpacing.x1 / 2),
            child: Text(
              filled ? '★' : '☆',
              style: TextStyle(
                fontSize: size,
                color: filled ? colors.statusWarning : colors.borderStrong,
                height: 1,
              ),
            ),
          ),
        );
      }),
    );
  }
}
