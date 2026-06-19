import 'package:flutter/widgets.dart';

import '../../foundations/radius/ax_radius.dart';
import '../../theme/ax_theme.dart';

/// Placeholder de carga con pulso. Widget propio (gap de shadcn_ui), inspirado
/// en el Skeleton de shadcn_flutter.
class AxSkeleton extends StatefulWidget {
  const AxSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius,
  });

  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  State<AxSkeleton> createState() => _AxSkeletonState();
}

class _AxSkeletonState extends State<AxSkeleton>
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
    final colors = AxTheme.of(context);
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
          borderRadius: widget.borderRadius ?? AxRadius.brSm,
        ),
      ),
    );
  }
}
