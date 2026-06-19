import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Barra de progreso. Envuelve `ShadProgress`.
///
/// Si [value] es null, muestra progreso indeterminado.
class AxProgress extends StatelessWidget {
  const AxProgress({super.key, this.value, this.minHeight});

  final double? value;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return ShadProgress(value: value, minHeight: minHeight);
  }
}
