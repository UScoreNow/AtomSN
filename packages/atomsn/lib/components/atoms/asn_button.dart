import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Visual variants of [AsnButton].
enum AsnButtonVariant { primary, secondary, destructive, outline, ghost, link }

/// Sizes of [AsnButton].
enum AsnButtonSize { regular, sm, lg }

/// Action button. Wraps `ShadButton` exposing a stable and controlled API
/// (without leaking `Shad*` types).
///
/// Accepts a [leading] (left) and/or [trailing] (right) icon of the text; the
/// icon is sized according to [size]. The content (icon + text) is always
/// centered vertically and horizontally, also when [expanded] is true and the
/// button takes up the full available width.
class AsnButton extends StatelessWidget {
  const AsnButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = AsnButtonVariant.primary,
    this.size = AsnButtonSize.regular,
    this.leading,
    this.trailing,
    this.expanded = false,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final AsnButtonVariant variant;
  final AsnButtonSize size;

  /// Icon to the left of the text.
  final Widget? leading;

  /// Icon to the right of the text.
  final Widget? trailing;

  /// If true, the button takes up the full available width (content centered).
  final bool expanded;
  final bool enabled;

  ShadButtonSize get _size => switch (size) {
    AsnButtonSize.regular => ShadButtonSize.regular,
    AsnButtonSize.sm => ShadButtonSize.sm,
    AsnButtonSize.lg => ShadButtonSize.lg,
  };

  ShadButtonVariant get _variant => switch (variant) {
    AsnButtonVariant.primary => ShadButtonVariant.primary,
    AsnButtonVariant.secondary => ShadButtonVariant.secondary,
    AsnButtonVariant.destructive => ShadButtonVariant.destructive,
    AsnButtonVariant.outline => ShadButtonVariant.outline,
    AsnButtonVariant.ghost => ShadButtonVariant.ghost,
    AsnButtonVariant.link => ShadButtonVariant.link,
  };

  double get _iconSize => switch (size) {
    AsnButtonSize.sm => 16,
    AsnButtonSize.regular => 18,
    AsnButtonSize.lg => 20,
  };

  /// Fixes the icon size while keeping the color provided by the button.
  Widget? _sizedIcon(Widget? icon) {
    if (icon == null) return null;
    return IconTheme.merge(
      data: IconThemeData(size: _iconSize),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Full-width button: the content (icon + text) is grouped in a centered Row
    // and expands (`expands`) to stay centered horizontally.
    if (expanded) {
      final items = <Widget>[
        if (leading != null) _sizedIcon(leading)!,
        child,
        if (trailing != null) _sizedIcon(trailing)!,
      ];
      return ShadButton.raw(
        variant: _variant,
        size: _size,
        onPressed: onPressed,
        enabled: enabled,
        width: double.infinity,
        expands: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              items[i],
            ],
          ],
        ),
      );
    }

    // Button fitted to content: ShadButton already centers leading/child/trailing.
    return ShadButton.raw(
      variant: _variant,
      size: _size,
      onPressed: onPressed,
      enabled: enabled,
      leading: _sizedIcon(leading),
      trailing: _sizedIcon(trailing),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      child: child,
    );
  }
}
