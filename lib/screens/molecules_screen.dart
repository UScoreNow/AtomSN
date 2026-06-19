import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart' show Icons, Icon;
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla de demostracion de todas las moleculas del paquete atomic_ui.
class MoleculesScreen extends StatefulWidget {
  const MoleculesScreen({super.key});

  @override
  State<MoleculesScreen> createState() => _MoleculesScreenState();
}

class _MoleculesScreenState extends State<MoleculesScreen> {
  String? _selectedTeam;
  DateTime? _selectedDate;
  AxTime? _selectedTime;
  List<String> _chips = const ['diseno', 'frontend'];
  String _phone = '+34';
  int _page = 1;
  bool _collapsed = false;
  Color? _color = const Color(0xFF6366F1);
  String _tab = 'resumen';
  bool _popoverVisible = false;

  static const List<AxSelectOption<String>> _teamOptions = [
    AxSelectOption(value: 'avengers', label: 'Los Vengadores'),
    AxSelectOption(value: 'liga', label: 'Liga de la Justicia'),
    AxSelectOption(value: 'guardianes', label: 'Guardianes de la Galaxia'),
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
          title: 'AxSelect',
          child: AxSelect<String>(
            value: _selectedTeam,
            placeholder: 'Selecciona un equipo',
            options: _teamOptions,
            onChanged: (value) => setState(() => _selectedTeam = value),
          ),
        ),
        DemoBlock(
          title: 'AxAlert',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              AxAlert(
                icon: Icon(Icons.info_outline),
                title: Text('Informacion'),
                description: Text('Tu sesion se cerrara en 5 minutos.'),
              ),
              SizedBox(height: AxSpacing.x3),
              AxAlert(
                variant: AxAlertVariant.destructive,
                icon: Icon(Icons.error_outline),
                title: Text('Error'),
                description: Text('No se pudo guardar el documento.'),
              ),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AxCard',
          child: AxCard(
            title: Text('Plan Pro'),
            description: Text('Facturacion mensual'),
            footer: Text('29 EUR / mes'),
            child: Text('Incluye soporte prioritario y usuarios ilimitados.'),
          ),
        ),
        const DemoBlock(
          title: 'AxAccordion',
          child: AxAccordion(
            items: [
              AxAccordionItem(
                title: Text('Que es atomic_ui?'),
                content: Text('Una biblioteca de componentes para Flutter.'),
              ),
              AxAccordionItem(
                title: Text('Es de codigo abierto?'),
                content: Text('Si, se distribuye con licencia permisiva.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxTabs',
          child: AxTabs<String>(
            value: _tab,
            onChanged: (value) => setState(() => _tab = value),
            tabs: const [
              AxTabItem(
                value: 'resumen',
                label: Text('Resumen'),
                content: Text('Vista general del proyecto.'),
              ),
              AxTabItem(
                value: 'actividad',
                label: Text('Actividad'),
                content: Text('Ultimos cambios del equipo.'),
              ),
              AxTabItem(
                value: 'ajustes',
                label: Text('Ajustes'),
                content: Text('Preferencias y permisos.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxBreadcrumb',
          child: AxBreadcrumb(
            items: [
              AxBreadcrumbItem(label: const Text('Inicio'), onTap: () {}),
              AxBreadcrumbItem(label: const Text('Proyectos'), onTap: () {}),
              const AxBreadcrumbItem(label: Text('Detalle')),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxDatePicker',
          child: AxDatePicker(
            selected: _selectedDate,
            onChanged: (date) => setState(() => _selectedDate = date),
          ),
        ),
        DemoBlock(
          title: 'AxTimePicker',
          child: AxTimePicker(
            value: _selectedTime,
            onChanged: (time) => setState(() => _selectedTime = time),
          ),
        ),
        DemoBlock(
          title: 'AxPopover',
          child: AxPopover(
            visible: _popoverVisible,
            onVisibleChanged: (visible) =>
                setState(() => _popoverVisible = visible),
            popover: const SizedBox(
              width: 200,
              child: Text('Contenido del popover anclado al boton.'),
            ),
            child: AxButton(
              variant: AxButtonVariant.outline,
              size: AxButtonSize.sm,
              onPressed: () =>
                  setState(() => _popoverVisible = !_popoverVisible),
              child: const Text('Abrir popover'),
            ),
          ),
        ),
        DemoBlock(
          title: 'AxFormField',
          child: AxFormField(
            label: 'Correo electronico',
            description: 'Usaremos esta direccion para notificaciones.',
            child: AxInput(
              placeholder: 'tu@empresa.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        DemoBlock(
          title: 'AxChipInput',
          child: AxChipInput(
            values: _chips,
            placeholder: 'Escribe y pulsa Enter',
            onChanged: (values) => setState(() => _chips = values),
          ),
        ),
        DemoBlock(
          title: 'AxPhoneInput',
          child: AxPhoneInput(
            value: _phone,
            placeholder: 'Numero de telefono',
            onChanged: (value) => setState(() => _phone = value),
          ),
        ),
        const DemoBlock(
          title: 'AxAvatarGroup',
          child: AxAvatarGroup(
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
          title: 'AxPagination',
          child: AxPagination(
            page: _page,
            pageCount: 5,
            onChanged: (page) => setState(() => _page = page),
          ),
        ),
        DemoBlock(
          title: 'AxCollapsible',
          child: AxCollapsible(
            expanded: !_collapsed,
            onChanged: (expanded) => setState(() => _collapsed = !expanded),
            header: const Text('Detalles avanzados'),
            child: const Text(
              'Configuracion opcional que se muestra al expandir la seccion.',
            ),
          ),
        ),
        DemoBlock(
          title: 'AxColorPicker',
          child: AxColorPicker(
            swatches: _swatches,
            value: _color,
            onChanged: (color) => setState(() => _color = color),
          ),
        ),
        const DemoBlock(
          title: 'AxTracker',
          child: AxTracker(
            cells: [
              AxTrackerCell(tooltip: 'Operativo'),
              AxTrackerCell(tooltip: 'Operativo'),
              AxTrackerCell(
                color: Color(0xFFF59E0B),
                tooltip: 'Degradado',
              ),
              AxTrackerCell(tooltip: 'Operativo'),
              AxTrackerCell(
                color: Color(0xFFEF4444),
                tooltip: 'Caida',
              ),
              AxTrackerCell(tooltip: 'Operativo'),
              AxTrackerCell(tooltip: 'Operativo'),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AxHoverCard',
          child: AxHoverCard(
            card: Text(
              'Tarjeta flotante que aparece al pasar el cursor por encima.',
            ),
            child: Text('Pasa el cursor por aqui'),
          ),
        ),
      ],
    );
  }
}
