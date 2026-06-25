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

ShadTimeOfDay? _toShadTime(AsnTime? time) => time == null
    ? null
    : ShadTimeOfDay(
        hour: time.hour,
        minute: time.minute,
        second: time.second,
      );

AsnTime _fromShadTime(ShadTimeOfDay time) =>
    AsnTime(hour: time.hour, minute: time.minute, second: time.second);

/// Controlled time picker. Wraps `ShadTimePicker`.
class AsnTimePicker extends StatelessWidget {
  const AsnTimePicker({super.key, this.value, this.onChanged});

  final AsnTime? value;
  final ValueChanged<AsnTime>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ShadTimePicker(
      initialValue: _toShadTime(value),
      onChanged: onChanged == null
          ? null
          : (time) => onChanged!(_fromShadTime(time)),
    );
  }
}

/// Inline, single-segment time text field. Wraps `ShadTimePickerField`.
///
/// Unlike [AsnTimePicker] this is a single text input (one segment); its
/// [onChanged] reports the raw segment text.
class AsnTimePickerField extends StatelessWidget {
  const AsnTimePickerField({
    super.key,
    this.label,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  });

  final Widget? label;
  final Widget? placeholder;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadTimePickerField(
      label: label,
      placeholder: placeholder,
      enabled: enabled,
      onChanged: onChanged,
    );
  }
}
