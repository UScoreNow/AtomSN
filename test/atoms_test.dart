import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hugeicons/hugeicons.dart';

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
}
