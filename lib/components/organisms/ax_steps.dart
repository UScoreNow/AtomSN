import 'package:flutter/widgets.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';
import 'ax_stepper.dart';

/// Lista vertical de pasos numerados. Widget propio.
///
/// Reutiliza el modelo [AxStep]. Marca como activos los pasos hasta
/// [currentIndex] con `actionPrimary`; los pendientes usan `border`.
class AxSteps extends StatelessWidget {
  const AxSteps({super.key, required this.steps, required this.currentIndex});

  final List<AxStep> steps;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < steps.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    _circle(colors, index: i),
                    if (i != steps.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: i < currentIndex
                              ? colors.actionPrimary
                              : colors.borderDefault,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: AxSpacing.x3),
                Padding(
                  padding: const EdgeInsets.only(bottom: AxSpacing.x4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        steps[i].title,
                        style: TextStyle(
                          color: i <= currentIndex
                              ? colors.textPrimary
                              : colors.textMuted,
                        ),
                      ),
                      if (steps[i].subtitle != null) ...[
                        const SizedBox(height: AxSpacing.x1),
                        Text(
                          steps[i].subtitle!,
                          style: TextStyle(
                            color: colors.textTertiary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _circle(AxSemanticColors colors, {required int index}) {
    final done = index < currentIndex;
    final current = index == currentIndex;
    final active = done || current;
    return Container(
      width: AxSpacing.x8,
      height: AxSpacing.x8,
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
