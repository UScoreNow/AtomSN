/// Variante semantica de estado compartida por los componentes de feedback
/// (p. ej. [AsnAlert] y [AsnToast]).
///
/// Capa fundacional: define los roles de estado, no su estilo concreto. El
/// mapeo a colores e iconos vive en la capa de componentes
/// (`AsnStatusStyle.resolve`), que resuelve cada variante contra los
/// `AsnSemanticColors` activos.
enum AsnStatusVariant {
  /// Neutro, sin tinte ni icono por defecto.
  normal,

  /// Informativo.
  info,

  /// Advertencia.
  warning,

  /// Error o fallo.
  error,

  /// Operacion correcta.
  success,
}
