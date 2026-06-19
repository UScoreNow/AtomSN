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
    final toast = switch (variant) {
      AxToastVariant.primary => ShadToast(
        title: title,
        description: description,
        action: action,
      ),
      AxToastVariant.destructive => ShadToast.destructive(
        title: title,
        description: description,
        action: action,
      ),
    };
    ShadToaster.of(context).show(toast);
  }
}
