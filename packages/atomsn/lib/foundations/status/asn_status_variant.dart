/// Semantic status variant shared by the feedback components
/// (e.g. [AsnAlert] and [AsnToast]).
///
/// Foundational layer: defines the status roles, not their concrete style. The
/// mapping to colors and icons lives in the components layer
/// (`AsnStatusStyle.resolve`), which resolves each variant against the
/// active `AsnSemanticColors`.
enum AsnStatusVariant {
  /// Neutral, with no tint or icon by default.
  normal,

  /// Informative.
  info,

  /// Warning.
  warning,

  /// Error or failure.
  error,

  /// Successful operation.
  success,
}
