import 'package:flutter/widgets.dart';

import 'asn_sheet.dart';

/// Lado desde el que aparece un [AsnDrawer].
enum AsnDrawerSide { left, right }

/// Cajon lateral (drawer) modal. Reutiliza [AsnSheet] por debajo para evitar
/// el `Drawer` de Material.
abstract final class AsnDrawer {
  /// Muestra el drawer anclado a [side] y resuelve con su valor al cerrarse.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    AsnDrawerSide side = AsnDrawerSide.left,
  }) {
    return AsnSheet.show<T>(
      context,
      child: child,
      side: side == AsnDrawerSide.left ? AsnSheetSide.left : AsnSheetSide.right,
    );
  }
}
