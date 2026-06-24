import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../../foundations/status/asn_status_variant.dart';

/// Estilo resuelto de una [AsnStatusVariant] contra unos [AsnSemanticColors].
///
/// Fuente unica de verdad del aspecto de los componentes de feedback
/// ([AsnAlert] y, por reuso, [AsnToast]): borde, color de contenido (icono +
/// titulo), color de descripcion y el icono por defecto de la variante.
@immutable
class AsnStatusStyle {
  const AsnStatusStyle({
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
  /// `null` para [AsnStatusVariant.normal].
  final List<List<dynamic>>? defaultIcon;

  /// Resuelve el estilo de [variant] usando los roles semanticos en [colors].
  ///
  /// Borde = color saturado (`statusX`); contenido = variante legible
  /// (`statusXText`); descripcion = `textSecondary`; fondo = color plano y claro
  /// de la gama (`statusXBg`).
  static AsnStatusStyle resolve(
    AsnStatusVariant variant,
    AsnSemanticColors colors,
  ) {
    final (
      Color border,
      Color content,
      Color background,
      List<List<dynamic>>? icon,
    ) = switch (variant) {
      AsnStatusVariant.normal => (
        colors.borderDefault,
        colors.textPrimary,
        colors.bgSubtle,
        null,
      ),
      AsnStatusVariant.info => (
        colors.statusInfo,
        colors.statusInfoText,
        colors.statusInfoBg,
        HugeIcons.strokeRoundedInformationCircle,
      ),
      AsnStatusVariant.warning => (
        colors.statusWarning,
        colors.statusWarningText,
        colors.statusWarningBg,
        HugeIcons.strokeRoundedAlert02,
      ),
      AsnStatusVariant.error => (
        colors.statusError,
        colors.statusErrorText,
        colors.statusErrorBg,
        HugeIcons.strokeRoundedAlertCircle,
      ),
      AsnStatusVariant.success => (
        colors.statusSuccess,
        colors.statusSuccessText,
        colors.statusSuccessBg,
        HugeIcons.strokeRoundedCheckmarkCircle02,
      ),
    };

    return AsnStatusStyle(
      borderColor: border,
      contentColor: content,
      descriptionColor: colors.textSecondary,
      backgroundColor: background,
      defaultIcon: icon,
    );
  }
}
