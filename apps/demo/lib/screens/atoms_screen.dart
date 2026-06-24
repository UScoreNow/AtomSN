import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla que muestra todos los componentes atomicos de AtomSN.
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
        const DemoBlock(
          title: 'AsnText — tipografía',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnText.masthead('Masthead'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.h1('Titular H1'),
              AsnText.h2('Titular H2'),
              AsnText.h3('Título H3'),
              AsnText.h4('Título H4'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.lead('Entradilla (lead): resumen introductorio del bloque.'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.bodyLarge('Cuerpo grande para destacar un párrafo.'),
              AsnText.body('Cuerpo estándar, el texto más frecuente del sistema.'),
              AsnText.bodySmall('Cuerpo pequeño para notas secundarias.'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.label('Label de formulario'),
              AsnText.caption('Caption / pie de apoyo'),
              AsnText.overline('grupo a'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.blockquote('"Una cita editorial en cursiva."'),
              AsnText.listItem('Elemento de lista'),
              SizedBox(height: AsnSpacing.x3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  AsnText.display('3'),
                  AsnText.h2('  -  '),
                  AsnText.display('1'),
                  SizedBox(width: AsnSpacing.x4),
                  AsnText.stat('+12'),
                ],
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnText.link('Enlace de ejemplo'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnText — color semántico',
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnText.body('primary', color: AsnTextColor.primary),
              AsnText.body('secondary', color: AsnTextColor.secondary),
              AsnText.body('muted', color: AsnTextColor.muted),
              AsnText.body('link', color: AsnTextColor.link),
              AsnText.body('success', color: AsnTextColor.success),
              AsnText.body('error', color: AsnTextColor.error),
              AsnText.body('warning', color: AsnTextColor.warning),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnButton — variantes',
          child: Wrap(
            spacing: AsnSpacing.x2,
            runSpacing: AsnSpacing.x2,
            children: [
              for (final v in AsnButtonVariant.values)
                AsnButton(
                  variant: v,
                  onPressed: () {},
                  child: Text(_buttonVariantLabel(v)),
                ),
              const AsnButton(enabled: false, child: Text('Disabled')),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnButton — tamaños',
          child: Wrap(
            spacing: AsnSpacing.x2,
            runSpacing: AsnSpacing.x2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AsnButton(
                size: AsnButtonSize.sm,
                onPressed: () {},
                child: const Text('Small'),
              ),
              AsnButton(onPressed: () {}, child: const Text('Regular')),
              AsnButton(
                size: AsnButtonSize.lg,
                onPressed: () {},
                child: const Text('Large'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnButton — icono izquierda / derecha (contenido centrado)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AsnButton(
                expanded: true,
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedAdd01),
                onPressed: () {},
                child: const Text('Icono a la izquierda'),
              ),
              const SizedBox(height: AsnSpacing.x2),
              AsnButton(
                expanded: true,
                variant: AsnButtonVariant.outline,
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
          title: 'AsnIconButton — variantes',
          child: Wrap(
            spacing: AsnSpacing.x5,
            runSpacing: AsnSpacing.x3,
            children: [
              _iconButtonDemo(
                AsnIconButtonVariant.primary,
                HugeIcons.strokeRoundedFavourite,
                'primary',
              ),
              _iconButtonDemo(
                AsnIconButtonVariant.secondary,
                HugeIcons.strokeRoundedShare08,
                'secondary',
              ),
              _iconButtonDemo(
                AsnIconButtonVariant.destructive,
                HugeIcons.strokeRoundedDelete02,
                'destructive',
              ),
              _iconButtonDemo(
                AsnIconButtonVariant.outline,
                HugeIcons.strokeRoundedEdit02,
                'outline',
              ),
              _iconButtonDemo(
                AsnIconButtonVariant.ghost,
                HugeIcons.strokeRoundedMoreHorizontal,
                'ghost',
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnBadge',
          child: Wrap(
            spacing: AsnSpacing.x2,
            runSpacing: AsnSpacing.x2,
            children: const [
              AsnBadge(child: Text('Primary')),
              AsnBadge(
                variant: AsnBadgeVariant.secondary,
                child: Text('Secondary'),
              ),
              AsnBadge(variant: AsnBadgeVariant.outline, child: Text('Outline')),
              AsnBadge(
                variant: AsnBadgeVariant.destructive,
                child: Text('Destructive'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnCheckbox',
          child: AsnCheckbox(
            value: _checkboxValue,
            onChanged: (v) => setState(() => _checkboxValue = v),
            label: const Text('Acepto los terminos'),
            sublabel: const Text('Puedes cambiarlo cuando quieras'),
          ),
        ),
        DemoBlock(
          title: 'AsnSwitch',
          child: AsnSwitch(
            value: _switchValue,
            onChanged: (v) => setState(() => _switchValue = v),
            label: const Text('Notificaciones'),
            sublabel: const Text('Recibe avisos por correo'),
          ),
        ),
        DemoBlock(
          title: 'AsnInput',
          child: AsnInput(
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
          title: 'AsnTextarea',
          child: AsnTextarea(
            controller: _textareaController,
            placeholder: 'Cuentanos mas...',
            onChanged: (_) => setState(() {}),
          ),
        ),
        DemoBlock(
          title: 'AsnInputOtp',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnInputOtp(
                length: 6,
                onChanged: (v) => setState(() => _otpValue = v),
              ),
              const SizedBox(height: AsnSpacing.x2),
              Text('Codigo: $_otpValue'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnSlider',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnSlider(
                value: _sliderValue,
                onChanged: (v) => setState(() => _sliderValue = v),
              ),
              const SizedBox(height: AsnSpacing.x2),
              Text('Valor: ${_sliderValue.toStringAsFixed(2)}'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnProgress',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnProgress(value: _progressValue),
              const SizedBox(height: AsnSpacing.x3),
              const AsnProgress(),
              const SizedBox(height: AsnSpacing.x3),
              AsnButton(
                size: AsnButtonSize.sm,
                onPressed: () => setState(() => _counter++),
                child: const Text('Avanzar'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnSeparator',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Arriba'),
              const AsnSeparator(space: AsnSpacing.x6),
              const Text('Abajo'),
              const SizedBox(height: AsnSpacing.x3),
              SizedBox(
                height: 32,
                child: Row(
                  children: const [
                    Text('Izquierda'),
                    AsnVerticalSeparator(space: AsnSpacing.x6),
                    Text('Derecha'),
                  ],
                ),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnAvatar',
          child: Wrap(
            spacing: AsnSpacing.x3,
            runSpacing: AsnSpacing.x3,
            children: const [
              AsnAvatar(fallback: Text('AB')),
              AsnAvatar(
                src: 'https://avatars.githubusercontent.com/u/1?v=4',
                fallback: Text('GH'),
                size: Size(48, 48),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnTooltip',
          child: const AsnTooltip(
            message: 'Texto de ayuda',
            child: AsnBadge(child: Text('Pasa el raton')),
          ),
        ),
        DemoBlock(
          title: 'AsnSkeleton',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AsnSkeleton(width: 200, height: 16),
              SizedBox(height: AsnSpacing.x2),
              AsnSkeleton(width: 140, height: 16),
              SizedBox(height: AsnSpacing.x2),
              AsnSkeleton(width: 80, height: 80),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnToggle',
          child: AsnToggle(
            value: _toggleValue,
            onChanged: (v) => setState(() => _toggleValue = v),
            child: const Text('Negrita'),
          ),
        ),
        DemoBlock(
          title: 'AsnStarRating',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnStarRating(
                value: _starValue,
                onChanged: (v) => setState(() => _starValue = v),
              ),
              const SizedBox(height: AsnSpacing.x2),
              Text('Puntuacion: $_starValue / 5'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnNumberTicker',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnNumberTicker(
                value: _counter.toDouble(),
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: AsnSpacing.x2),
              AsnButton(
                size: AsnButtonSize.sm,
                onPressed: () => setState(() => _counter += 7),
                child: const Text('Sumar 7'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnCodeSnippet',
          child: const AsnCodeSnippet(
            code: "void main() => runApp(const MyApp());",
          ),
        ),
      ],
    );
  }
}

String _buttonVariantLabel(AsnButtonVariant v) => switch (v) {
  AsnButtonVariant.primary => 'Primary',
  AsnButtonVariant.secondary => 'Secondary',
  AsnButtonVariant.destructive => 'Destructive',
  AsnButtonVariant.outline => 'Outline',
  AsnButtonVariant.ghost => 'Ghost',
  AsnButtonVariant.link => 'Link',
};

/// Boton de icono con su etiqueta de variante debajo.
Widget _iconButtonDemo(
  AsnIconButtonVariant variant,
  List<List<dynamic>> icon,
  String label,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AsnIconButton(
        variant: variant,
        icon: HugeIcon(icon: icon),
        onPressed: () {},
      ),
      const SizedBox(height: AsnSpacing.x1),
      Text(label, style: const TextStyle(fontSize: 11)),
    ],
  );
}
