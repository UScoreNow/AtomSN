import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Modal dialogs. Wraps `showShadDialog` + `ShadDialog`, exposing
/// static helpers with a simple, own signature (without leaking `Shad*` types).
abstract final class AsnDialog {
  /// Close button with a Hugeicons icon (the system's single library) instead
  /// of shadcn's default Lucide X.
  static Widget _closeIcon(BuildContext context) => HugeIcon(
    icon: HugeIcons.strokeRoundedCancel01,
    size: 16,
    strokeWidth: 1.5,
    color: ShadTheme.of(context).colorScheme.foreground,
  );

  /// Shows a standard dialog and resolves with the value returned on close.
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
        closeIcon: _closeIcon(context),
        child: content,
      ),
    );
  }

  /// Shows an alert dialog (confirmation variant).
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
        closeIcon: _closeIcon(context),
        child: content,
      ),
    );
  }
}
