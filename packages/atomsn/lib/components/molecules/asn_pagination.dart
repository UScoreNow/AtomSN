import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../atoms/atoms.dart';

/// Controlled paginator. Own widget.
///
/// [page] is the current page (1-based). [pageCount] is the total number of
/// pages. [onChanged] reports the target page when a control is pressed.
class AsnPagination extends StatelessWidget {
  const AsnPagination({
    super.key,
    required this.page,
    required this.pageCount,
    this.onChanged,
  });

  final int page;
  final int pageCount;
  final ValueChanged<int>? onChanged;

  void _go(int target) {
    if (target < 1 || target > pageCount || target == page) return;
    onChanged?.call(target);
  }

  @override
  Widget build(BuildContext context) {
    final buttons = <Widget>[
      AsnButton(
        variant: AsnButtonVariant.outline,
        size: AsnButtonSize.sm,
        enabled: page > 1,
        onPressed: () => _go(page - 1),
        child: const Text('Previous'),
      ),
    ];

    for (var i = 1; i <= pageCount; i++) {
      buttons.add(
        AsnButton(
          variant: i == page ? AsnButtonVariant.primary : AsnButtonVariant.ghost,
          size: AsnButtonSize.sm,
          onPressed: () => _go(i),
          child: Text('$i'),
        ),
      );
    }

    buttons.add(
      AsnButton(
        variant: AsnButtonVariant.outline,
        size: AsnButtonSize.sm,
        enabled: page < pageCount,
        onPressed: () => _go(page + 1),
        child: const Text('Next'),
      ),
    );

    return Wrap(
      spacing: AsnSpacing.x2,
      runSpacing: AsnSpacing.x2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: buttons,
    );
  }
}
