import 'package:flutter/widgets.dart';

import '../../foundations/border/asn_borders.dart';
import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Regla horizontal con extremos redondeados.
///
/// Equivalente editorial a un divider: ocupa un alto total [space] con la linea
/// de grosor [thickness] centrada y sangrias [indent]/[endIndent]. A diferencia
/// de una regla recta, la linea se dibuja como un contenedor con [BorderRadius],
/// de modo que sus extremos quedan redondeados (por defecto stadium,
/// `AsnRadius.full`).
///
/// Por defecto el color sale de `borderHairline` del tema y el grosor de
/// `AsnBorders.hairline`.
class AsnRoundedDivider extends StatelessWidget {
  const AsnRoundedDivider({
    super.key,
    this.space = AsnSpacing.x4,
    this.thickness = AsnBorders.hairline,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius = AsnRadius.full,
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
    final lineColor = color ?? AsnTheme.of(context).borderHairline;
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
/// Variante vertical de [AsnRoundedDivider]: ocupa un ancho total [space] con la
/// linea de grosor [thickness] centrada y sangrias [indent]/[endIndent]
/// (arriba/abajo).
class AsnRoundedVerticalDivider extends StatelessWidget {
  const AsnRoundedVerticalDivider({
    super.key,
    this.space = AsnSpacing.x4,
    this.thickness = AsnBorders.hairline,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius = AsnRadius.full,
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
    final lineColor = color ?? AsnTheme.of(context).borderHairline;
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
