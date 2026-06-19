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
    this.variant = AxAlertVariant.info,
  });

  final Widget? title;
  final Widget? description;
  final Widget? icon;
  final AxAlertVariant variant;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AxAlertVariant.info => ShadAlert(
        icon: icon,
        title: title,
        description: description,
      ),
      AxAlertVariant.destructive => ShadAlert.destructive(
        icon: icon,
        title: title,
        description: description,
      ),
    };
  }
}
