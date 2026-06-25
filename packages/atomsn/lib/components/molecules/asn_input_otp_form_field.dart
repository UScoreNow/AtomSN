import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// OTP code field bound to an [AsnForm]. Wraps `ShadInputOTPFormField`.
class AsnInputOtpFormField extends StatelessWidget {
  const AsnInputOtpFormField({
    super.key,
    required this.id,
    this.length = 6,
    this.label,
    this.description,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
  });

  final String id;
  final int length;
  final String? label;
  final String? description;
  final String? initialValue;
  final String? Function(String value)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    // ElmsSans + tabular figures, matching AsnInputOtp.
    final slotStyle = theme.textTheme.muted.copyWith(
      color: theme.colorScheme.foreground,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    return ShadInputOTPFormField(
      id: id,
      maxLength: length,
      label: label == null ? null : Text(label!),
      description: description == null ? null : Text(description!),
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
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
