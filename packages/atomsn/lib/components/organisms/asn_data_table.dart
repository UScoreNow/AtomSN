import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Column of [AsnDataTable]. If [onSort] is not null, the header is tappable.
@immutable
class AsnDataColumn {
  const AsnDataColumn({required this.label, this.onSort});

  final String label;
  final VoidCallback? onSort;
}

/// Top-level data table with a sortable header. Custom widget.
///
/// Draws rules with `borderHairline` and the header over `bgSubtle`. The
/// columns are distributed in equal parts.
class AsnDataTable extends StatelessWidget {
  const AsnDataTable({super.key, required this.columns, required this.rows});

  final List<AsnDataColumn> columns;

  /// Rows; each row must have as many cells as [columns].
  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.borderHairline),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: colors.bgSubtle,
            child: Row(
              children: [
                for (final column in columns)
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: column.onSort,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AsnSpacing.x3,
                          vertical: AsnSpacing.x3,
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                column.label,
                                style: TextStyle(
                                  color: colors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (column.onSort != null) ...[
                              const SizedBox(width: AsnSpacing.x1),
                              Text(
                                '⇅',
                                style: TextStyle(color: colors.textTertiary),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          for (final row in rows)
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: colors.borderHairline)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (final cell in row)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AsnSpacing.x3,
                          vertical: AsnSpacing.x3,
                        ),
                        child: DefaultTextStyle.merge(
                          style: TextStyle(color: colors.textPrimary),
                          child: cell,
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
