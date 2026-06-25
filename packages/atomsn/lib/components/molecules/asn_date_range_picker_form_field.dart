import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A start/end date range. Own model that adapts `ShadDateTimeRange` without
/// leaking it in the public API.
@immutable
class AsnDateRange {
  const AsnDateRange({this.start, this.end});

  final DateTime? start;
  final DateTime? end;
}

AsnDateRange? _fromShadRange(ShadDateTimeRange? range) =>
    range == null ? null : AsnDateRange(start: range.start, end: range.end);

ShadDateTimeRange? _toShadRange(AsnDateRange? range) =>
    range == null ? null : ShadDateTimeRange(start: range.start, end: range.end);

/// Date range picker bound to an [AsnForm].
/// Wraps `ShadDateRangePickerFormField`.
class AsnDateRangePickerFormField extends StatelessWidget {
  const AsnDateRangePickerFormField({
    super.key,
    required this.id,
    this.initialValue,
    this.placeholder,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final AsnDateRange? initialValue;
  final String? placeholder;
  final String? label;
  final String? description;
  final String? Function(AsnDateRange? value)? validator;
  final ValueChanged<AsnDateRange?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadDateRangePickerFormField(
      id: id,
      initialValue: _toShadRange(initialValue),
      enabled: enabled,
      placeholder: placeholder == null ? null : Text(placeholder!),
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator == null
          ? null
          : (range) => validator!(_fromShadRange(range)),
      onChanged: onChanged == null
          ? null
          : (range) => onChanged!(_fromShadRange(range)),
    );
  }
}
