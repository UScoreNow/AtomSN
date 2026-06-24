import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../atoms/atoms.dart';

/// Controlled tag (chip) input. Custom widget.
///
/// Shows the [values] as chips and a field to add new ones on confirm
/// (submit). Reports the full list via [onChanged]. To remove, a chip is
/// tapped.
class AsnChipInput extends StatefulWidget {
  const AsnChipInput({
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
  State<AsnChipInput> createState() => _AsnChipInputState();
}

class _AsnChipInputState extends State<AsnChipInput> {
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
            spacing: AsnSpacing.x2,
            runSpacing: AsnSpacing.x2,
            children: widget.values
                .map(
                  (value) => AsnBadge(
                    variant: AsnBadgeVariant.secondary,
                    onPressed: widget.enabled ? () => _remove(value) : null,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AsnSpacing.x2),
        ],
        AsnInput(
          controller: _controller,
          placeholder: widget.placeholder,
          enabled: widget.enabled,
          onSubmitted: _add,
        ),
      ],
    );
  }
}
