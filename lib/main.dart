import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';

import 'screens/atoms_screen.dart';
import 'screens/molecules_screen.dart';
import 'screens/organisms_screen.dart';
import 'screens/templates_screen.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _mode = ThemeMode.light;

  void _toggle() => setState(() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  });

  @override
  Widget build(BuildContext context) {
    return AxApp(
      title: 'atomic_ui demo',
      themeMode: _mode,
      home: _DemoHome(mode: _mode, onToggleMode: _toggle),
    );
  }
}

class _DemoHome extends StatefulWidget {
  const _DemoHome({required this.mode, required this.onToggleMode});

  final ThemeMode mode;
  final VoidCallback onToggleMode;

  @override
  State<_DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<_DemoHome> {
  int _index = 0;

  static const _sections = ['Atoms', 'Molecules', 'Organisms', 'Templates'];
  static const _screens = [
    AtomsScreen(),
    MoleculesScreen(),
    OrganismsScreen(),
    TemplatesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Container(
      color: colors.bgBase,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AxSpacing.x4,
                AxSpacing.x4,
                AxSpacing.x4,
                AxSpacing.x2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'atomic_ui',
                    style: TextStyle(
                      fontFamily: AxTextTheme.fontFamily,
                      fontSize: AxFontSize.xl4,
                      fontWeight: AxFontWeight.bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  AxButton(
                    variant: AxButtonVariant.outline,
                    onPressed: widget.onToggleMode,
                    child: Text(
                      widget.mode == ThemeMode.light ? 'Night Press' : 'Paper',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AxSpacing.x4),
              child: Wrap(
                spacing: AxSpacing.x2,
                runSpacing: AxSpacing.x2,
                children: [
                  for (var i = 0; i < _sections.length; i++)
                    AxButton(
                      size: AxButtonSize.sm,
                      variant: i == _index
                          ? AxButtonVariant.primary
                          : AxButtonVariant.ghost,
                      onPressed: () => setState(() => _index = i),
                      child: Text(_sections[i]),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AxSpacing.x2),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: IndexedStack(index: _index, children: _screens),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
