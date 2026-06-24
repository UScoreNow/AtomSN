import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Avatar de imagen con fallback. Envuelve `ShadAvatar`.
///
/// [src] acepta una URL de red o ruta de asset. [fallback] se muestra mientras
/// carga o si la imagen falla (p. ej. iniciales).
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
