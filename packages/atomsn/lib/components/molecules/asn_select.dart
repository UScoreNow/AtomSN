import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Option of an [AsnSelect] / [AsnMultiSelect]. Own model (no `Shad*` leak).
@immutable
class AsnSelectOption<T> {
  const AsnSelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Dimmed Hugeicons chevron shared by the select variants, instead of
/// shadcn's default Lucide chevronDown.
Widget asnSelectTrailing(BuildContext context) => HugeIcon(
  icon: HugeIcons.strokeRoundedArrowDown01,
  size: 16,
  strokeWidth: 1.5,
  color: ShadTheme.of(context).colorScheme.foreground.withValues(alpha: .5),
);

/// Controlled single-value dropdown selector. Wraps `ShadSelect`.
///
/// Use [AsnSelect.withSearch] to add a search field that reports its query
/// through [onSearchChanged]; for multi-value selection see [AsnMultiSelect].
class AsnSelect<T> extends StatelessWidget {
  const AsnSelect({
    super.key,
    required this.options,
    this.value,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  }) : _searchable = false,
       onSearchChanged = null,
       searchPlaceholder = null;

  /// Single-value selector with a search field at the top of the popover.
  const AsnSelect.withSearch({
    super.key,
    required this.options,
    this.value,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
    this.onSearchChanged,
    this.searchPlaceholder,
  }) : _searchable = true;

  final List<AsnSelectOption<T>> options;
  final T? value;
  final String? placeholder;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  /// Called with the search query as the user types (only with [withSearch]).
  final ValueChanged<String>? onSearchChanged;
  final String? searchPlaceholder;

  final bool _searchable;

  List<ShadOption<T>> _options() => options
      .map((o) => ShadOption<T>(value: o.value, child: Text(o.label)))
      .toList();

  Widget _selected(BuildContext context, T selected) {
    for (final option in options) {
      if (option.value == selected) return Text(option.label);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    if (_searchable) {
      return ShadSelect<T>.withSearch(
        enabled: enabled,
        initialValue: value,
        placeholder: placeholder == null ? null : Text(placeholder!),
        searchPlaceholder: searchPlaceholder == null
            ? null
            : Text(searchPlaceholder!),
        onChanged: onChanged,
        onSearchChanged: onSearchChanged ?? (_) {},
        trailing: asnSelectTrailing(context),
        options: _options(),
        selectedOptionBuilder: _selected,
      );
    }
    return ShadSelect<T>(
      enabled: enabled,
      initialValue: value,
      placeholder: placeholder == null ? null : Text(placeholder!),
      onChanged: onChanged,
      trailing: asnSelectTrailing(context),
      options: _options(),
      selectedOptionBuilder: _selected,
    );
  }
}

/// Controlled multi-value dropdown selector. Wraps `ShadSelect.multiple`.
///
/// Use [AsnMultiSelect.withSearch] to add a search field reported through
/// [onSearchChanged].
class AsnMultiSelect<T> extends StatelessWidget {
  const AsnMultiSelect({
    super.key,
    required this.options,
    this.values = const [],
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  }) : _searchable = false,
       onSearchChanged = null,
       searchPlaceholder = null;

  /// Multi-value selector with a search field at the top of the popover.
  const AsnMultiSelect.withSearch({
    super.key,
    required this.options,
    this.values = const [],
    this.placeholder,
    this.onChanged,
    this.enabled = true,
    this.onSearchChanged,
    this.searchPlaceholder,
  }) : _searchable = true;

  final List<AsnSelectOption<T>> options;
  final List<T> values;
  final String? placeholder;
  final ValueChanged<List<T>>? onChanged;
  final bool enabled;

  /// Called with the search query as the user types (only with [withSearch]).
  final ValueChanged<String>? onSearchChanged;
  final String? searchPlaceholder;

  final bool _searchable;

  List<ShadOption<T>> _options() => options
      .map((o) => ShadOption<T>(value: o.value, child: Text(o.label)))
      .toList();

  Widget _selected(BuildContext context, List<T> selected) {
    final labels = <String>[];
    for (final option in options) {
      if (selected.contains(option.value)) labels.add(option.label);
    }
    return Text(labels.join(', '));
  }

  void Function(Set<T>)? get _onChanged =>
      onChanged == null ? null : (set) => onChanged!(set.toList());

  @override
  Widget build(BuildContext context) {
    if (_searchable) {
      return ShadSelect<T>.multipleWithSearch(
        enabled: enabled,
        initialValues: values.toSet(),
        placeholder: placeholder == null ? null : Text(placeholder!),
        searchPlaceholder: searchPlaceholder == null
            ? null
            : Text(searchPlaceholder!),
        onChanged: _onChanged,
        onSearchChanged: onSearchChanged ?? (_) {},
        trailing: asnSelectTrailing(context),
        options: _options(),
        selectedOptionsBuilder: _selected,
      );
    }
    return ShadSelect<T>.multiple(
      enabled: enabled,
      initialValues: values.toSet(),
      placeholder: placeholder == null ? null : Text(placeholder!),
      onChanged: _onChanged,
      trailing: asnSelectTrailing(context),
      options: _options(),
      selectedOptionsBuilder: _selected,
    );
  }
}
