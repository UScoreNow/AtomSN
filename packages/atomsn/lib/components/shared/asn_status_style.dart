import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../../foundations/status/asn_status_variant.dart';

/// Resolved style of an [AsnStatusVariant] against some [AsnSemanticColors].
///
/// Single source of truth for the appearance of the feedback components
/// ([AsnAlert] and, by reuse, [AsnToast]): border, content color (icon +
/// title), description color and the variant's default icon.
@immutable
class AsnStatusStyle {
  const AsnStatusStyle({
    required this.borderColor,
    required this.contentColor,
    required this.descriptionColor,
    required this.backgroundColor,
    required this.defaultIcon,
  });

  /// Border color (chromatic signal stroke).
  final Color borderColor;

  /// Color of the icon and the title.
  final Color contentColor;

  /// Description color (neutral, legible ink).
  final Color descriptionColor;

  /// Background fill: very light tint of the variant's range.
  final Color backgroundColor;

  /// Variant's default icon (`HugeIcon` data format).
  /// `null` for [AsnStatusVariant.normal].
  final List<List<dynamic>>? defaultIcon;

  /// Resolves the style of [variant] using the semantic roles in [colors].
  ///
  /// Border = saturated color (`statusX`); content = legible variant
  /// (`statusXText`); description = `textSecondary`; background = flat, light
  /// color of the range (`statusXBg`).
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
