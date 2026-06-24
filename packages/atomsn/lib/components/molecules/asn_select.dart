import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Option of an [AsnSelect]. Own model (does not leak `Shad*` types).
@immutable
class AsnSelectOption<T> {
  const AsnSelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Controlled single-value dropdown selector. Wraps `ShadSelect`.
class AsnSelect<T> extends StatelessWidget {
  const AsnSelect({
    super.key,
    required this.options,
    this.value,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  });

  final List<AsnSelectOption<T>> options;
  final T? value;
  final String? placeholder;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ShadSelect<T>(
      enabled: enabled,
      initialValue: value,
      placeholder: placeholder == null ? null : Text(placeholder!),
      onChanged: onChanged,
      // Hugeicons chevron (the system's single icon library) instead of shadcn's
      // default Lucide chevronDown. Dimmed tint like the default trailing.
      trailing: HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDown01,
        size: 16,
        strokeWidth: 1.5,
        color: ShadTheme.of(context).colorScheme.foreground.withValues(alpha: .5),
      ),
      options: options
          .map(
            (option) =>
                ShadOption<T>(value: option.value, child: Text(option.label)),
          )
          .toList(),
      selectedOptionBuilder: (context, selected) {
        for (final option in options) {
          if (option.value == selected) return Text(option.label);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
