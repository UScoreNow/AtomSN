import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/border/asn_borders.dart';
import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Regla horizontal con extremos redondeados. Envuelve `ShadSeparator`.
///
/// Reserva un alto total [space] con la linea de grosor [thickness] centrada y
/// sangrias [indent]/[endIndent]. Los extremos se redondean con [radius] (por
/// defecto stadium, `AsnRadius.full`).
///
/// Por defecto el color sale de `borderHairline` del tema y el grosor de
/// `AsnBorders.hairline`.
class AsnSeparator extends StatelessWidget {
  const AsnSeparator({
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
    final gutter = (space - thickness) / 2;
    return ShadSeparator.horizontal(
      thickness: thickness,
      color: color ?? AsnTheme.of(context).borderHairline,
      radius: BorderRadius.circular(radius),
      margin: EdgeInsetsDirectional.only(
        start: indent,
        end: endIndent,
        top: gutter,
        bottom: gutter,
      ),
    );
  }
}

/// Regla vertical con extremos redondeados. Envuelve `ShadSeparator`.
///
/// Variante vertical de [AsnSeparator]: reserva un ancho total [space] con la
/// linea de grosor [thickness] centrada y sangrias [indent]/[endIndent]
/// (arriba/abajo).
class AsnVerticalSeparator extends StatelessWidget {
  const AsnVerticalSeparator({
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
    final gutter = (space - thickness) / 2;
    return ShadSeparator.vertical(
      thickness: thickness,
      color: color ?? AsnTheme.of(context).borderHairline,
      radius: BorderRadius.circular(radius),
      margin: EdgeInsetsDirectional.only(
        top: indent,
        bottom: endIndent,
        start: gutter,
        end: gutter,
      ),
    );
  }
}
