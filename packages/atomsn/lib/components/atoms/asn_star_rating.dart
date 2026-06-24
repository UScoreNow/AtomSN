import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Controlled star rating. Custom widget (shadcn_ui gap),
/// inspired by shadcn_flutter's StarRating.
///
/// Uses the `star` icon from Hugeicons (strokeRounded style, the system's single
/// library). The filled/empty state is differentiated by COLOR, not by style
/// (design system rule): filled = `statusWarning`, empty = `borderStrong`.
class AsnStarRating extends StatelessWidget {
  const AsnStarRating({
    super.key,
    required this.value,
    this.count = 5,
    this.onChanged,
    this.size = 24,
  });

  /// Number of filled stars (0..[count]).
  final int value;
  final int count;
  final ValueChanged<int>? onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final filled = i < value;
        return GestureDetector(
          onTap: onChanged == null ? null : () => onChanged!(i + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AsnSpacing.x1 / 2),
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
