import 'package:flutter/widgets.dart';

import '../../foundations/spacing/ax_spacing.dart';
import '../../foundations/typography/ax_type_scale.dart';
import '../../theme/ax_theme.dart';

/// Campo de formulario presentacional: etiqueta + control + texto auxiliar.
///
/// Wrapper propio (no usa el form de shadcn). Compone [label], [child] y, de
/// forma opcional, [description] o [error] usando los colores del tema.
class AxFormField extends StatelessWidget {
  const AxFormField({
    super.key,
    required this.label,
    required this.child,
    this.description,
    this.error,
  });

  final String label;
  final Widget child;
  final String? description;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    final hasError = error != null && error!.isNotEmpty;
    final helper = hasError ? error : description;
    final helperColor = hasError ? colors.statusErrorText : colors.textMuted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AxFontSize.md,
            fontWeight: AxFontWeight.medium,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: AxSpacing.x2),
        child,
        if (helper != null && helper.isNotEmpty) ...[
          const SizedBox(height: AxSpacing.x1),
          Text(
            helper,
            style: TextStyle(fontSize: AxFontSize.sm, color: helperColor),
          ),
        ],
      ],
    );
  }
}
