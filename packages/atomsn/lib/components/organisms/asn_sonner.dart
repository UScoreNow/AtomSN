import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/asn_status_variant.dart';
import '../../theme/asn_theme.dart';
import '../molecules/asn_alert.dart';
import '../shared/asn_status_style.dart';

/// Stacked transient notices (sonner). Same surface as [AsnAlert], like
/// [AsnToast], but the sonner host keeps several notices stacked instead of
/// replacing the previous one.
///
/// Requires an ancestor `ShadSonner` (injected by `ShadApp`, and therefore by
/// `AsnApp`).
abstract final class AsnSonner {
  /// Shows a sonner notice with [title] and optional [description].
  ///
  /// Returns the identifier of the shown notice, which [hide] accepts.
  static Object? show(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Widget? action,
    AsnStatusVariant variant = AsnStatusVariant.normal,
  }) {
    final colors = AsnTheme.of(context);
    final style = AsnStatusStyle.resolve(variant, colors);

    final id = UniqueKey();
    final closeButton = ShadIconButton.ghost(
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedCancel01,
        size: 16,
        strokeWidth: 1.5,
        color: style.contentColor,
      ),
      width: 20,
      height: 20,
      padding: EdgeInsets.zero,
      foregroundColor: style.contentColor,
      onPressed: () => ShadSonner.of(context).hide(id),
    );

    final surface = AsnAlert(
      variant: variant,
      title: title,
      description: description,
      trailing: closeButton,
      bottom: action,
    );

    // "Bare" notice: no own background, border, shadow, radius or padding. All
    // the appearance is provided by the inner `AsnAlert`; the sonner's native X
    // is neutralized because the real one goes as the alert's `trailing`.
    final toast = ShadToast.raw(
      id: id,
      variant: ShadToastVariant.primary,
      title: surface,
      closeIcon: const SizedBox.shrink(),
      backgroundColor: const Color(0x00000000),
      border: ShadBorder.all(width: 0),
      radius: BorderRadius.zero,
      shadows: const [],
      padding: EdgeInsets.zero,
      mainAxisSize: MainAxisSize.min,
    );

    return ShadSonner.of(context).show(toast);
  }

  /// Hides the notice identified by [id] (the value returned by [show]).
  static void hide(BuildContext context, Object? id) =>
      ShadSonner.of(context).hide(id);
}
