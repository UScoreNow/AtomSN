import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Item de un [AsnCommand].
@immutable
class AsnCommandItem {
  const AsnCommandItem({
    required this.label,
    this.onSelected,
    this.keywords = const [],
  });

  final String label;
  final VoidCallback? onSelected;

  /// Terminos extra para el filtrado, ademas de [label].
  final List<String> keywords;
}

/// Paleta de comandos con busqueda. Widget propio.
///
/// Filtra por [AsnCommandItem.label] y [AsnCommandItem.keywords] segun el texto
/// escrito; la seleccion se notifica via callback del item.
class AsnCommand extends StatefulWidget {
  const AsnCommand({
    super.key,
    required this.items,
    this.placeholder = 'Buscar...',
  });

  final List<AsnCommandItem> items;
  final String placeholder;

  @override
  State<AsnCommand> createState() => _AsnCommandState();
}

class _AsnCommandState extends State<AsnCommand> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<AsnCommandItem> get _filtered {
    if (_query.isEmpty) return widget.items;
    final q = _query.toLowerCase();
    return widget.items.where((item) {
      if (item.label.toLowerCase().contains(q)) return true;
      return item.keywords.any((k) => k.toLowerCase().contains(q));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    final results = _filtered;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: AsnRadius.brMd,
        border: Border.all(color: colors.borderDefault),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AsnSpacing.x3),
            child: Stack(
              children: [
                if (_query.isEmpty)
                  Text(
                    widget.placeholder,
                    style: TextStyle(color: colors.textMuted, fontSize: 14),
                  ),
                EditableText(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true,
                  style: TextStyle(color: colors.textPrimary, fontSize: 14),
                  cursorColor: colors.actionPrimary,
                  backgroundCursorColor: colors.borderSubtle,
                  onChanged: (value) => setState(() => _query = value),
                ),
              ],
            ),
          ),
          Container(height: 1, color: colors.borderHairline),
          Flexible(
            child: results.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(AsnSpacing.x4),
                    child: Text(
                      'Sin resultados',
                      style: TextStyle(color: colors.textMuted),
                    ),
                  )
                : ListView(
                    shrinkWrap: true,
                    children: [
                      for (final item in results)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: item.onSelected,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AsnSpacing.x3,
                              vertical: AsnSpacing.x3,
                            ),
                            child: Text(
                              item.label,
                              style: TextStyle(color: colors.textPrimary),
                            ),
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
