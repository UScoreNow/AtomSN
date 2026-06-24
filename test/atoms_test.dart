import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// Prefijo para no chocar con la reexportacion de HugeIcon de atomic_ui.
import 'package:shadcn_ui/shadcn_ui.dart' as shad;

Widget _host(Widget child) => AxApp(home: Center(child: child));

void main() {

  testWidgets('AxButton invoca onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AxButton(onPressed: () => taps++, child: const Text('Go'))),
    );
    await tester.tap(find.text('Go'));
    expect(taps, 1);
  });

  testWidgets('AxButton deshabilitado no invoca onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(
        AxButton(
          enabled: false,
          onPressed: () => taps++,
          child: const Text('Nope'),
        ),
      ),
    );
    await tester.tap(find.text('Nope'), warnIfMissed: false);
    expect(taps, 0);
  });

  testWidgets('AxCheckbox reporta el nuevo valor', (tester) async {
    bool? next;
    await tester.pumpWidget(
      _host(AxCheckbox(value: false, onChanged: (v) => next = v)),
    );
    await tester.tap(find.byType(AxCheckbox));
    expect(next, true);
  });

  testWidgets('AxStarRating reporta la estrella pulsada', (tester) async {
    int? rated;
    await tester.pumpWidget(
      _host(AxStarRating(value: 0, onChanged: (v) => rated = v)),
    );
    // Pulsa la tercera estrella (icono Hugeicons).
    await tester.tap(find.byType(HugeIcon).at(2));
    expect(rated, 3);
  });

  testWidgets('AxInputOtp da estilo ElmsSans tabular a cada slot', (
    tester,
  ) async {
    await tester.pumpWidget(_host(const AxInputOtp(length: 4)));
    final slots = tester.widgetList<shad.ShadInputOTPSlot>(
      find.byType(shad.ShadInputOTPSlot),
    );
    expect(slots.length, 4);
    for (final slot in slots) {
      final style = slot.style;
      expect(style, isNotNull);
      // ElmsSans (familia unica), no el GeistMono por defecto de shadcn.
      expect(style!.fontFamily, AxTextTheme.fontFamily);
      // Cifras tabulares para alinear los digitos.
      expect(style.fontFeatures, contains(const FontFeature.tabularFigures()));
    }
  });

  testWidgets('AxText aplica rol, color y mayusculas de overline', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        const Column(
          children: [
            AxText.h1('Titular'),
            AxText.body('Cuerpo'),
            AxText.overline('grupo a'),
          ],
        ),
      ),
    );
    expect(find.text('Titular'), findsOneWidget);
    expect(find.text('Cuerpo'), findsOneWidget);
    // overline transforma a mayusculas.
    expect(find.text('GRUPO A'), findsOneWidget);

    final h1 = tester.widget<Text>(find.text('Titular'));
    final body = tester.widget<Text>(find.text('Cuerpo'));
    // El titular es mayor que el cuerpo y ambos llevan color del tema.
    expect(h1.style!.fontSize! > body.style!.fontSize!, isTrue);
    expect(h1.style!.color, AxNewsprint.light.textPrimary);
  });

  testWidgets('AxText.link invoca onTap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AxText.link('Abrir', onTap: () => taps++)),
    );
    await tester.tap(find.text('Abrir'));
    expect(taps, 1);
  });
}
