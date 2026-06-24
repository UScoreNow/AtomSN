import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Simple time exposed by [AsnTimePicker]. Own model that adapts
/// `ShadTimeOfDay` without leaking it in the public API.
@immutable
class AsnTime {
  const AsnTime({required this.hour, required this.minute, this.second = 0});

  final int hour;
  final int minute;
  final int second;
}

/// Controlled time picker. Wraps `ShadTimePicker`.
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
