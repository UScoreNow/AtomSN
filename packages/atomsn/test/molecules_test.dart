import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// Prefix to avoid clashing with AtomSN's re-export of HugeIcon.
import 'package:shadcn_ui/shadcn_ui.dart' as shad;

Widget _host(Widget child) => AsnApp(home: Center(child: child));

String? _needsAt(String value) => value.contains('@') ? null : 'Invalid email';

void main() {
  testWidgets('AsnForm validates its fields through AsnForm.of', (tester) async {
    bool? valid;
    await tester.pumpWidget(
      _host(
        AsnForm(
          child: Builder(
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AsnInputFormField(
                  id: 'email',
                  initialValue: 'nope',
                  validator: _needsAt,
                ),
                AsnButton(
                  onPressed: () => valid = AsnForm.of(context).validate(),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(valid, isFalse);
    expect(find.text('Invalid email'), findsOneWidget);
  });

  testWidgets('AsnBreadcrumb renders a dropdown item', (tester) async {
    await tester.pumpWidget(
      _host(
        AsnBreadcrumb(
          items: [
            const AsnBreadcrumbItem(label: Text('Home')),
            AsnBreadcrumbItem.dropdown(
              trigger: const Text('More'),
              menuItems: [
                AsnBreadcrumbMenuItem(label: const Text('Projects')),
              ],
            ),
          ],
        ),
      ),
    );
    expect(find.byType(shad.ShadBreadcrumbDropdown), findsOneWidget);
  });
}
