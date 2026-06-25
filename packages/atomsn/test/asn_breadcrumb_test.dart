import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart' as shad;

Widget _host(Widget child) => AsnApp(home: Center(child: child));

void main() {
  testWidgets('AsnBreadcrumb renders its links', (tester) async {
    await tester.pumpWidget(
      _host(
        AsnBreadcrumb(
          items: [
            AsnBreadcrumbItem(label: const Text('Home'), onTap: () {}),
            AsnBreadcrumbItem(label: const Text('Components'), onTap: () {}),
            const AsnBreadcrumbItem(label: Text('Breadcrumb')),
          ],
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Components'), findsOneWidget);
    expect(find.text('Breadcrumb'), findsOneWidget);
  });

  testWidgets('AsnBreadcrumb places a custom separator between items', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        AsnBreadcrumb(
          separator: const Text('/'),
          items: [
            AsnBreadcrumbItem(label: const Text('Home'), onTap: () {}),
            AsnBreadcrumbItem(label: const Text('Components'), onTap: () {}),
            const AsnBreadcrumbItem(label: Text('Breadcrumb')),
          ],
        ),
      ),
    );

    // One separator between each of the three items.
    expect(find.text('/'), findsNWidgets(2));
  });

  testWidgets('AsnBreadcrumb.dropdown renders a dropdown trigger', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        AsnBreadcrumb(
          items: [
            AsnBreadcrumbItem(label: const Text('Home'), onTap: () {}),
            AsnBreadcrumbItem.dropdown(
              trigger: const Text('…'),
              menuItems: [
                AsnBreadcrumbMenuItem(label: const Text('Themes'), onTap: () {}),
              ],
            ),
            const AsnBreadcrumbItem(label: Text('Breadcrumb')),
          ],
        ),
      ),
    );

    expect(find.byType(shad.ShadBreadcrumbDropdown), findsOneWidget);
    expect(find.text('…'), findsOneWidget);
  });
}
