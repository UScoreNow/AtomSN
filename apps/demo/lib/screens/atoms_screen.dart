import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Screen that shows all of AtomSN's atomic components.
class AtomsScreen extends StatefulWidget {
  const AtomsScreen({super.key});

  @override
  State<AtomsScreen> createState() => _AtomsScreenState();
}

class _AtomsScreenState extends State<AtomsScreen> {
  bool _checkboxValue = false;
  bool _switchValue = true;
  bool _toggleValue = false;
  String _radioValue = 'standard';
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
          title: 'AsnText — typography',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnText.masthead('Masthead'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.h1('Headline H1'),
              AsnText.h2('Headline H2'),
              AsnText.h3('Heading H3'),
              AsnText.h4('Heading H4'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.lead('Lead: introductory summary of the block.'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.bodyLarge('Large body to highlight a paragraph.'),
              AsnText.body('Standard body, the most common text in the system.'),
              AsnText.bodySmall('Small body for secondary notes.'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.label('Form label'),
              AsnText.caption('Caption / supporting footnote'),
              AsnText.overline('group a'),
              SizedBox(height: AsnSpacing.x2),
              AsnText.blockquote('"An editorial quote in italics."'),
              AsnText.listItem('List item'),
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
              AsnText.link('Example link'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnText — semantic color',
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
          title: 'AsnButton — variants',
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
          title: 'AsnButton — sizes',
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
          title: 'AsnButton — icon left / right (centered content)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AsnButton(
                expanded: true,
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedAdd01),
                onPressed: () {},
                child: const Text('Icon on the left'),
              ),
              const SizedBox(height: AsnSpacing.x2),
              AsnButton(
                expanded: true,
                variant: AsnButtonVariant.outline,
                trailing: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                ),
                onPressed: () {},
                child: const Text('Icon on the right'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnIconButton — variants',
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
            label: const Text('I accept the terms'),
            sublabel: const Text('You can change this whenever you want'),
          ),
        ),
        DemoBlock(
          title: 'AsnSwitch',
          child: AsnSwitch(
            value: _switchValue,
            onChanged: (v) => setState(() => _switchValue = v),
            label: const Text('Notifications'),
            sublabel: const Text('Receive alerts by email'),
          ),
        ),
        DemoBlock(
          title: 'AsnRadioGroup',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnRadioGroup<String>(
                initialValue: _radioValue,
                onChanged: (v) => setState(() => _radioValue = v ?? _radioValue),
                options: const [
                  AsnRadioOption(
                    value: 'standard',
                    label: Text('Standard delivery'),
                    sublabel: Text('3-5 business days'),
                  ),
                  AsnRadioOption(
                    value: 'express',
                    label: Text('Express delivery'),
                    sublabel: Text('1-2 business days'),
                  ),
                ],
              ),
              const SizedBox(height: AsnSpacing.x2),
              Text('Selected: $_radioValue'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnInput',
          child: AsnInput(
            controller: _inputController,
            placeholder: 'Enter your name',
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
            placeholder: 'Tell us more...',
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
              Text('Code: $_otpValue'),
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
              Text('Value: ${_sliderValue.toStringAsFixed(2)}'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnProgress',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnProgress.determinate(_progressValue),
              const SizedBox(height: AsnSpacing.x3),
              const AsnProgress.indeterminate(),
              const SizedBox(height: AsnSpacing.x3),
              AsnButton(
                size: AsnButtonSize.sm,
                onPressed: () => setState(() => _counter++),
                child: const Text('Advance'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnSeparator',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Above'),
              const AsnSeparator(space: AsnSpacing.x6),
              const Text('Below'),
              const SizedBox(height: AsnSpacing.x3),
              SizedBox(
                height: 32,
                child: Row(
                  children: const [
                    Text('Left'),
                    AsnVerticalSeparator(space: AsnSpacing.x6),
                    Text('Right'),
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
            message: 'Help text',
            child: AsnBadge(child: Text('Hover here')),
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
            child: const Text('Bold'),
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
              Text('Rating: $_starValue / 5'),
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
                child: const Text('Add 7'),
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

/// Icon button with its variant label below.
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
