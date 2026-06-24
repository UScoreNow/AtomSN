import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';

/// Controlled expandable/collapsible section. Custom widget.
///
/// The state is dictated by [expanded]; tapping the header reports the new
/// value via [onChanged]. The height transition uses [AnimatedSize].
class AsnCollapsible extends StatelessWidget {
  const AsnCollapsible({
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
                  padding: const EdgeInsets.only(top: AsnSpacing.x2),
                  child: child,
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
