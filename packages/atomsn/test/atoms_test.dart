import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// Prefix to avoid clashing with AtomSN's re-export of HugeIcon.
import 'package:shadcn_ui/shadcn_ui.dart' as shad;

Widget _host(Widget child) => AsnApp(home: Center(child: child));

void main() {

  testWidgets('AsnButton invokes onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AsnButton(onPressed: () => taps++, child: const Text('Go'))),
    );
    await tester.tap(find.text('Go'));
    expect(taps, 1);
  });

  testWidgets('AsnButton disabled does not invoke onPressed', (tester) async {
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

  testWidgets('AsnCheckbox reports the new value', (tester) async {
    bool? next;
    await tester.pumpWidget(
      _host(AsnCheckbox(value: false, onChanged: (v) => next = v)),
    );
    await tester.tap(find.byType(AsnCheckbox));
    expect(next, true);
  });

  testWidgets('AsnStarRating reports the tapped star', (tester) async {
    int? rated;
    await tester.pumpWidget(
      _host(AsnStarRating(value: 0, onChanged: (v) => rated = v)),
    );
    // Tap the third star (Hugeicons icon).
    await tester.tap(find.byType(HugeIcon).at(2));
    expect(rated, 3);
  });

  testWidgets('AsnInputOtp gives each slot tabular ElmsSans styling', (
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
      // ElmsSans (single family), not shadcn's default GeistMono.
      expect(style!.fontFamily, AsnTextTheme.fontFamily);
      // Tabular figures to align the digits.
      expect(style.fontFeatures, contains(const FontFeature.tabularFigures()));
    }
  });

  testWidgets('AsnText applies role, color and overline uppercase', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        const Column(
          children: [
            AsnText.h1('Headline'),
            AsnText.body('Body'),
            AsnText.overline('group a'),
          ],
        ),
      ),
    );
    expect(find.text('Headline'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);
    // overline transforms to uppercase.
    expect(find.text('GROUP A'), findsOneWidget);

    final h1 = tester.widget<Text>(find.text('Headline'));
    final body = tester.widget<Text>(find.text('Body'));
    // The headline is larger than the body and both carry the theme color.
    expect(h1.style!.fontSize! > body.style!.fontSize!, isTrue);
    expect(h1.style!.color, AsnNewsprint.light.textPrimary);
  });

  testWidgets('AsnText.link invokes onTap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AsnText.link('Open', onTap: () => taps++)),
    );
    await tester.tap(find.text('Open'));
    expect(taps, 1);
  });
}
