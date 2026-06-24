import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Column of [AsnTable].
@immutable
class AsnTableColumn {
  const AsnTableColumn({required this.header});

  final Widget header;
}

/// Read-only static table. Wraps `ShadTable.list`.
///
/// Each row is a list of cells aligned with [columns]. Numeric cells
/// benefit from tabular figures in the text theme.
class AsnTable extends StatelessWidget {
  const AsnTable({super.key, required this.columns, required this.rows});

  final List<AsnTableColumn> columns;

  /// Rows; each row must have as many cells as [columns].
  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    return ShadTable.list(
      header: [
        for (final column in columns)
          ShadTableCell.header(child: column.header),
      ],
      children: [
        for (final row in rows)
          [for (final cell in row) ShadTableCell(child: cell)],
      ],
    );
  }
}
