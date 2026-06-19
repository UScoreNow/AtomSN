import 'package:flutter/widgets.dart';

import '../../foundations/color/ax_semantic_colors.dart';
import '../../foundations/spacing/ax_spacing.dart';
import '../../theme/ax_theme.dart';

/// Paso de un [AxStepper] o [AxSteps].
@immutable
class AxStep {
  const AxStep({required this.title, this.subtitle});

  final String title;
  final String? subtitle;
}

/// Indicador de pasos horizontal. Widget propio (inspirado en shadcn_flutter).
///
/// Pinta circulos numerados unidos por conectores: `actionPrimary` para pasos
/// completados o el actual, `border` para los pendientes.
class AxStepper extends StatelessWidget {
  const AxStepper({super.key, required this.steps, required this.currentIndex});

  final List<AxStep> steps;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
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
                const SizedBox(height: AxSpacing.x2),
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
                  const SizedBox(height: AxSpacing.x1),
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

  Widget _connector(AxSemanticColors colors, {required bool done}) {
    return Container(
      height: 2,
      color: done ? colors.actionPrimary : colors.borderDefault,
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
