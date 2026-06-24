import 'package:atomsn/atomsn.dart';
import 'package:atomsn_demo/screens/atoms_screen.dart';
import 'package:atomsn_demo/screens/molecules_screen.dart';
import 'package:atomsn_demo/screens/organisms_screen.dart';
import 'package:atomsn_demo/screens/templates_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) => AsnApp(home: child);

void main() {
  testWidgets('OrganismsScreen renders without exceptions', (tester) async {
    await tester.pumpWidget(_host(const OrganismsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    // The top blocks are visible; the rest is built on scroll (lazy
    // ListView). It is enough to confirm the screen mounts without error.
    expect(find.text('AsnDialog'), findsOneWidget);
    expect(find.text('AsnSheet'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('AtomsScreen renders', (tester) async {
    await tester.pumpWidget(_host(const AtomsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('AsnText'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('MoleculesScreen renders', (tester) async {
    await tester.pumpWidget(_host(const MoleculesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AsnSelect'), findsOneWidget);
  });

  testWidgets('TemplatesScreen renders', (tester) async {
    await tester.pumpWidget(_host(const TemplatesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AsnPageScaffold'), findsOneWidget);
  });
}
