import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Demo screen for all of the AtomSN package's molecules.
class MoleculesScreen extends StatefulWidget {
  const MoleculesScreen({super.key});

  @override
  State<MoleculesScreen> createState() => _MoleculesScreenState();
}

class _MoleculesScreenState extends State<MoleculesScreen> {
  String? _selectedTeam;
  DateTime? _selectedDate;
  AsnTime? _selectedTime;
  List<String> _chips = const ['design', 'frontend'];
  String _phone = '+34';
  int _page = 1;
  bool _collapsed = false;
  Color? _color = const Color(0xFF6366F1);
  String _tab = 'overview';
  bool _popoverVisible = false;

  static const List<AsnSelectOption<String>> _teamOptions = [
    AsnSelectOption(value: 'avengers', label: 'The Avengers'),
    AsnSelectOption(value: 'liga', label: 'Justice League'),
    AsnSelectOption(value: 'guardianes', label: 'Guardians of the Galaxy'),
  ];

  static const List<Color> _swatches = [
    Color(0xFF6366F1),
    Color(0xFFEC4899),
    Color(0xFF22C55E),
    Color(0xFFF59E0B),
    Color(0xFF06B6D4),
    Color(0xFFEF4444),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AsnSelect',
          child: AsnSelect<String>(
            value: _selectedTeam,
            placeholder: 'Select a team',
            options: _teamOptions,
            onChanged: (value) => setState(() => _selectedTeam = value),
          ),
        ),
        DemoBlock(
          title: 'AsnAlert',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              AsnAlert(
                title: Text('Normal'),
                description: Text('Neutral message with no tint or icon.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.info,
                title: Text('Information'),
                description: Text('Your session will end in 5 minutes.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.warning,
                title: Text('Warning'),
                description: Text('You have unsaved changes.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.error,
                title: Text('Error'),
                description: Text('The document could not be saved.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.success,
                title: Text('Done'),
                description: Text('The document was saved successfully.'),
              ),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AsnCard',
          child: AsnCard(
            title: Text('Pro Plan'),
            description: Text('Monthly billing'),
            footer: Text('29 EUR / month'),
            child: Text('Includes priority support and unlimited users.'),
          ),
        ),
        const DemoBlock(
          title: 'AsnAccordion',
          child: AsnAccordion(
            items: [
              AsnAccordionItem(
                title: Text('What is AtomSN?'),
                content: Text('A component library for Flutter.'),
              ),
              AsnAccordionItem(
                title: Text('Is it open source?'),
                content: Text('Yes, it ships under a permissive license.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnTabs',
          child: AsnTabs<String>(
            value: _tab,
            onChanged: (value) => setState(() => _tab = value),
            tabs: const [
              AsnTabItem(
                value: 'overview',
                label: Text('Overview'),
                content: Text('General view of the project.'),
              ),
              AsnTabItem(
                value: 'activity',
                label: Text('Activity'),
                content: Text("The team's latest changes."),
              ),
              AsnTabItem(
                value: 'settings',
                label: Text('Settings'),
                content: Text('Preferences and permissions.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnBreadcrumb',
          child: AsnBreadcrumb(
            items: [
              AsnBreadcrumbItem(label: const Text('Home'), onTap: () {}),
              AsnBreadcrumbItem(label: const Text('Projects'), onTap: () {}),
              const AsnBreadcrumbItem(label: Text('Detail')),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnCalendar',
          child: SizedBox(
            height: 360,
            child: AsnCalendar(
              selected: _selectedDate,
              onChanged: (date) => setState(() => _selectedDate = date),
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnTimePicker',
          child: AsnTimePicker(
            value: _selectedTime,
            onChanged: (time) => setState(() => _selectedTime = time),
          ),
        ),
        DemoBlock(
          title: 'AsnPopover',
          child: AsnPopover(
            visible: _popoverVisible,
            onVisibleChanged: (visible) =>
                setState(() => _popoverVisible = visible),
            popover: const SizedBox(
              width: 200,
              child: Text('Popover content anchored to the button.'),
            ),
            child: AsnButton(
              variant: AsnButtonVariant.outline,
              size: AsnButtonSize.sm,
              onPressed: () =>
                  setState(() => _popoverVisible = !_popoverVisible),
              child: const Text('Open popover'),
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnFormField',
          child: AsnFormField(
            label: 'Email',
            description: 'We will use this address for notifications.',
            child: AsnInput(
              placeholder: 'you@company.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnChipInput',
          child: AsnChipInput(
            values: _chips,
            placeholder: 'Type and press Enter',
            onChanged: (values) => setState(() => _chips = values),
          ),
        ),
        DemoBlock(
          title: 'AsnPhoneInput',
          child: AsnPhoneInput(
            value: _phone,
            placeholder: 'Phone number',
            onChanged: (value) => setState(() => _phone = value),
          ),
        ),
        const DemoBlock(
          title: 'AsnAvatarGroup',
          child: AsnAvatarGroup(
            srcs: [
              'https://i.pravatar.cc/100?img=1',
              'https://i.pravatar.cc/100?img=2',
              'https://i.pravatar.cc/100?img=3',
              'https://i.pravatar.cc/100?img=4',
              'https://i.pravatar.cc/100?img=5',
              'https://i.pravatar.cc/100?img=6',
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnPagination',
          child: AsnPagination(
            page: _page,
            pageCount: 5,
            onChanged: (page) => setState(() => _page = page),
          ),
        ),
        DemoBlock(
          title: 'AsnCollapsible',
          child: AsnCollapsible(
            expanded: !_collapsed,
            onChanged: (expanded) => setState(() => _collapsed = !expanded),
            header: const Text('Advanced details'),
            child: const Text(
              'Optional configuration shown when you expand the section.',
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnColorPicker',
          child: AsnColorPicker(
            swatches: _swatches,
            value: _color,
            onChanged: (color) => setState(() => _color = color),
          ),
        ),
        const DemoBlock(
          title: 'AsnTracker',
          child: AsnTracker(
            cells: [
              AsnTrackerCell(tooltip: 'Operational'),
              AsnTrackerCell(tooltip: 'Operational'),
              AsnTrackerCell(
                color: Color(0xFFF59E0B),
                tooltip: 'Degraded',
              ),
              AsnTrackerCell(tooltip: 'Operational'),
              AsnTrackerCell(
                color: Color(0xFFEF4444),
                tooltip: 'Outage',
              ),
              AsnTrackerCell(tooltip: 'Operational'),
              AsnTrackerCell(tooltip: 'Operational'),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AsnHoverCard',
          child: AsnHoverCard(
            card: Text(
              'Floating card that appears when you hover over it.',
            ),
            child: Text('Hover the cursor here'),
          ),
        ),
      ],
    );
  }
}
