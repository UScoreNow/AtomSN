import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// Prefijo para no chocar con la reexportacion de HugeIcon de AtomSN.
import 'package:shadcn_ui/shadcn_ui.dart' as shad;

Widget _host(Widget child) => AsnApp(home: Center(child: child));

void main() {

  testWidgets('AsnButton invoca onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AsnButton(onPressed: () => taps++, child: const Text('Go'))),
    );
    await tester.tap(find.text('Go'));
    expect(taps, 1);
  });

  testWidgets('AsnButton deshabilitado no invoca onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(
        AsnButton(
          enabled: false,
          onPressed: () => taps++,
          child: const Text('Nope'),
        ),
      ),
    );
    await tester.tap(find.text('Nope'), warnIfMissed: false);
    expect(taps, 0);
  });

  testWidgets('AsnCheckbox reporta el nuevo valor', (tester) async {
    bool? next;
    await tester.pumpWidget(
      _host(AsnCheckbox(value: false, onChanged: (v) => next = v)),
    );
    await tester.tap(find.byType(AsnCheckbox));
    expect(next, true);
  });

  testWidgets('AsnStarRating reporta la estrella pulsada', (tester) async {
    int? rated;
    await tester.pumpWidget(
      _host(AsnStarRating(value: 0, onChanged: (v) => rated = v)),
    );
    // Pulsa la tercera estrella (icono Hugeicons).
    await tester.tap(find.byType(HugeIcon).at(2));
    expect(rated, 3);
  });

  testWidgets('AsnInputOtp da estilo ElmsSans tabular a cada slot', (
    tester,
  ) async {
    await tester.pumpWidget(_host(const AsnInputOtp(length: 4)));
    final slots = tester.widgetList<shad.ShadInputOTPSlot>(
      find.byType(shad.ShadInputOTPSlot),
    );
    expect(slots.length, 4);
    for (final slot in slots) {
      final style = slot.style;
      expect(style, isNotNull);
      // ElmsSans (familia unica), no el GeistMono por defecto de shadcn.
      expect(style!.fontFamily, AsnTextTheme.fontFamily);
      // Cifras tabulares para alinear los digitos.
      expect(style.fontFeatures, contains(const FontFeature.tabularFigures()));
    }
  });

  testWidgets('AsnText aplica rol, color y mayusculas de overline', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        const Column(
          children: [
            AsnText.h1('Titular'),
            AsnText.body('Cuerpo'),
            AsnText.overline('grupo a'),
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
    expect(h1.style!.color, AsnNewsprint.light.textPrimary);
  });

  testWidgets('AsnText.link invoca onTap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AsnText.link('Abrir', onTap: () => taps++)),
    );
    await tester.tap(find.text('Abrir'));
    expect(taps, 1);
  });
}
