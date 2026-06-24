import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/ax_status_variant.dart';
import '../../theme/ax_theme.dart';
import '../shared/ax_status_style.dart';

/// Mensaje destacado con icono, titulo y descripcion. Envuelve `ShadAlert`.
///
/// El aspecto lo resuelve [AxStatusStyle] segun la [variant] contra los
/// `AxSemanticColors` activos, de modo que [AxToast] pueda reusar este mismo
/// surface y verse identico.
class AxAlert extends StatelessWidget {
  const AxAlert({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.iconSize = 18,
    this.variant = AxStatusVariant.normal,
    this.trailing,
    this.bottom,
  });

  final Widget? title;
  final Widget? description;

  /// Icono personalizado. Si es null, se usa el icono por defecto de la
  /// variante (ninguno para [AxStatusVariant.normal]).
  final Widget? icon;

  /// Tamano del icono. `ShadAlert` lo aplica via `IconTheme`.
  final double iconSize;

  final AxStatusVariant variant;

  /// Widget al final de la fila (p. ej. el boton de cerrar del toast).
  final Widget? trailing;

  /// Widget bajo el contenido principal (p. ej. la accion del toast).
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    final theme = ShadTheme.of(context);
    final style = AxStatusStyle.resolve(variant, colors);

    final effectiveIcon =
        icon ??
        (style.defaultIcon != null
            ? HugeIcon(
                icon: style.defaultIcon!,
                size: iconSize,
                color: style.contentColor,
              )
            : null);

    return ShadAlert.raw(
      variant: ShadAlertVariant.primary,
      icon: effectiveIcon,
      iconSize: iconSize,
      iconColor: style.contentColor,
      title: title,
      description: description,
      trailing: trailing,
      bottom: bottom,
      crossAxisAlignment: CrossAxisAlignment.center,
      // El merge de `ShadBorder` no preserva radius/padding del default cuando
      // el borde entrante los trae en null, asi que se re-especifican.
      decoration: ShadDecoration(
        color: style.backgroundColor,
        border: ShadBorder.all(
          color: style.borderColor,
          radius: theme.radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      titleStyle: TextStyle(color: style.contentColor),
      // `descriptionStyle` reemplaza (no mergea) en `ShadAlert`: pasar el
      // estilo completo para conservar el tamano `muted`.
      descriptionStyle: theme.textTheme.muted.copyWith(
        color: style.descriptionColor,
      ),
    );
  }
}
