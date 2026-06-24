import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Boton de dos estados (pressed/unpressed) controlado. Widget propio (gap de
/// shadcn_ui), inspirado en el Toggle de shadcn_flutter.
class AsnToggle extends StatelessWidget {
  const AsnToggle({
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
    final colors = AsnTheme.of(context);
    final active = value;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(
        onTap: enabled && onChanged != null ? () => onChanged!(!value) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AsnSpacing.x3,
            vertical: AsnSpacing.x2,
          ),
          decoration: BoxDecoration(
            color: active ? colors.actionSubtle : colors.bgBase,
            borderRadius: AsnRadius.brSm,
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
