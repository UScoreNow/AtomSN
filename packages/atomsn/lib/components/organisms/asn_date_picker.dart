import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Selector de fecha controlado. Envuelve `ShadDatePicker`.
class AsnDatePicker extends StatelessWidget {
  const AsnDatePicker({super.key, this.selected, this.onChanged});

  final DateTime? selected;
  final ValueChanged<DateTime?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ShadDatePicker(selected: selected, onChanged: onChanged);
  }
}
