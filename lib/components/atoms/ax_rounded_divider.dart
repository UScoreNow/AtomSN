import 'package:flutter/widgets.dart';

import '../../foundations/border/ax_borders.dart';
import '../../foundations/radius/ax_radius.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Regla horizontal con extremos redondeados.
///
/// Equivalente editorial a un divider: ocupa un alto total [space] con la linea
/// de grosor [thickness] centrada y sangrias [indent]/[endIndent]. A diferencia
/// de una regla recta, la linea se dibuja como un contenedor con [BorderRadius],
/// de modo que sus extremos quedan redondeados (por defecto stadium,
/// `AxRadius.full`).
///
/// Por defecto el color sale de `borderHairline` del tema y el grosor de
/// `AxBorders.hairline`.
class AxRoundedDivider extends StatelessWidget {
  const AxRoundedDivider({
    super.key,
    this.space = AxSpacing.x4,
    this.thickness = AxBorders.hairline,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius = AxRadius.full,
  });

  /// Alto total reservado; la linea queda centrada.
  final double space;

  /// Grosor de la linea.
  final double thickness;

  /// Sangria al inicio (izquierda en LTR).
  final double indent;

  /// Sangria al final (derecha en LTR).
  final double endIndent;

  /// Color de la linea. Por defecto, `borderHairline` del tema.
  final Color? color;

  /// Radio de los extremos.
  final double radius;

  @override
  Widget build(BuildContext context) {
    final lineColor = color ?? AxTheme.of(context).borderHairline;
    return SizedBox(
      height: space,
      child: Center(
        child: Container(
          height: thickness,
          margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
          decoration: BoxDecoration(
            color: lineColor,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

/// Regla vertical con extremos redondeados.
///
/// Variante vertical de [AxRoundedDivider]: ocupa un ancho total [space] con la
/// linea de grosor [thickness] centrada y sangrias [indent]/[endIndent]
/// (arriba/abajo).
class AxRoundedVerticalDivider extends StatelessWidget {
  const AxRoundedVerticalDivider({
    super.key,
    this.space = AxSpacing.x4,
    this.thickness = AxBorders.hairline,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius = AxRadius.full,
  });

  /// Ancho total reservado; la linea queda centrada.
  final double space;

  /// Grosor de la linea.
  final double thickness;

  /// Sangria superior.
  final double indent;

  /// Sangria inferior.
  final double endIndent;

  /// Color de la linea. Por defecto, `borderHairline` del tema.
  final Color? color;

  /// Radio de los extremos.
  final double radius;

  @override
  Widget build(BuildContext context) {
    final lineColor = color ?? AxTheme.of(context).borderHairline;
    return SizedBox(
      width: space,
      child: Center(
        child: Container(
          width: thickness,
          margin: EdgeInsetsDirectional.only(top: indent, bottom: endIndent),
          decoration: BoxDecoration(
            color: lineColor,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
