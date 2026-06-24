import 'package:atomsn/atomsn.dart';
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
    return AsnApp(
      title: 'AtomSN',
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
    final colors = AsnTheme.of(context);
    return Container(
      color: colors.bgBase,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AsnSpacing.x4,
                AsnSpacing.x4,
                AsnSpacing.x4,
                AsnSpacing.x2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AtomSN',
                    style: TextStyle(
                      fontFamily: AsnTextTheme.fontFamily,
                      fontSize: AsnFontSize.xl4,
                      fontWeight: AsnFontWeight.bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  AsnButton(
                    variant: AsnButtonVariant.outline,
                    onPressed: widget.onToggleMode,
                    child: Text(
                      widget.mode == ThemeMode.light ? 'Night Press' : 'Paper',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AsnSpacing.x4),
              child: Wrap(
                spacing: AsnSpacing.x2,
                runSpacing: AsnSpacing.x2,
                children: [
                  for (var i = 0; i < _sections.length; i++)
                    AsnButton(
                      size: AsnButtonSize.sm,
                      variant: i == _index
                          ? AsnButtonVariant.primary
                          : AsnButtonVariant.ghost,
                      onPressed: () => setState(() => _index = i),
                      child: Text(_sections[i]),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AsnSpacing.x2),
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
