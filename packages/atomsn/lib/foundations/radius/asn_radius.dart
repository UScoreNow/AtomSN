import 'package:flutter/painting.dart';

/// Border radius scale.
///
/// Brand-agnostic foundational layer. `none` (0px) for rules, tables and stamps
/// with an editorial cut; `md` (12px) is the card standard; `full` for
/// avatars, dots and pills.
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

  /// Concentric radius for pixel-perfect nested corners.
  ///
  /// When a container with rounded corners wraps a child that is also
  /// rounded, separated by a [gap] (the padding between the two), the parent's
  /// radius must be the child's plus that gap so the curves are
  /// concentric: `R_parent = R_child + gap`.
  static double concentric(double childRadius, double gap) => childRadius + gap;

  /// Same as [concentric] but returns a [BorderRadius] ready to use on
  /// the parent container.
  static BorderRadius brConcentric(double childRadius, double gap) =>
      BorderRadius.all(Radius.circular(childRadius + gap));
}
