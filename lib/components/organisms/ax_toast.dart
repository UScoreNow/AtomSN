import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/ax_status_variant.dart';
import '../../theme/ax_theme.dart';
import '../molecules/ax_alert.dart';
import '../shared/ax_status_style.dart';

/// Avisos transitorios (toasts). Comparte el estilo de [AxAlert]: muestra el
/// mismo surface flotando sobre la UI con autodescarte y boton de cerrar.
///
/// Requiere un `ShadToaster` ancestro (lo inyecta `ShadApp`).
abstract final class AxToast {
  /// Muestra un toast con [title] y [description] opcional.
  static void show(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Widget? action,
    AxStatusVariant variant = AxStatusVariant.normal,
  }) {
    final colors = AxTheme.of(context);
    final style = AxStatusStyle.resolve(variant, colors);

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

    final surface = AxAlert(
      variant: variant,
      title: title,
      description: description,
      trailing: closeButton,
      bottom: action,
    );

    // Toast "desnudo": sin fondo, borde, sombra, radio ni padding propios. Todo
    // el aspecto lo aporta el `AxAlert` interior; la X nativa del toast se
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
