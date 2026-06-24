import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../foundations/radius/ax_radius.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Bloque de codigo monoespaciado con boton de copiar. Widget propio (gap de
/// shadcn_ui), inspirado en el Code Snippet de shadcn_flutter.
class AxCodeSnippet extends StatelessWidget {
  const AxCodeSnippet({super.key, required this.code, this.onCopied});

  final String code;

  /// Se invoca tras copiar al portapapeles.
  final VoidCallback? onCopied;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colors.bgRaised,
        borderRadius: AxRadius.brSm,
        border: Border.all(color: colors.borderDefault),
      ),
      padding: const EdgeInsets.all(AxSpacing.x3),
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
          const SizedBox(width: AxSpacing.x2),
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
