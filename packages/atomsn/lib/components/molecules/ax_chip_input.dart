import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../atoms/atoms.dart';

/// Entrada de etiquetas (chips) controlada. Widget propio.
///
/// Muestra los [values] como chips y un campo para anadir nuevos al confirmar
/// (submit). Reporta la lista completa via [onChanged]. Para eliminar, se pulsa
/// un chip.
class AxChipInput extends StatefulWidget {
  const AxChipInput({
    super.key,
    required this.values,
    this.onChanged,
    this.placeholder,
    this.enabled = true,
  });

  final List<String> values;
  final ValueChanged<List<String>>? onChanged;
  final String? placeholder;
  final bool enabled;

  @override
  State<AxChipInput> createState() => _AxChipInputState();
}

class _AxChipInputState extends State<AxChipInput> {
  final TextEditingController _controller = TextEditingController();

  void _add(String raw) {
    final value = raw.trim();
    if (value.isEmpty || widget.values.contains(value)) {
      _controller.clear();
      return;
    }
    widget.onChanged?.call([...widget.values, value]);
    _controller.clear();
  }

  void _remove(String value) {
    widget.onChanged?.call(widget.values.where((v) => v != value).toList());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.values.isNotEmpty) ...[
          Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            children: widget.values
                .map(
                  (value) => AxBadge(
                    variant: AxBadgeVariant.secondary,
                    onPressed: widget.enabled ? () => _remove(value) : null,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AxSpacing.x2),
        ],
        AxInput(
          controller: _controller,
          placeholder: widget.placeholder,
          enabled: widget.enabled,
          onSubmitted: _add,
        ),
      ],
    );
  }
}
