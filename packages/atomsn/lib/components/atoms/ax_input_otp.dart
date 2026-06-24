import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Campo de codigo OTP de [length] digitos. Envuelve `ShadInputOTP`.
class AxInputOtp extends StatelessWidget {
  const AxInputOtp({
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
    // ElmsSans (familia unica del sistema) en lugar del mono GeistMono que
    // shadcn usa por defecto en el OTP. Cifras tabulares para que los digitos
    // alineen dentro de cada celda.
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
