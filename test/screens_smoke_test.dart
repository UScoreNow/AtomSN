import 'package:atomic_ui/atomic_ui.dart';
import 'package:atomic_ui_demo/screens/atoms_screen.dart';
import 'package:atomic_ui_demo/screens/molecules_screen.dart';
import 'package:atomic_ui_demo/screens/organisms_screen.dart';
import 'package:atomic_ui_demo/screens/templates_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) => AxApp(home: child);

void main() {
  testWidgets('OrganismsScreen renderiza sin excepciones', (tester) async {
    await tester.pumpWidget(_host(const OrganismsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    // Los bloques superiores son visibles; el resto se construye al hacer
    // scroll (ListView lazy). Basta confirmar que la pantalla monta sin error.
    expect(find.text('AxDialog'), findsOneWidget);
    expect(find.text('AxSheet'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('AtomsScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const AtomsScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('AxButton'), findsWidgets);
  });

  testWidgets('MoleculesScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const MoleculesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AxSelect'), findsOneWidget);
  });

  testWidgets('TemplatesScreen renderiza', (tester) async {
    await tester.pumpWidget(_host(const TemplatesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('AxPageScaffold'), findsOneWidget);
  });
}
