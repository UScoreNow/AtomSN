import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/asn_status_variant.dart';
import '../../theme/asn_theme.dart';
import '../molecules/asn_alert.dart';
import '../shared/asn_status_style.dart';

/// Avisos transitorios (toasts). Comparte el estilo de [AsnAlert]: muestra el
/// mismo surface flotando sobre la UI con autodescarte y boton de cerrar.
///
/// Requiere un `ShadToaster` ancestro (lo inyecta `ShadApp`).
abstract final class AsnToast {
  /// Muestra un toast con [title] y [description] opcional.
  static void show(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Widget? action,
    AsnStatusVariant variant = AsnStatusVariant.normal,
  }) {
    final colors = AsnTheme.of(context);
    final style = AsnStatusStyle.resolve(variant, colors);

    final closeButton = ShadIconButton.ghost(
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedCancel01,
        size: 16,
        strokeWidth: 1.5,
        color: style.contentColor,
      ),
      width: 20,
      height: 20,
      padding: EdgeInsets.zero,
      foregroundColor: style.contentColor,
      onPressed: () => ShadToaster.of(context).hide(),
    );

    final surface = AsnAlert(
      variant: variant,
      title: title,
      description: description,
      trailing: closeButton,
      bottom: action,
    );

    // Toast "desnudo": sin fondo, borde, sombra, radio ni padding propios. Todo
    // el aspecto lo aporta el `AsnAlert` interior; la X nativa del toast se
    // neutraliza porque la real va como `trailing` del alert.
    final toast = ShadToast.raw(
      variant: ShadToastVariant.primary,
      title: surface,
      closeIcon: const SizedBox.shrink(),
      backgroundColor: const Color(0x00000000),
      border: ShadBorder.all(width: 0),
      radius: BorderRadius.zero,
      shadows: const [],
      padding: EdgeInsets.zero,
      mainAxisSize: MainAxisSize.min,
    );

    ShadToaster.of(context).show(toast);
  }
}
