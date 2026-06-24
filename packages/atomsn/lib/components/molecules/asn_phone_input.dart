import 'package:flutter/widgets.dart';

import '../../foundations/spacing/asn_spacing.dart';
import '../atoms/atoms.dart';
import 'asn_select.dart';

/// Prefijo de pais para [AsnPhoneInput].
@immutable
class AsnDialCode {
  const AsnDialCode({required this.code, required this.label});

  /// Prefijo internacional, p. ej. "+34".
  final String code;

  /// Etiqueta a mostrar, p. ej. "ES +34".
  final String label;
}

/// Campo de telefono controlado: prefijo de pais + numero. Widget propio.
///
/// El [value] es la cadena completa (prefijo + numero). [onChanged] reporta la
/// concatenacion del prefijo seleccionado y el numero introducido.
class AsnPhoneInput extends StatelessWidget {
  const AsnPhoneInput({
    super.key,
    required this.value,
    this.onChanged,
    this.dialCodes = defaultDialCodes,
    this.placeholder,
    this.enabled = true,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final List<AsnDialCode> dialCodes;
  final String? placeholder;
  final bool enabled;

  /// Lista estatica minima de prefijos habituales.
  static const List<AsnDialCode> defaultDialCodes = [
    AsnDialCode(code: '+34', label: 'ES +34'),
    AsnDialCode(code: '+1', label: 'US +1'),
    AsnDialCode(code: '+44', label: 'UK +44'),
    AsnDialCode(code: '+33', label: 'FR +33'),
    AsnDialCode(code: '+49', label: 'DE +49'),
  ];

  AsnDialCode get _selectedCode {
    for (final dial in dialCodes) {
      if (value.startsWith(dial.code)) return dial;
    }
    return dialCodes.first;
  }

  String get _number {
    final code = _selectedCode.code;
    return value.startsWith(code) ? value.substring(code.length) : value;
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedCode;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AsnSelect<String>(
          value: selected.code,
          enabled: enabled,
          options: dialCodes
              .map(
                (dial) =>
                    AsnSelectOption<String>(value: dial.code, label: dial.label),
              )
              .toList(),
          onChanged: (code) {
            if (code == null) return;
            onChanged?.call('$code$_number');
          },
        ),
        const SizedBox(width: AsnSpacing.x2),
        Expanded(
          child: AsnInput(
            initialValue: _number,
            placeholder: placeholder,
            enabled: enabled,
            keyboardType: TextInputType.phone,
            onChanged: (number) => onChanged?.call('${selected.code}$number'),
          ),
        ),
      ],
    );
  }
}
