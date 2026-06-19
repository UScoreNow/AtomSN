import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../atoms/atoms.dart';

/// Paginador controlado. Widget propio.
///
/// [page] es la pagina actual (base 1). [pageCount] es el total de paginas.
/// [onChanged] reporta la pagina destino al pulsar un control.
class AxPagination extends StatelessWidget {
  const AxPagination({
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
      AxButton(
        variant: AxButtonVariant.outline,
        size: AxButtonSize.sm,
        enabled: page > 1,
        onPressed: () => _go(page - 1),
        child: const Text('Anterior'),
      ),
    ];

    for (var i = 1; i <= pageCount; i++) {
      buttons.add(
        AxButton(
          variant: i == page ? AxButtonVariant.primary : AxButtonVariant.ghost,
          size: AxButtonSize.sm,
          onPressed: () => _go(i),
          child: Text('$i'),
        ),
      );
    }

    buttons.add(
      AxButton(
        variant: AxButtonVariant.outline,
        size: AxButtonSize.sm,
        enabled: page < pageCount,
        onPressed: () => _go(page + 1),
        child: const Text('Siguiente'),
      ),
    );

    return Wrap(
      spacing: AxSpacing.x2,
      runSpacing: AxSpacing.x2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: buttons,
    );
  }
}
