import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

/// Bloque etiquetado que envuelve la demostracion de un componente.
class DemoBlock extends StatelessWidget {
  const DemoBlock({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AsnSpacing.x4),
      padding: const EdgeInsets.all(AsnSpacing.x4),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        // Esquinas concentricas: el hijo estandar (radio md) inset por el
        // padding x4 -> el contenedor usa md + x4 para que las curvas casen.
        borderRadius: AsnRadius.brConcentric(AsnRadius.md, AsnSpacing.x4),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AsnTextTheme.sansFamily,
              fontSize: AsnFontSize.sm,
              fontWeight: AsnFontWeight.semibold,
              letterSpacing: 0.6,
              color: colors.textMuted,
            ),
          ),
          const AsnRoundedDivider(space: AsnSpacing.x5),
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
      padding: const EdgeInsets.all(AsnSpacing.x4),
      children: blocks,
    );
  }
}
