import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Valoracion por estrellas controlada. Widget propio (gap de shadcn_ui),
/// inspirado en el StarRating de shadcn_flutter.
///
/// Usa el icono `star` de Hugeicons (estilo strokeRounded, libreria unica del
/// sistema). El estado lleno/vacio se diferencia por COLOR, no por estilo
/// (regla del design system): relleno = `statusWarning`, vacio = `borderStrong`.
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
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedStar,
              size: size,
              strokeWidth: 1.5,
              color: filled ? colors.statusWarning : colors.borderStrong,
            ),
          ),
        );
      }),
    );
  }
}
