import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../theme/asn_theme.dart';

/// Loading placeholder with a pulse. Own widget (shadcn_ui gap), inspired by
/// the Skeleton from shadcn_flutter.
class AsnSkeleton extends StatefulWidget {
  const AsnSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius,
  });

  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  State<AsnSkeleton> createState() => _AsnSkeletonState();
}

class _AsnSkeletonState extends State<AsnSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.4,
        end: 1,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: colors.bgRaised,
          borderRadius: widget.borderRadius ?? AsnRadius.brSm,
        ),
      ),
    );
  }
}
