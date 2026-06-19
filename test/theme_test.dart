import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('newsprint preset respeta las reglas duras del sistema', () {
    // Sin negro ni blanco puros.
    const forbidden = [Color(0xFF000000), Color(0xFFFFFFFF)];
    for (final c in [AxNewsprint.light, AxNewsprint.dark]) {
      expect(forbidden.contains(c.bgBase), isFalse);
      expect(forbidden.contains(c.textPrimary), isFalse);
    }
    // Brillos correctos.
    expect(AxNewsprint.light.brightness, Brightness.light);
    expect(AxNewsprint.dark.brightness, Brightness.dark);
  });

  test('AxColorScheme deriva ShadColorScheme desde los roles semanticos', () {
    final scheme = AxColorScheme.fromSemantic(AxNewsprint.light);
    expect(scheme.background, AxNewsprint.light.bgBase);
    expect(scheme.primary, AxNewsprint.light.actionPrimary);
    // Roles editoriales extra viajan en el mapa custom.
    expect(scheme.custom['link'], AxNewsprint.light.link);
    expect(scheme.custom['warning'], AxNewsprint.light.statusWarning);
  });

  testWidgets('AxTheme.of devuelve los colores del modo activo bajo AxApp', (
    tester,
  ) async {
    late AxSemanticColors seen;
    await tester.pumpWidget(
      AxApp(
        home: Builder(
          builder: (context) {
            seen = AxTheme.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(seen.brightness, Brightness.light);
    expect(seen.bgBase, AxNewsprint.light.bgBase);
  });
}
