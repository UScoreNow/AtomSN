import 'package:flutter/widgets.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Node of an [AsnTree].
@immutable
class AsnTreeNode {
  const AsnTreeNode({
    required this.id,
    required this.label,
    this.children = const [],
  });

  final String id;
  final String label;
  final List<AsnTreeNode> children;
}

/// Controlled expandable tree. Own widget.
///
/// The expansion state lives outside ([expandedIds]); each toggle is notified
/// via [onToggle]. Indents the children and shows an expansion glyph.
class AsnTree extends StatelessWidget {
  const AsnTree({
    super.key,
    required this.roots,
    required this.expandedIds,
    this.onToggle,
  });

  final List<AsnTreeNode> roots;
  final Set<String> expandedIds;
  final ValueChanged<String>? onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [for (final node in roots) ..._buildNode(colors, node, 0)],
    );
  }

  List<Widget> _buildNode(AsnSemanticColors colors, AsnTreeNode node, int depth) {
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
            left: depth * AsnSpacing.x4,
            top: AsnSpacing.x1,
            bottom: AsnSpacing.x1,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: AsnSpacing.x4,
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
