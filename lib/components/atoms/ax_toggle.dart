import 'package:flutter/widgets.dart';

import '../../foundations/radius/ax_radius.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Boton de dos estados (pressed/unpressed) controlado. Widget propio (gap de
/// shadcn_ui), inspirado en el Toggle de shadcn_flutter.
class AxToggle extends StatelessWidget {
  const AxToggle({
    super.key,
    required this.value,
    required this.child,
    this.onChanged,
    this.enabled = true,
  });

  final bool value;
  final Widget child;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    final active = value;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(
        onTap: enabled && onChanged != null ? () => onChanged!(!value) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AxSpacing.x3,
            vertical: AxSpacing.x2,
          ),
          decoration: BoxDecoration(
            color: active ? colors.actionSubtle : colors.bgBase,
            borderRadius: AxRadius.brSm,
            border: Border.all(
              color: active ? colors.borderActive : colors.borderDefault,
            ),
          ),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: active ? colors.actionActive : colors.textPrimary,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
