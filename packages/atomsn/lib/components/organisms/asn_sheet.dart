import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Side from which an [AsnSheet] appears.
enum AsnSheetSide { left, right, top, bottom }

/// Modal sliding panel (sheet). Wraps `showShadSheet` + `ShadSheet`.
abstract final class AsnSheet {
  /// Shows a sheet anchored to [side] and resolves with its value on close.
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
