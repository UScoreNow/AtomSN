import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Expansion mode of [AsnAccordion].
enum AsnAccordionType { single, multiple }

/// Item of an [AsnAccordion]. Custom model (does not leak `Shad*` types).
@immutable
class AsnAccordionItem {
  const AsnAccordionItem({required this.title, required this.content});

  final Widget title;
  final Widget content;
}

/// List of collapsible sections. Wraps `ShadAccordion`.
///
/// Each item is internally identified by its index in [items].
class AsnAccordion extends StatelessWidget {
  const AsnAccordion({
    super.key,
    required this.items,
    this.type = AsnAccordionType.single,
  });

  final List<AsnAccordionItem> items;
  final AsnAccordionType type;

  List<Widget> _buildItems(BuildContext context) {
    // Hugeicons chevron (the system's single library) instead of shadcn's
    // default Lucide chevronDown. shadcn rotates the icon when expanding.
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
