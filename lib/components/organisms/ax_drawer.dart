import 'package:flutter/widgets.dart';

import 'ax_sheet.dart';

/// Lado desde el que aparece un [AxDrawer].
enum AxDrawerSide { left, right }

/// Cajon lateral (drawer) modal. Reutiliza [AxSheet] por debajo para evitar
/// el `Drawer` de Material.
abstract final class AxDrawer {
  /// Muestra el drawer anclado a [side] y resuelve con su valor al cerrarse.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    AxDrawerSide side = AxDrawerSide.left,
  }) {
    return AxSheet.show<T>(
      context,
      child: child,
      side: side == AxDrawerSide.left ? AxSheetSide.left : AxSheetSide.right,
    );
  }
}
