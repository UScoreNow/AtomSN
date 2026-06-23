import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes visuales de [AxAlert].
enum AxAlertVariant { info, destructive }

/// Mensaje destacado con icono, titulo y descripcion. Envuelve `ShadAlert`.
class AxAlert extends StatelessWidget {
  const AxAlert({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.iconSize = 18,
    this.variant = AxAlertVariant.info,
  });

  final Widget? title;
  final Widget? description;
  final Widget? icon;

  /// Tamano del icono. `ShadAlert` lo aplica via `IconTheme`.
  final double iconSize;
  final AxAlertVariant variant;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AxAlertVariant.info => ShadAlert(
        icon: icon,
        iconSize: iconSize,
        title: title,
        description: description,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      AxAlertVariant.destructive => ShadAlert.destructive(
        icon: icon,
        iconSize: iconSize,
        title: title,
        description: description,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    };
  }
}
