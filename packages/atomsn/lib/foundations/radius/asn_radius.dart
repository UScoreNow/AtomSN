import 'package:flutter/painting.dart';

/// Escala de radios de borde.
///
/// Capa fundacional brand-agnostic. `none` (0px) para reglas, tablas y sellos
/// de corte editorial; `md` (12px) es el estandar de cards; `full` para
/// avatares, dots y pills.
abstract final class AsnRadius {
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xl2 = 32;
  static const double full = 9999;

  static const BorderRadius brNone = BorderRadius.zero;
  static const BorderRadius brXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius brSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius brMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius brLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius brXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius brXl2 = BorderRadius.all(Radius.circular(xl2));
  static const BorderRadius brFull = BorderRadius.all(Radius.circular(full));

  /// Radio concentrico para esquinas anidadas pixel-perfect.
  ///
  /// Cuando un contenedor con esquinas redondeadas envuelve a un hijo tambien
  /// redondeado separado por un [gap] (el padding entre ambos), el radio del
  /// padre debe ser el del hijo mas ese hueco para que las curvas sean
  /// concentricas: `R_padre = R_hijo + gap`.
  static double concentric(double childRadius, double gap) => childRadius + gap;

  /// Igual que [concentric] pero devuelve un [BorderRadius] listo para usar en
  /// el contenedor padre.
  static BorderRadius brConcentric(double childRadius, double gap) =>
      BorderRadius.all(Radius.circular(childRadius + gap));
}
