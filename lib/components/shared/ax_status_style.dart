import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../../foundations/status/ax_status_variant.dart';

/// Estilo resuelto de una [AxStatusVariant] contra unos [AxSemanticColors].
///
/// Fuente unica de verdad del aspecto de los componentes de feedback
/// ([AxAlert] y, por reuso, [AxToast]): borde, color de contenido (icono +
/// titulo), color de descripcion y el icono por defecto de la variante.
@immutable
class AxStatusStyle {
  const AxStatusStyle({
    required this.borderColor,
    required this.contentColor,
    required this.descriptionColor,
    required this.defaultIcon,
  });

  /// Color del borde (trazo de senal cromatica).
  final Color borderColor;

  /// Color del icono y del titulo.
  final Color contentColor;

  /// Color de la descripcion (tinta neutra, legible).
  final Color descriptionColor;

  /// Icono por defecto de la variante (formato de datos de `HugeIcon`).
  /// `null` para [AxStatusVariant.normal].
  final List<List<dynamic>>? defaultIcon;

  /// Resuelve el estilo de [variant] usando los roles semanticos en [colors].
  ///
  /// Borde = color saturado (`statusX`); contenido = variante legible
  /// (`statusXText`); descripcion = `textSecondary`.
  static AxStatusStyle resolve(
    AxStatusVariant variant,
    AxSemanticColors colors,
  ) {
    return switch (variant) {
      AxStatusVariant.normal => AxStatusStyle(
        borderColor: colors.borderDefault,
        contentColor: colors.textPrimary,
        descriptionColor: colors.textSecondary,
        defaultIcon: null,
      ),
      AxStatusVariant.info => AxStatusStyle(
        borderColor: colors.statusInfo,
        contentColor: colors.statusInfoText,
        descriptionColor: colors.textSecondary,
        defaultIcon: HugeIcons.strokeRoundedInformationCircle,
      ),
      AxStatusVariant.warning => AxStatusStyle(
        borderColor: colors.statusWarning,
        contentColor: colors.statusWarningText,
        descriptionColor: colors.textSecondary,
        defaultIcon: HugeIcons.strokeRoundedAlert02,
      ),
      AxStatusVariant.error => AxStatusStyle(
        borderColor: colors.statusError,
        contentColor: colors.statusErrorText,
        descriptionColor: colors.textSecondary,
        defaultIcon: HugeIcons.strokeRoundedAlertCircle,
      ),
      AxStatusVariant.success => AxStatusStyle(
        borderColor: colors.statusSuccess,
        contentColor: colors.statusSuccessText,
        descriptionColor: colors.textSecondary,
        defaultIcon: HugeIcons.strokeRoundedCheckmarkCircle02,
      ),
    };
  }
}
