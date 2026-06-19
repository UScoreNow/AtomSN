import 'package:flutter/widgets.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Nodo de un [AxTree].
@immutable
class AxTreeNode {
  const AxTreeNode({
    required this.id,
    required this.label,
    this.children = const [],
  });

  final String id;
  final String label;
  final List<AxTreeNode> children;
}

/// Arbol expandible controlado. Widget propio.
///
/// El estado de expansion vive fuera ([expandedIds]); cada toggle se notifica
/// via [onToggle]. Indenta los hijos y muestra un glifo de expansion.
class AxTree extends StatelessWidget {
  const AxTree({
    super.key,
    required this.roots,
    required this.expandedIds,
    this.onToggle,
  });

  final List<AxTreeNode> roots;
  final Set<String> expandedIds;
  final ValueChanged<String>? onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [for (final node in roots) ..._buildNode(colors, node, 0)],
    );
  }

  List<Widget> _buildNode(AxSemanticColors colors, AxTreeNode node, int depth) {
    final hasChildren = node.children.isNotEmpty;
    final expanded = expandedIds.contains(node.id);
    return [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: hasChildren && onToggle != null
            ? () => onToggle!(node.id)
            : null,
        child: Padding(
          padding: EdgeInsets.only(
            left: depth * AxSpacing.x4,
            top: AxSpacing.x1,
            bottom: AxSpacing.x1,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: AxSpacing.x4,
                child: hasChildren
                    ? Text(
                        expanded ? '▾' : '▸',
                        style: TextStyle(color: colors.textSecondary),
                      )
                    : null,
              ),
              Text(node.label, style: TextStyle(color: colors.textPrimary)),
            ],
          ),
        ),
      ),
      if (hasChildren && expanded)
        for (final child in node.children)
          ..._buildNode(colors, child, depth + 1),
    ];
  }
}
