import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Dialogos modales. Envuelve `showShadDialog` + `ShadDialog` exponiendo
/// helpers estaticos con firma simple y nuestra (sin filtrar tipos `Shad*`).
abstract final class AxDialog {
  /// Muestra un dialogo estandar y resuelve con el valor devuelto al cerrarlo.
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? title,
    Widget? description,
    Widget? content,
    List<Widget>? actions,
  }) {
    return showShadDialog<T>(
      context: context,
      builder: (context) => ShadDialog(
        title: title,
        description: description,
        actions: actions ?? const [],
        child: content,
      ),
    );
  }

  /// Muestra un dialogo de alerta (variante de confirmacion).
  static Future<T?> showAlert<T>(
    BuildContext context, {
    Widget? title,
    Widget? description,
    Widget? content,
    List<Widget>? actions,
  }) {
    return showShadDialog<T>(
      context: context,
      variant: ShadDialogVariant.alert,
      builder: (context) => ShadDialog.alert(
        title: title,
        description: description,
        actions: actions ?? const [],
        child: content,
      ),
    );
  }
}
