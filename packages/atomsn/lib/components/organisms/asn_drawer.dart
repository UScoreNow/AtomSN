import 'package:flutter/widgets.dart';

import 'asn_sheet.dart';

/// Side from which an [AsnDrawer] appears.
enum AsnDrawerSide { left, right }

/// Modal side drawer. Reuses [AsnSheet] underneath to avoid
/// Material's `Drawer`.
abstract final class AsnDrawer {
  /// Shows the drawer anchored to [side] and resolves with its value on close.
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
