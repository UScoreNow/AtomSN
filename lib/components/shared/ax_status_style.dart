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

  /// Opacidad del relleno: un tinte muy claro del color de la variante sobre
  /// la superficie.
  static const double _backgroundAlpha = 0.08;

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
  /// (`statusXText`); descripcion = `textSecondary`; fondo = el color saturado
  /// con baja opacidad (tinte muy claro de la misma gama).
  static AxStatusStyle resolve(
    AxStatusVariant variant,
    AxSemanticColors colors,
  ) {
    final (Color border, Color content, List<List<dynamic>>? icon) =
        switch (variant) {
          AxStatusVariant.normal => (
            colors.borderDefault,
            colors.textPrimary,
            null,
          ),
          AxStatusVariant.info => (
            colors.statusInfo,
            colors.statusInfoText,
            HugeIcons.strokeRoundedInformationCircle,
          ),
          AxStatusVariant.warning => (
            colors.statusWarning,
            colors.statusWarningText,
            HugeIcons.strokeRoundedAlert02,
          ),
          AxStatusVariant.error => (
            colors.statusError,
            colors.statusErrorText,
            HugeIcons.strokeRoundedAlertCircle,
          ),
          AxStatusVariant.success => (
            colors.statusSuccess,
            colors.statusSuccessText,
            HugeIcons.strokeRoundedCheckmarkCircle02,
          ),
        };

    return AxStatusStyle(
      borderColor: border,
      contentColor: content,
      descriptionColor: colors.textSecondary,
      // Opaco (compuesto sobre la superficie) para que el toast flotante no
      // deje translucir el contenido de detras.
      backgroundColor: Color.alphaBlend(
        border.withValues(alpha: _backgroundAlpha),
        colors.bgSurface,
      ),
      defaultIcon: icon,
    );
  }
}
