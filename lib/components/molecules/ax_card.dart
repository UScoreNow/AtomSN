import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Contenedor de superficie con titulo, descripcion, cuerpo y pie. Envuelve
/// `ShadCard`.
class AxCard extends StatelessWidget {
  const AxCard({
    super.key,
    this.title,
    this.description,
    this.child,
    this.footer,
    this.padding,
  });

  final Widget? title;
  final Widget? description;
  final Widget? child;
  final Widget? footer;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: title,
      description: description,
      footer: footer,
      padding: padding,
      child: child,
    );
  }
}
