import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../foundations/status/asn_status_variant.dart';
import '../../theme/asn_theme.dart';
import '../molecules/asn_alert.dart';
import '../shared/asn_status_style.dart';

/// Transient notices (toasts). Shares the style of [AsnAlert]: shows the
/// same surface floating over the UI with auto-dismiss and a close button.
///
/// Requires an ancestor `ShadToaster` (injected by `ShadApp`).
abstract final class AsnToast {
  /// Shows a toast with [title] and optional [description].
  static void show(
    BuildContext context, {
    required Widget title,
    Widget? description,
    Widget? action,
    AsnStatusVariant variant = AsnStatusVariant.normal,
  }) {
    final colors = AsnTheme.of(context);
    final style = AsnStatusStyle.resolve(variant, colors);

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
      onPressed: () => ShadToaster.of(context).hide(),
    );

    final surface = AsnAlert(
      variant: variant,
      title: title,
      description: description,
      trailing: closeButton,
      bottom: action,
    );

    // "Bare" toast: no own background, border, shadow, radius or padding. All
    // the appearance is provided by the inner `AsnAlert`; the toast's native X
    // is neutralized because the real one goes as the alert's `trailing`.
    final toast = ShadToast.raw(
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

    ShadToaster.of(context).show(toast);
  }
}
