import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';

/// Seccion expandible/colapsable controlada. Widget propio.
///
/// El estado lo dicta [expanded]; al pulsar la cabecera se reporta el nuevo
/// valor via [onChanged]. La transicion de altura usa [AnimatedSize].
class AxCollapsible extends StatelessWidget {
  const AxCollapsible({
    super.key,
    required this.expanded,
    required this.header,
    required this.child,
    this.onChanged,
    this.duration = const Duration(milliseconds: 200),
  });

  final bool expanded;
  final Widget header;
  final Widget child;
  final ValueChanged<bool>? onChanged;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onChanged == null ? null : () => onChanged!(!expanded),
          child: header,
        ),
        AnimatedSize(
          duration: duration,
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: expanded
              ? Padding(
                  padding: const EdgeInsets.only(top: AxSpacing.x2),
                  child: child,
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
