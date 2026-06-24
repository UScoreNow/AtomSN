import 'package:flutter/widgets.dart';

import '../../foundations/color/asn_semantic_colors.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Paso de un [AsnStepper] o [AsnSteps].
@immutable
class AsnStep {
  const AsnStep({required this.title, this.subtitle});

  final String title;
  final String? subtitle;
}

/// Indicador de pasos horizontal. Widget propio (inspirado en shadcn_flutter).
///
/// Pinta circulos numerados unidos por conectores: `actionPrimary` para pasos
/// completados o el actual, `border` para los pendientes.
class AsnStepper extends StatelessWidget {
  const AsnStepper({super.key, required this.steps, required this.currentIndex});

  final List<AsnStep> steps;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: i == 0
                          ? const SizedBox.shrink()
                          : _connector(colors, done: i <= currentIndex),
                    ),
                    _circle(colors, index: i),
                    Expanded(
                      child: i == steps.length - 1
                          ? const SizedBox.shrink()
                          : _connector(colors, done: i < currentIndex),
                    ),
                  ],
                ),
                const SizedBox(height: AsnSpacing.x2),
                Text(
                  steps[i].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: i <= currentIndex
                        ? colors.textPrimary
                        : colors.textMuted,
                  ),
                ),
                if (steps[i].subtitle != null) ...[
                  const SizedBox(height: AsnSpacing.x1),
                  Text(
                    steps[i].subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.textTertiary, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _connector(AsnSemanticColors colors, {required bool done}) {
    return Container(
      height: 2,
      color: done ? colors.actionPrimary : colors.borderDefault,
    );
  }

  Widget _circle(AsnSemanticColors colors, {required int index}) {
    final done = index < currentIndex;
    final current = index == currentIndex;
    final active = done || current;
    return Container(
      width: AsnSpacing.x8,
      height: AsnSpacing.x8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? colors.actionPrimary : colors.bgBase,
        border: Border.all(
          color: active ? colors.actionPrimary : colors.borderDefault,
          width: 2,
        ),
      ),
      child: Text(
        '${index + 1}',
        style: TextStyle(
          color: active ? colors.textOnPrimary : colors.textMuted,
        ),
      ),
    );
  }
}
