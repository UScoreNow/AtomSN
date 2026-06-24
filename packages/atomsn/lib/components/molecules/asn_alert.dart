import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/asn_status_variant.dart';
import '../../theme/asn_theme.dart';
import '../shared/asn_status_style.dart';

/// Mensaje destacado con icono, titulo y descripcion. Envuelve `ShadAlert`.
///
/// El aspecto lo resuelve [AsnStatusStyle] segun la [variant] contra los
/// `AsnSemanticColors` activos, de modo que [AsnToast] pueda reusar este mismo
/// surface y verse identico.
class AsnAlert extends StatelessWidget {
  const AsnAlert({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.iconSize = 18,
    this.variant = AsnStatusVariant.normal,
    this.trailing,
    this.bottom,
  });

  final Widget? title;
  final Widget? description;

  /// Icono personalizado. Si es null, se usa el icono por defecto de la
  /// variante (ninguno para [AsnStatusVariant.normal]).
  final Widget? icon;

  /// Tamano del icono. `ShadAlert` lo aplica via `IconTheme`.
  final double iconSize;

  final AsnStatusVariant variant;

  /// Widget al final de la fila (p. ej. el boton de cerrar del toast).
  final Widget? trailing;

  /// Widget bajo el contenido principal (p. ej. la accion del toast).
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    final theme = ShadTheme.of(context);
    final style = AsnStatusStyle.resolve(variant, colors);

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
