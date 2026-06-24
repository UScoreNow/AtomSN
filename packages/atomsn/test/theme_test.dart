import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('newsprint preset respects the system hard rules', () {
    // No pure black or white.
    const forbidden = [Color(0xFF000000), Color(0xFFFFFFFF)];
    for (final c in [AsnNewsprint.light, AsnNewsprint.dark]) {
      expect(forbidden.contains(c.bgBase), isFalse);
      expect(forbidden.contains(c.textPrimary), isFalse);
    }
    // Correct brightnesses.
    expect(AsnNewsprint.light.brightness, Brightness.light);
    expect(AsnNewsprint.dark.brightness, Brightness.dark);
  });

  test('AsnColorScheme derives ShadColorScheme from the semantic roles', () {
    final scheme = AsnColorScheme.fromSemantic(AsnNewsprint.light);
    expect(scheme.background, AsnNewsprint.light.bgBase);
    expect(scheme.primary, AsnNewsprint.light.actionPrimary);
    // Extra editorial roles travel in the custom map.
    expect(scheme.custom['link'], AsnNewsprint.light.link);
    expect(scheme.custom['warning'], AsnNewsprint.light.statusWarning);
  });

  testWidgets('AsnTheme.of returns the active mode colors under AsnApp', (
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

  testWidgets('Plain text inherits the ElmsSans family from the theme', (
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
    // Without the family in the app root textStyle, a plain Text fell back to
    // the system font (Roboto) instead of ElmsSans.
    expect(defaultStyle.fontFamily, AsnTextTheme.fontFamily);
  });
}
