import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// `ScrollBehavior` que habilita el arrastre con raton y trackpad ademas del
/// tactil. Por defecto Flutter excluye el raton en web/escritorio, lo que dejaba
/// el [AxCarousel] sin poder deslizarse fuera de movil.
class _AxDragScrollBehavior extends ScrollBehavior {
  const _AxDragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => const {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
    PointerDeviceKind.invertedStylus,
  };
}

/// Carrusel paginado horizontal. Widget propio sobre `PageView`.
///
/// Muestra indicadores de pagina con `actionPrimary` (activo) y `border`
/// (inactivo).
class AxCarousel extends StatefulWidget {
  const AxCarousel({
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
  State<AxCarousel> createState() => _AxCarouselState();
}

class _AxCarouselState extends State<AxCarousel> {
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
    final colors = AxTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: ScrollConfiguration(
            behavior: const _AxDragScrollBehavior(),
            child: PageView(
              controller: _controller,
              onPageChanged: _onChanged,
              children: widget.items,
            ),
          ),
        ),
        if (widget.showIndicators && widget.items.length > 1) ...[
          const SizedBox(height: AxSpacing.x3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.items.length; i++)
                Container(
                  width: AxSpacing.x2,
                  height: AxSpacing.x2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: AxSpacing.x1 / 2,
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
