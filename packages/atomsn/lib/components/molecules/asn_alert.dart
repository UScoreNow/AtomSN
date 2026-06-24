import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/asn_status_variant.dart';
import '../../theme/asn_theme.dart';
import '../shared/asn_status_style.dart';

/// Prominent message with icon, title and description. Wraps `ShadAlert`.
///
/// The appearance is resolved by [AsnStatusStyle] according to the [variant]
/// against the active `AsnSemanticColors`, so that [AsnToast] can reuse this
/// same surface and look identical.
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

  /// Custom icon. If null, the variant's default icon is used
  /// (none for [AsnStatusVariant.normal]).
  final Widget? icon;

  /// Icon size. `ShadAlert` applies it via `IconTheme`.
  final double iconSize;

  final AsnStatusVariant variant;

  /// Widget at the end of the row (e.g. the toast's close button).
  final Widget? trailing;

  /// Widget below the main content (e.g. the toast's action).
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
      // The `ShadBorder` merge does not preserve the default's radius/padding
      // when the incoming border brings them as null, so they are re-specified.
      decoration: ShadDecoration(
        color: style.backgroundColor,
        border: ShadBorder.all(
          color: style.borderColor,
          radius: theme.radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      titleStyle: TextStyle(color: style.contentColor),
      // `descriptionStyle` replaces (does not merge) in `ShadAlert`: pass the
      // full style to preserve the `muted` size.
      descriptionStyle: theme.textTheme.muted.copyWith(
        color: style.descriptionColor,
      ),
    );
  }
}
