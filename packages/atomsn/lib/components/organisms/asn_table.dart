import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Columna de [AsnTable].
@immutable
class AsnTableColumn {
  const AsnTableColumn({required this.header});

  final Widget header;
}

/// Tabla estatica de solo lectura. Envuelve `ShadTable.list`.
///
/// Cada fila es una lista de celdas alineada con [columns]. Las celdas
/// numericas se benefician de cifras tabulares en el tema de texto.
class AsnTable extends StatelessWidget {
  const AsnTable({super.key, required this.columns, required this.rows});

  final List<AsnTableColumn> columns;

  /// Filas; cada fila debe tener tantas celdas como [columns].
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
