import 'package:flutter/widgets.dart';

import '../../foundations/radius/ax_radius.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Item de un [AxCommand].
@immutable
class AxCommandItem {
  const AxCommandItem({
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
/// Filtra por [AxCommandItem.label] y [AxCommandItem.keywords] segun el texto
/// escrito; la seleccion se notifica via callback del item.
class AxCommand extends StatefulWidget {
  const AxCommand({
    super.key,
    required this.items,
    this.placeholder = 'Buscar...',
  });

  final List<AxCommandItem> items;
  final String placeholder;

  @override
  State<AxCommand> createState() => _AxCommandState();
}

class _AxCommandState extends State<AxCommand> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<AxCommandItem> get _filtered {
    if (_query.isEmpty) return widget.items;
    final q = _query.toLowerCase();
    return widget.items.where((item) {
      if (item.label.toLowerCase().contains(q)) return true;
      return item.keywords.any((k) => k.toLowerCase().contains(q));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    final results = _filtered;
    return Container(
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: AxRadius.brMd,
        border: Border.all(color: colors.borderDefault),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AxSpacing.x3),
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
                    padding: const EdgeInsets.all(AxSpacing.x4),
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
                              horizontal: AxSpacing.x3,
                              vertical: AxSpacing.x3,
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
