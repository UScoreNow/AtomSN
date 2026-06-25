import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'asn_select.dart';

/// Single-value dropdown bound to an [AsnForm]. Wraps `ShadSelectFormField`.
class AsnSelectFormField<T> extends StatelessWidget {
  const AsnSelectFormField({
    super.key,
    required this.id,
    required this.options,
    this.initialValue,
    this.placeholder,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final List<AsnSelectOption<T>> options;
  final T? initialValue;
  final String? placeholder;
  final String? label;
  final String? description;
  final String? Function(T? value)? validator;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  String _labelFor(T? value) {
    for (final option in options) {
      if (option.value == value) return option.label;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelectFormField<T>(
      id: id,
      initialValue: initialValue,
      enabled: enabled,
      placeholder: placeholder == null ? null : Text(placeholder!),
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator,
      onChanged: onChanged,
      options: options
          .map(
            (option) =>
                ShadOption<T>(value: option.value, child: Text(option.label)),
          )
          .toList(),
      selectedOptionBuilder: (context, value) => Text(_labelFor(value)),
    );
  }
}

/// Multi-value dropdown bound to an [AsnForm].
/// Wraps `ShadSelectMultipleFormField`.
class AsnSelectMultipleFormField<T> extends StatelessWidget {
  const AsnSelectMultipleFormField({
    super.key,
    required this.id,
    required this.options,
    this.initialValue = const [],
    this.placeholder,
    this.label,
    this.description,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  final String id;
  final List<AsnSelectOption<T>> options;
  final List<T> initialValue;
  final String? placeholder;
  final String? label;
  final String? description;
  final String? Function(List<T> values)? validator;
  final ValueChanged<List<T>>? onChanged;
  final bool enabled;

  String _labelsFor(List<T> values) {
    final labels = <String>[];
    for (final option in options) {
      if (values.contains(option.value)) labels.add(option.label);
    }
    return labels.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return ShadSelectMultipleFormField<T>(
      id: id,
      initialValue: initialValue.toSet(),
      enabled: enabled,
      placeholder: placeholder == null ? null : Text(placeholder!),
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      validator: validator == null
          ? null
          : (values) => validator!((values ?? const {}).toList()),
      onChanged: onChanged == null
          ? null
          : (values) => onChanged!((values ?? const {}).toList()),
      options: options
          .map(
            (option) =>
                ShadOption<T>(value: option.value, child: Text(option.label)),
          )
          .toList(),
      selectedOptionsBuilder: (context, values) => Text(_labelsFor(values)),
    );
  }
}
