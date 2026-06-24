import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../foundations/typography/asn_type_scale.dart';
import '../../theme/asn_theme.dart';

/// Campo de formulario presentacional: etiqueta + control + texto auxiliar.
///
/// Wrapper propio (no usa el form de shadcn). Compone [label], [child] y, de
/// forma opcional, [description] o [error] usando los colores del tema.
class AsnFormField extends StatelessWidget {
  const AsnFormField({
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
    final colors = AsnTheme.of(context);
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
            fontSize: AsnFontSize.md,
            fontWeight: AsnFontWeight.medium,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: AsnSpacing.x2),
        child,
        if (helper != null && helper.isNotEmpty) ...[
          const SizedBox(height: AsnSpacing.x1),
          Text(
            helper,
            style: TextStyle(fontSize: AsnFontSize.sm, color: helperColor),
          ),
        ],
      ],
    );
  }
}
