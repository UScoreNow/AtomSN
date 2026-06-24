import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Image avatar with fallback. Wraps `ShadAvatar`.
///
/// [src] accepts a network URL or an asset path. [fallback] is shown while
/// loading or if the image fails (e.g. initials).
class AsnAvatar extends StatelessWidget {
  const AsnAvatar({
    super.key,
    this.src = '',
    this.fallback,
    this.size,
    this.backgroundColor,
  });

  final String src;
  final Widget? fallback;
  final Size? size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ShadAvatar(
      src,
      placeholder: fallback,
      size: size,
      backgroundColor: backgroundColor,
    );
  }
}
