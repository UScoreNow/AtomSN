import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// OTP code field of [length] digits. Wraps `ShadInputOTP`.
class AsnInputOtp extends StatelessWidget {
  const AsnInputOtp({
    super.key,
    this.length = 6,
    this.onChanged,
    this.keyboardType,
  });

  final int length;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    // ElmsSans (the system's single family) instead of the GeistMono mono that
    // shadcn uses by default in the OTP. Tabular figures so the digits align
    // within each cell.
    final slotStyle = theme.textTheme.muted.copyWith(
      color: theme.colorScheme.foreground,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    return ShadInputOTP(
      maxLength: length,
      onChanged: onChanged,
      keyboardType: keyboardType,
      children: [
        ShadInputOTPGroup(
          children: List.generate(
            length,
            (_) => ShadInputOTPSlot(style: slotStyle),
          ),
        ),
      ],
    );
  }
}
