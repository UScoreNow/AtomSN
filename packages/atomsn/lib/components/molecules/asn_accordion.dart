import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Modo de expansion de [AsnAccordion].
enum AsnAccordionType { single, multiple }

/// Item de un [AsnAccordion]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AsnAccordionItem {
  const AsnAccordionItem({required this.title, required this.content});

  final Widget title;
  final Widget content;
}

/// Lista de secciones plegables. Envuelve `ShadAccordion`.
///
/// Cada item se identifica internamente por su indice en [items].
class AsnAccordion extends StatelessWidget {
  const AsnAccordion({
    super.key,
    required this.items,
    this.type = AsnAccordionType.single,
  });

  final List<AsnAccordionItem> items;
  final AsnAccordionType type;

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
      AsnAccordionType.single =>
        ShadAccordion<int>(children: _buildItems(context)),
      AsnAccordionType.multiple => ShadAccordion<int>.multiple(
        children: _buildItems(context),
      ),
    };
  }
}
