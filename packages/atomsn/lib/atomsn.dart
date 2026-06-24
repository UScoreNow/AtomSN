/// AtomSN — Flutter component library (atomic design + clean
/// architecture) on top of shadcn_ui, with the "newsprint" editorial theme by default.
library;

// Iconography: Hugeicons is the system's single icon library (strokeRounded
// style). Re-exported so apps use `HugeIcon`/`HugeIcons`
// without depending on Material Icons.
export 'package:hugeicons/hugeicons.dart';

// Foundations (layer 0).
export 'foundations/border/asn_borders.dart';
export 'foundations/color/asn_semantic_colors.dart';
export 'foundations/radius/asn_radius.dart';
export 'foundations/spacing/asn_spacing.dart';
export 'foundations/status/asn_status_variant.dart';
export 'foundations/typography/asn_type_scale.dart';

// Theme (layer 1).
export 'theme/asn_app.dart';
export 'theme/asn_color_scheme.dart';
export 'theme/asn_text_theme.dart';
export 'theme/asn_theme.dart';
export 'theme/asn_theme_extension.dart';
export 'theme/presets/newsprint_preset.dart';

// Components (layer 2).
export 'components/atoms/atoms.dart';
export 'components/molecules/molecules.dart';
export 'components/organisms/organisms.dart';
export 'components/templates/templates.dart';
