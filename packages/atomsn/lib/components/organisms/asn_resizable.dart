import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Eje de un [AsnResizable].
enum AsnResizableAxis { horizontal, vertical }

/// Grupo de paneles redimensionables. Envuelve `ShadResizablePanelGroup`.
///
/// Reparte el espacio a partes iguales entre [panels] por defecto.
class AsnResizable extends StatelessWidget {
  const AsnResizable({
    super.key,
    required this.panels,
    this.axis = AsnResizableAxis.horizontal,
    this.minSize = 0.1,
  });

  final List<Widget> panels;
  final AsnResizableAxis axis;

  /// Tamano minimo de cada panel como fraccion del total (0..1).
  final double minSize;

  @override
  Widget build(BuildContext context) {
    final defaultSize = panels.isEmpty ? 1.0 : 1.0 / panels.length;
    return ShadResizablePanelGroup(
      axis: axis == AsnResizableAxis.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        for (var i = 0; i < panels.length; i++)
          ShadResizablePanel(
            id: i,
            defaultSize: defaultSize,
            minSize: minSize,
            child: panels[i],
          ),
      ],
    );
  }
}
