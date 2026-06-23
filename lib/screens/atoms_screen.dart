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
          title: 'AxButton',
          child: Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            children: [
              AxButton(onPressed: () {}, child: const Text('Primary')),
              AxButton(
                onPressed: () {},
                variant: AxButtonVariant.secondary,
                child: const Text('Secondary'),
              ),
              AxButton(
                onPressed: () {},
                variant: AxButtonVariant.destructive,
                child: const Text('Destructive'),
              ),
              AxButton(
                onPressed: () {},
                variant: AxButtonVariant.outline,
                child: const Text('Outline'),
              ),
              AxButton(
                onPressed: () {},
                variant: AxButtonVariant.ghost,
                child: const Text('Ghost'),
              ),
              AxButton(
                onPressed: () {},
                variant: AxButtonVariant.link,
                child: const Text('Link'),
              ),
              AxButton(
                onPressed: () {},
                size: AxButtonSize.sm,
                leading: const HugeIcon(
                  icon: HugeIcons.strokeRoundedAdd01,
                  size: 16,
                ),
                child: const Text('Small'),
              ),
              AxButton(
                onPressed: () {},
                size: AxButtonSize.lg,
                trailing: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                  size: 16,
                ),
                child: const Text('Large'),
              ),
              const AxButton(enabled: false, child: Text('Disabled')),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxIconButton',
          child: Wrap(
            spacing: AxSpacing.x2,
            runSpacing: AxSpacing.x2,
            children: [
              AxIconButton(
                onPressed: () {},
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
              ),
              AxIconButton(
                onPressed: () {},
                variant: AxIconButtonVariant.secondary,
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedShare08),
              ),
              AxIconButton(
                onPressed: () {},
                variant: AxIconButtonVariant.destructive,
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedDelete02),
              ),
              AxIconButton(
                onPressed: () {},
                variant: AxIconButtonVariant.outline,
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedEdit02),
              ),
              AxIconButton(
                onPressed: () {},
                variant: AxIconButtonVariant.ghost,
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedMoreHorizontal,
                ),
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
