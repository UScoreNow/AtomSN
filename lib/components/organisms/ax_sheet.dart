import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Lado desde el que aparece un [AxSheet].
enum AxSheetSide { left, right, top, bottom }

/// Panel deslizante (sheet) modal. Envuelve `showShadSheet` + `ShadSheet`.
abstract final class AxSheet {
  /// Muestra un sheet anclado a [side] y resuelve con su valor al cerrarse.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    AxSheetSide side = AxSheetSide.right,
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

  static ShadSheetSide _mapSide(AxSheetSide side) => switch (side) {
    AxSheetSide.left => ShadSheetSide.left,
    AxSheetSide.right => ShadSheetSide.right,
    AxSheetSide.top => ShadSheetSide.top,
    AxSheetSide.bottom => ShadSheetSide.bottom,
  };
}
