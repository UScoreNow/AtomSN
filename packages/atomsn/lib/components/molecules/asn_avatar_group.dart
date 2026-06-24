import 'package:flutter/widgets.dart';

import '../../foundations/border/asn_borders.dart';
import '../../foundations/radius/asn_radius.dart';
import '../../foundations/typography/asn_type_scale.dart';
import '../../theme/asn_theme.dart';
import '../atoms/atoms.dart';

/// Row of overlapping avatars with "+N" overflow. Custom widget.
class AsnAvatarGroup extends StatelessWidget {
  const AsnAvatarGroup({
    super.key,
    required this.srcs,
    this.max = 4,
    this.diameter = 32,
    this.overlap = 12,
  });

  final List<String> srcs;
  final int max;
  final double diameter;

  /// Overlap between avatars in px.
  final double overlap;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    final visible = srcs.length > max ? srcs.take(max).toList() : srcs;
    final overflow = srcs.length - visible.length;
    final size = Size.square(diameter);

    final spaced = <Widget>[];
    for (var i = 0; i < visible.length; i++) {
      final avatar = _ring(
        colors.bgBase,
        AsnAvatar(src: visible[i], size: size),
      );
      spaced.add(
        i == 0
            ? avatar
            : Transform.translate(
                offset: Offset(-overlap * i, 0),
                child: avatar,
              ),
      );
    }

    if (overflow > 0) {
      spaced.add(
        Transform.translate(
          offset: Offset(-overlap * visible.length, 0),
          child: _ring(
            colors.bgBase,
            Container(
              width: diameter,
              height: diameter,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.bgSubtle,
                borderRadius: AsnRadius.brFull,
              ),
              child: Text(
                '+$overflow',
                style: TextStyle(
                  fontSize: AsnFontSize.sm,
                  fontWeight: AsnFontWeight.medium,
                  color: colors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: spaced);
  }

  Widget _ring(Color borderColor, Widget child) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: AsnBorders.section),
      ),
      child: child,
    );
  }
}
