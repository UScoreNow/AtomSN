import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

/// Bloque etiquetado que envuelve la demostracion de un componente.
class DemoBlock extends StatelessWidget {
  const DemoBlock({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AxSpacing.x4),
      padding: const EdgeInsets.all(AxSpacing.x4),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        // Esquinas concentricas: el hijo estandar (radio md) inset por el
        // padding x4 -> el contenedor usa md + x4 para que las curvas casen.
        borderRadius: AxRadius.brConcentric(AxRadius.md, AxSpacing.x4),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AxTextTheme.sansFamily,
              fontSize: AxFontSize.sm,
              fontWeight: AxFontWeight.semibold,
              letterSpacing: 0.6,
              color: colors.textMuted,
            ),
          ),
          const AxRoundedDivider(space: AxSpacing.x5),
          DefaultTextStyle.merge(
            style: TextStyle(color: colors.textPrimary),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Lista vertical de bloques con padding consistente para una pantalla.
class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key, required this.blocks});

  final List<Widget> blocks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AxSpacing.x4),
      children: blocks,
    );
  }
}
