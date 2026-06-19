import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';

void main() => runApp(const GalleryApp());

class GalleryApp extends StatefulWidget {
  const GalleryApp({super.key});

  @override
  State<GalleryApp> createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp> {
  ThemeMode _mode = ThemeMode.light;

  void _toggle() => setState(() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  });

  @override
  Widget build(BuildContext context) {
    return AxApp(
      title: 'atomic_ui gallery',
      themeMode: _mode,
      home: _Gallery(mode: _mode, onToggleMode: _toggle),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.mode, required this.onToggleMode});

  final ThemeMode mode;
  final VoidCallback onToggleMode;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Container(
      color: colors.bgBase,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AxSpacing.x6),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'atomic_ui',
                  style: TextStyle(
                    fontSize: AxFontSize.xl4,
                    color: colors.textPrimary,
                  ),
                ),
                AxButton(
                  variant: AxButtonVariant.outline,
                  onPressed: onToggleMode,
                  child: Text(
                    mode == ThemeMode.light ? 'Night Press' : 'Paper',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AxSpacing.x6),
            _Section(
              title: 'Atoms',
              child: Wrap(
                spacing: AxSpacing.x3,
                runSpacing: AxSpacing.x3,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const AxButton(child: Text('Primary')),
                  const AxButton(
                    variant: AxButtonVariant.secondary,
                    child: Text('Secondary'),
                  ),
                  const AxButton(
                    variant: AxButtonVariant.destructive,
                    child: Text('Destructive'),
                  ),
                  const AxBadge(child: Text('Badge')),
                  const AxBadge(
                    variant: AxBadgeVariant.outline,
                    child: Text('Outline'),
                  ),
                  AxCheckbox(value: true, onChanged: (_) {}),
                  AxSwitch(value: true, onChanged: (_) {}),
                  const AxStarRating(value: 3),
                  const SizedBox(width: 160, child: AxProgress(value: 0.6)),
                  const AxSkeleton(width: 120),
                ],
              ),
            ),
            _Section(
              title: 'Forms',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AxInput(placeholder: 'Email'),
                  const SizedBox(height: AxSpacing.x3),
                  const AxTextarea(placeholder: 'Mensaje'),
                  const SizedBox(height: AxSpacing.x3),
                  AxSelect<String>(
                    placeholder: 'Elige un equipo',
                    options: const [
                      AxSelectOption(value: 'a', label: 'Equipo A'),
                      AxSelectOption(value: 'b', label: 'Equipo B'),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            _Section(
              title: 'Molecules',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AxAlert(
                    title: Text('Heads up'),
                    description: Text('Esto es una alerta informativa.'),
                  ),
                  const SizedBox(height: AxSpacing.x3),
                  AxCard(
                    title: const Text('Card'),
                    description: const Text('Con titulo y cuerpo.'),
                    child: const Text('Contenido de la card.'),
                  ),
                ],
              ),
            ),
            _Section(
              title: 'Organisms',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AxStepper(
                    currentIndex: 1,
                    steps: [
                      AxStep(title: 'Datos'),
                      AxStep(title: 'Pago'),
                      AxStep(title: 'Fin'),
                    ],
                  ),
                  const SizedBox(height: AxSpacing.x4),
                  AxButton(
                    onPressed: () => AxDialog.show<void>(
                      context,
                      title: const Text('Dialogo'),
                      content: const Text('Hola desde AxDialog.'),
                    ),
                    child: const Text('Abrir dialogo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AxSpacing.x8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: AxFontSize.sm,
              fontWeight: AxFontWeight.semibold,
              letterSpacing: 1,
              color: colors.textMuted,
            ),
          ),
          const SizedBox(height: AxSpacing.x3),
          child,
        ],
      ),
    );
  }
}
