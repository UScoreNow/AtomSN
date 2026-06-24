import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Lado desde el que aparece un [AsnSheet].
enum AsnSheetSide { left, right, top, bottom }

/// Panel deslizante (sheet) modal. Envuelve `showShadSheet` + `ShadSheet`.
abstract final class AsnSheet {
  /// Muestra un sheet anclado a [side] y resuelve con su valor al cerrarse.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    AsnSheetSide side = AsnSheetSide.right,
    Widget? title,
    Widget? description,
    List<Widget>? actions,
  }) {
    return showShadSheet<T>(
      context: context,
      side: _mapSide(side),
      builder: (context) => ShadSheet(
        title: title,
        description: description,
        actions: actions ?? const [],
        child: child,
      ),
    );
  }

  static ShadSheetSide _mapSide(AsnSheetSide side) => switch (side) {
    AsnSheetSide.left => ShadSheetSide.left,
    AsnSheetSide.right => ShadSheetSide.right,
    AsnSheetSide.top => ShadSheetSide.top,
    AsnSheetSide.bottom => ShadSheetSide.bottom,
  };
}
