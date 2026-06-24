import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variante visual de [AxToast].
enum AxToastVariant { primary, destructive }

/// Avisos transitorios (toasts). Envuelve `ShadToaster` + `ShadToast`.
///
/// Requiere un `ShadToaster` ancestro (lo inyecta `ShadApp`).
abstract final class AxToast {
  /// Muestra un toast con [title] y [description] opcional.
  static void show(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Widget? action,
    AxToastVariant variant = AxToastVariant.primary,
  }) {
    // Icono de cierre de Hugeicons (libreria unica del sistema) en vez de la X
    // Lucide por defecto de shadcn. Tinte segun la variante.
    final scheme = ShadTheme.of(context).colorScheme;
    HugeIcon closeIcon(Color color) => HugeIcon(
      icon: HugeIcons.strokeRoundedCancel01,
      size: 16,
      strokeWidth: 1.5,
      color: color,
    );
    final toast = switch (variant) {
      AxToastVariant.primary => ShadToast(
        title: title,
        description: description,
        action: action,
        closeIcon: closeIcon(scheme.foreground),
      ),
      AxToastVariant.destructive => ShadToast.destructive(
        title: title,
        description: description,
        action: action,
        closeIcon: closeIcon(scheme.destructiveForeground),
      ),
    };
    ShadToaster.of(context).show(toast);
  }
}
