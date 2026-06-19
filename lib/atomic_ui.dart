/// atomic_ui — biblioteca de componentes Flutter (atomic design + clean
/// architecture) sobre shadcn_ui, con el tema editorial "newsprint" por defecto.
library;

// Foundations (capa 0).
export 'foundations/border/ax_borders.dart';
export 'foundations/color/ax_semantic_colors.dart';
export 'foundations/radius/ax_radius.dart';
export 'foundations/spacing/ax_spacing.dart';
export 'foundations/typography/ax_type_scale.dart';

// Theme (capa 1).
export 'theme/ax_app.dart';
export 'theme/ax_color_scheme.dart';
export 'theme/ax_text_theme.dart';
export 'theme/ax_theme.dart';
export 'theme/ax_theme_extension.dart';
export 'theme/presets/newsprint_preset.dart';

// Components (capa 2).
export 'components/atoms/atoms.dart';
export 'components/molecules/molecules.dart';
export 'components/organisms/organisms.dart';
export 'components/templates/templates.dart';
