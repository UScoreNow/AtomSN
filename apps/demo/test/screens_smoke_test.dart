import 'package:atomsn/atomsn.dart';
import 'package:atomsn_demo/screens/atoms_screen.dart';
import 'package:atomsn_demo/screens/molecules_screen.dart';
import 'package:atomsn_demo/screens/organisms_screen.dart';
import 'package:atomsn_demo/screens/templates_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) => AsnApp(home: child);

void main() {
  testWidgets('OrganismsScreen renderiza sin excepciones', (tester) async {
    await tester.pumpWidget(_host(const OrganismsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    // Los bloques superiores son visibles; el resto se construye al hacer
    // scroll (ListView lazy). Basta confirmar que la pantalla monta sin error.
    expect(find.text('AsnDialog'), findsOneWidget);
    expect(find.text('AsnSheet'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('AtomsScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const AtomsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('AsnText'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('MoleculesScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const MoleculesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AsnSelect'), findsOneWidget);
  });

  testWidgets('TemplatesScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const TemplatesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AsnPageScaffold'), findsOneWidget);
  });
}
