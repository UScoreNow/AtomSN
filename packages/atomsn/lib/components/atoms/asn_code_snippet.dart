import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Bloque de codigo monoespaciado con boton de copiar. Widget propio (gap de
/// shadcn_ui), inspirado en el Code Snippet de shadcn_flutter.
class AsnCodeSnippet extends StatelessWidget {
  const AsnCodeSnippet({super.key, required this.code, this.onCopied});

  final String code;

  /// Se invoca tras copiar al portapapeles.
  final VoidCallback? onCopied;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colors.bgRaised,
        borderRadius: AsnRadius.brSm,
        border: Border.all(color: colors.borderDefault),
      ),
      padding: const EdgeInsets.all(AsnSpacing.x3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                height: 1.5,
                color: colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: AsnSpacing.x2),
          GestureDetector(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: code));
              onCopied?.call();
            },
            child: Text(
              'copy',
              style: TextStyle(fontSize: 12, color: colors.link),
            ),
          ),
        ],
      ),
    );
  }
}
