import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Modo de expansion de [AxAccordion].
enum AxAccordionType { single, multiple }

/// Item de un [AxAccordion]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AxAccordionItem {
  const AxAccordionItem({required this.title, required this.content});

  final Widget title;
  final Widget content;
}

/// Lista de secciones plegables. Envuelve `ShadAccordion`.
///
/// Cada item se identifica internamente por su indice en [items].
class AxAccordion extends StatelessWidget {
  const AxAccordion({
    super.key,
    required this.items,
    this.type = AxAccordionType.single,
  });

  final List<AxAccordionItem> items;
  final AxAccordionType type;

  List<Widget> _buildItems(BuildContext context) {
    // Chevron de Hugeicons (libreria unica del sistema) en vez del chevronDown
    // Lucide por defecto de shadcn. shadcn rota el icono al expandir.
    final iconColor = ShadTheme.of(context).colorScheme.foreground;
    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      children.add(
        ShadAccordionItem<int>(
          value: i,
          title: item.title,
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowDown01,
            size: 16,
            strokeWidth: 1.5,
            color: iconColor,
          ),
          child: item.content,
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      AxAccordionType.single =>
        ShadAccordion<int>(children: _buildItems(context)),
      AxAccordionType.multiple => ShadAccordion<int>.multiple(
        children: _buildItems(context),
      ),
    };
  }
}
