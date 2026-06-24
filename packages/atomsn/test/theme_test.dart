import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('newsprint preset respeta las reglas duras del sistema', () {
    // Sin negro ni blanco puros.
    const forbidden = [Color(0xFF000000), Color(0xFFFFFFFF)];
    for (final c in [AsnNewsprint.light, AsnNewsprint.dark]) {
      expect(forbidden.contains(c.bgBase), isFalse);
      expect(forbidden.contains(c.textPrimary), isFalse);
    }
    // Brillos correctos.
    expect(AsnNewsprint.light.brightness, Brightness.light);
    expect(AsnNewsprint.dark.brightness, Brightness.dark);
  });

  test('AsnColorScheme deriva ShadColorScheme desde los roles semanticos', () {
    final scheme = AsnColorScheme.fromSemantic(AsnNewsprint.light);
    expect(scheme.background, AsnNewsprint.light.bgBase);
    expect(scheme.primary, AsnNewsprint.light.actionPrimary);
    // Roles editoriales extra viajan en el mapa custom.
    expect(scheme.custom['link'], AsnNewsprint.light.link);
    expect(scheme.custom['warning'], AsnNewsprint.light.statusWarning);
  });

  testWidgets('AsnTheme.of devuelve los colores del modo activo bajo AsnApp', (
    tester,
  ) async {
    late AsnSemanticColors seen;
    await tester.pumpWidget(
      AsnApp(
        home: Builder(
          builder: (context) {
            seen = AsnTheme.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(seen.brightness, Brightness.light);
    expect(seen.bgBase, AsnNewsprint.light.bgBase);
  });

  testWidgets('El texto plano hereda la familia ElmsSans del tema', (
    tester,
  ) async {
    late TextStyle defaultStyle;
    await tester.pumpWidget(
      AsnApp(
        home: Builder(
          builder: (context) {
            defaultStyle = DefaultTextStyle.of(context).style;
            return const Text('x');
          },
        ),
      ),
    );
    // Sin la familia en el textStyle raiz del app, un Text plano caia en la
    // fuente del sistema (Roboto) en vez de ElmsSans.
    expect(defaultStyle.fontFamily, AsnTextTheme.fontFamily);
  });
}
