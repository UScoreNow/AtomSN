import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Columna de [AsnDataTable]. Si [onSort] no es null, la cabecera es pulsable.
@immutable
class AsnDataColumn {
  const AsnDataColumn({required this.label, this.onSort});

  final String label;
  final VoidCallback? onSort;
}

/// Tabla de datos de nivel superior con cabecera ordenable. Widget propio.
///
/// Dibuja reglas con `borderHairline` y la cabecera sobre `bgSubtle`. Las
/// columnas se reparten a partes iguales.
class AsnDataTable extends StatelessWidget {
  const AsnDataTable({super.key, required this.columns, required this.rows});

  final List<AsnDataColumn> columns;

  /// Filas; cada fila debe tener tantas celdas como [columns].
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
