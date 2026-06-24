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
    required this.backgroundColor,
    required this.defaultIcon,
  });

  /// Color del borde (trazo de senal cromatica).
  final Color borderColor;

  /// Color del icono y del titulo.
  final Color contentColor;

  /// Color de la descripcion (tinta neutra, legible).
  final Color descriptionColor;

  /// Relleno de fondo: tinte muy claro de la gama de la variante.
  final Color backgroundColor;

  /// Icono por defecto de la variante (formato de datos de `HugeIcon`).
  /// `null` para [AxStatusVariant.normal].
  final List<List<dynamic>>? defaultIcon;

  /// Resuelve el estilo de [variant] usando los roles semanticos en [colors].
  ///
  /// Borde = color saturado (`statusX`); contenido = variante legible
  /// (`statusXText`); descripcion = `textSecondary`; fondo = color plano y claro
  /// de la gama (`statusXBg`).
  static AxStatusStyle resolve(
    AxStatusVariant variant,
    AxSemanticColors colors,
  ) {
    final (
      Color border,
      Color content,
      Color background,
      List<List<dynamic>>? icon,
    ) = switch (variant) {
      AxStatusVariant.normal => (
        colors.borderDefault,
        colors.textPrimary,
        colors.bgSubtle,
        null,
      ),
      AxStatusVariant.info => (
        colors.statusInfo,
        colors.statusInfoText,
        colors.statusInfoBg,
        HugeIcons.strokeRoundedInformationCircle,
      ),
      AxStatusVariant.warning => (
        colors.statusWarning,
        colors.statusWarningText,
        colors.statusWarningBg,
        HugeIcons.strokeRoundedAlert02,
      ),
      AxStatusVariant.error => (
        colors.statusError,
        colors.statusErrorText,
        colors.statusErrorBg,
        HugeIcons.strokeRoundedAlertCircle,
      ),
      AxStatusVariant.success => (
        colors.statusSuccess,
        colors.statusSuccessText,
        colors.statusSuccessBg,
        HugeIcons.strokeRoundedCheckmarkCircle02,
      ),
    };

    return AxStatusStyle(
      borderColor: border,
      contentColor: content,
      descriptionColor: colors.textSecondary,
      backgroundColor: background,
      defaultIcon: icon,
    );
  }
}
