import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// `ScrollBehavior` that enables dragging with mouse and trackpad in addition
/// to touch. By default Flutter excludes the mouse on web/desktop, which left
/// the [AsnCarousel] unable to be swiped outside of mobile.
class _AsnDragScrollBehavior extends ScrollBehavior {
  const _AsnDragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => const {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
    PointerDeviceKind.invertedStylus,
  };
}

/// Horizontal paginated carousel. Own widget on top of `PageView`.
///
/// Shows page indicators with `actionPrimary` (active) and `border`
/// (inactive).
class AsnCarousel extends StatefulWidget {
  const AsnCarousel({
    super.key,
    required this.items,
    this.height = 200,
    this.showIndicators = true,
    this.onPageChanged,
  });

  final List<Widget> items;
  final double height;
  final bool showIndicators;
  final ValueChanged<int>? onPageChanged;

  @override
  State<AsnCarousel> createState() => _AsnCarouselState();
}

class _AsnCarouselState extends State<AsnCarousel> {
  final _controller = PageController();
  int _current = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(int index) {
    setState(() => _current = index);
    widget.onPageChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: ScrollConfiguration(
            behavior: const _AsnDragScrollBehavior(),
            child: PageView(
              controller: _controller,
              onPageChanged: _onChanged,
              children: widget.items,
            ),
          ),
        ),
        if (widget.showIndicators && widget.items.length > 1) ...[
          const SizedBox(height: AsnSpacing.x3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.items.length; i++)
                Container(
                  width: AsnSpacing.x2,
                  height: AsnSpacing.x2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: AsnSpacing.x1 / 2,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _current
                        ? colors.actionPrimary
                        : colors.borderDefault,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
