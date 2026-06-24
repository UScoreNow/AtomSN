import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Opcion de un [AxSelect]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AxSelectOption<T> {
  const AxSelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Selector desplegable controlado de un solo valor. Envuelve `ShadSelect`.
class AxSelect<T> extends StatelessWidget {
  const AxSelect({
    super.key,
    required this.options,
    this.value,
    this.placeholder,
    this.onChanged,
    this.enabled = true,
  });

  final List<AxSelectOption<T>> options;
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
      // Chevron de Hugeicons (libreria unica del sistema) en vez del chevronDown
      // Lucide por defecto de shadcn. Tinte atenuado como el trailing por defecto.
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
