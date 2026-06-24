import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Barra de progreso. Envuelve `ShadProgress`.
///
/// Si [value] es null, muestra progreso indeterminado.
class AsnProgress extends StatelessWidget {
  const AsnProgress({super.key, this.value, this.minHeight});

  final double? value;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return ShadProgress(value: value, minHeight: minHeight);
  }
}
