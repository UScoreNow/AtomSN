import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Calendario de seleccion de fecha unica. Envuelve `ShadCalendar`.
class AxCalendar extends StatelessWidget {
  const AxCalendar({
    super.key,
    this.selected,
    this.onChanged,
    this.initialMonth,
  });

  final DateTime? selected;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime? initialMonth;

  @override
  Widget build(BuildContext context) {
    return ShadCalendar(
      selected: selected,
      onChanged: onChanged,
      initialMonth: initialMonth,
    );
  }
}
