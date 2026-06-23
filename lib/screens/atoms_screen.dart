import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla que muestra todos los componentes atomicos de atomic_ui.
class AtomsScreen extends StatefulWidget {
  const AtomsScreen({super.key});

  @override
  State<AtomsScreen> createState() => _AtomsScreenState();
}

class _AtomsScreenState extends State<AtomsScreen> {
  bool _checkboxValue = false;
  bool _switchValue = true;
  bool _toggleValue = false;
  double _sliderValue = 0.4;
  int _starValue = 3;
  int _counter = 0;
  String _otpValue = '';
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _textareaController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    _textareaController.dispose();
    super.dispose();
  }

  double get _progressValue => (_counter % 11) / 10;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AxButton — variantes',
          child: Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            children: [
              for (final v in AxButtonVariant.values)
                AxButton(
                  variant: v,
                  onPressed: () {},
                  child: Text(_buttonVariantLabel(v)),
                ),
              const AxButton(enabled: false, child: Text('Disabled')),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxButton — tamaños',
          child: Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AxButton(
                size: AxButtonSize.sm,
                onPressed: () {},
                child: const Text('Small'),
              ),
              AxButton(onPressed: () {}, child: const Text('Regular')),
              AxButton(
                size: AxButtonSize.lg,
                onPressed: () {},
                child: const Text('Large'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxButton — icono izquierda / derecha (contenido centrado)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AxButton(
                expanded: true,
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedAdd01),
                onPressed: () {},
                child: const Text('Icono a la izquierda'),
              ),
              const SizedBox(height: AxSpacing.x2),
              AxButton(
                expanded: true,
                variant: AxButtonVariant.outline,
                trailing: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                ),
                onPressed: () {},
                child: const Text('Icono a la derecha'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxIconButton — variantes',
          child: Wrap(
            spacing: AxSpacing.x5,
            runSpacing: AxSpacing.x3,
            children: [
              _iconButtonDemo(
                AxIconButtonVariant.primary,
                HugeIcons.strokeRoundedFavourite,
                'primary',
              ),
              _iconButtonDemo(
                AxIconButtonVariant.secondary,
                HugeIcons.strokeRoundedShare08,
                'secondary',
              ),
              _iconButtonDemo(
                AxIconButtonVariant.destructive,
                HugeIcons.strokeRoundedDelete02,
                'destructive',
              ),
              _iconButtonDemo(
                AxIconButtonVariant.outline,
                HugeIcons.strokeRoundedEdit02,
                'outline',
              ),
              _iconButtonDemo(
                AxIconButtonVariant.ghost,
                HugeIcons.strokeRoundedMoreHorizontal,
                'ghost',
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxBadge',
          child: Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            children: const [
              AxBadge(child: Text('Primary')),
              AxBadge(
                variant: AxBadgeVariant.secondary,
                child: Text('Secondary'),
              ),
              AxBadge(variant: AxBadgeVariant.outline, child: Text('Outline')),
              AxBadge(
                variant: AxBadgeVariant.destructive,
                child: Text('Destructive'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxCheckbox',
          child: AxCheckbox(
            value: _checkboxValue,
            onChanged: (v) => setState(() => _checkboxValue = v),
            label: const Text('Acepto los terminos'),
            sublabel: const Text('Puedes cambiarlo cuando quieras'),
          ),
        ),
        DemoBlock(
          title: 'AxSwitch',
          child: AxSwitch(
            value: _switchValue,
            onChanged: (v) => setState(() => _switchValue = v),
            label: const Text('Notificaciones'),
            sublabel: const Text('Recibe avisos por correo'),
          ),
        ),
        DemoBlock(
          title: 'AxInput',
          child: AxInput(
            controller: _inputController,
            placeholder: 'Escribe tu nombre',
            leading: const HugeIcon(
              icon: HugeIcons.strokeRoundedUser,
              size: 16,
            ),
            onChanged: (_) => setState(() {}),
          ),
        ),
        DemoBlock(
          title: 'AxTextarea',
          child: AxTextarea(
            controller: _textareaController,
            placeholder: 'Cuentanos mas...',
            onChanged: (_) => setState(() {}),
          ),
        ),
        DemoBlock(
          title: 'AxInputOtp',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxInputOtp(
                length: 6,
                onChanged: (v) => setState(() => _otpValue = v),
              ),
              const SizedBox(height: AxSpacing.x2),
              Text('Codigo: $_otpValue'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxSlider',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxSlider(
                value: _sliderValue,
                onChanged: (v) => setState(() => _sliderValue = v),
              ),
              const SizedBox(height: AxSpacing.x2),
              Text('Valor: ${_sliderValue.toStringAsFixed(2)}'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxProgress',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxProgress(value: _progressValue),
              const SizedBox(height: AxSpacing.x3),
              const AxProgress(),
              const SizedBox(height: AxSpacing.x3),
              AxButton(
                size: AxButtonSize.sm,
                onPressed: () => setState(() => _counter++),
                child: const Text('Avanzar'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxRoundedDivider',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Arriba'),
              const AxRoundedDivider(space: AxSpacing.x6),
              const Text('Abajo'),
              const SizedBox(height: AxSpacing.x3),
              SizedBox(
                height: 32,
                child: Row(
                  children: const [
                    Text('Izquierda'),
                    AxRoundedVerticalDivider(space: AxSpacing.x6),
                    Text('Derecha'),
                  ],
                ),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxAvatar',
          child: Wrap(
            spacing: AxSpacing.x3,
            runSpacing: AxSpacing.x3,
            children: const [
              AxAvatar(fallback: Text('AB')),
              AxAvatar(
                src: 'https://avatars.githubusercontent.com/u/1?v=4',
                fallback: Text('GH'),
                size: Size(48, 48),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxTooltip',
          child: const AxTooltip(
            message: 'Texto de ayuda',
            child: AxBadge(child: Text('Pasa el raton')),
          ),
        ),
        DemoBlock(
          title: 'AxSkeleton',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AxSkeleton(width: 200, height: 16),
              SizedBox(height: AxSpacing.x2),
              AxSkeleton(width: 140, height: 16),
              SizedBox(height: AxSpacing.x2),
              AxSkeleton(width: 80, height: 80),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxToggle',
          child: AxToggle(
            value: _toggleValue,
            onChanged: (v) => setState(() => _toggleValue = v),
            child: const Text('Negrita'),
          ),
        ),
        DemoBlock(
          title: 'AxStarRating',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxStarRating(
                value: _starValue,
                onChanged: (v) => setState(() => _starValue = v),
              ),
              const SizedBox(height: AxSpacing.x2),
              Text('Puntuacion: $_starValue / 5'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxNumberTicker',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxNumberTicker(
                value: _counter.toDouble(),
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: AxSpacing.x2),
              AxButton(
                size: AxButtonSize.sm,
                onPressed: () => setState(() => _counter += 7),
                child: const Text('Sumar 7'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxCodeSnippet',
          child: const AxCodeSnippet(
            code: "void main() => runApp(const MyApp());",
          ),
        ),
      ],
    );
  }
}

String _buttonVariantLabel(AxButtonVariant v) => switch (v) {
  AxButtonVariant.primary => 'Primary',
  AxButtonVariant.secondary => 'Secondary',
  AxButtonVariant.destructive => 'Destructive',
  AxButtonVariant.outline => 'Outline',
  AxButtonVariant.ghost => 'Ghost',
  AxButtonVariant.link => 'Link',
};

/// Boton de icono con su etiqueta de variante debajo.
Widget _iconButtonDemo(
  AxIconButtonVariant variant,
  List<List<dynamic>> icon,
  String label,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AxIconButton(
        variant: variant,
        icon: HugeIcon(icon: icon),
        onPressed: () {},
      ),
      const SizedBox(height: AxSpacing.x1),
      Text(label, style: const TextStyle(fontSize: 11)),
    ],
  );
}
