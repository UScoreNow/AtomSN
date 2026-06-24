import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/border/asn_borders.dart';
import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Horizontal rule with rounded ends. Wraps `ShadSeparator`.
///
/// Reserves a total height [space] with the line of [thickness] centered and
/// indents [indent]/[endIndent]. The ends are rounded with [radius] (stadium by
/// default, `AsnRadius.full`).
///
/// By default the color comes from the theme's `borderHairline` and the
/// thickness from `AsnBorders.hairline`.
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

  /// Total reserved height; the line stays centered.
  final double space;

  /// Line thickness.
  final double thickness;

  /// Indent at the start (left in LTR).
  final double indent;

  /// Indent at the end (right in LTR).
  final double endIndent;

  /// Line color. By default, the theme's `borderHairline`.
  final Color? color;

  /// Radius of the ends.
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

/// Vertical rule with rounded ends. Wraps `ShadSeparator`.
///
/// Vertical variant of [AsnSeparator]: reserves a total width [space] with the
/// line of [thickness] centered and indents [indent]/[endIndent]
/// (top/bottom).
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

  /// Total reserved width; the line stays centered.
  final double space;

  /// Line thickness.
  final double thickness;

  /// Top indent.
  final double indent;

  /// Bottom indent.
  final double endIndent;

  /// Line color. By default, the theme's `borderHairline`.
  final Color? color;

  /// Radius of the ends.
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
