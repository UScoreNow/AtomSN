import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Hora simple expuesta por [AsnTimePicker]. Modelo propio que adapta
/// `ShadTimeOfDay` sin filtrarlo en la API publica.
@immutable
class AsnTime {
  const AsnTime({required this.hour, required this.minute, this.second = 0});

  final int hour;
  final int minute;
  final int second;
}

/// Selector de hora controlado. Envuelve `ShadTimePicker`.
class AsnTimePicker extends StatelessWidget {
  const AsnTimePicker({super.key, this.value, this.onChanged});

  final AsnTime? value;
  final ValueChanged<AsnTime>? onChanged;

  @override
  Widget build(BuildContext context) {
    final initial = value;
    return ShadTimePicker(
      initialValue: initial == null
          ? null
          : ShadTimeOfDay(
              hour: initial.hour,
              minute: initial.minute,
              second: initial.second,
            ),
      onChanged: onChanged == null
          ? null
          : (time) => onChanged!(
              AsnTime(hour: time.hour, minute: time.minute, second: time.second),
            ),
    );
  }
}
