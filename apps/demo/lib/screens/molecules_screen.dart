import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla de demostracion de todas las moleculas del paquete AtomSN.
class MoleculesScreen extends StatefulWidget {
  const MoleculesScreen({super.key});

  @override
  State<MoleculesScreen> createState() => _MoleculesScreenState();
}

class _MoleculesScreenState extends State<MoleculesScreen> {
  String? _selectedTeam;
  DateTime? _selectedDate;
  AsnTime? _selectedTime;
  List<String> _chips = const ['diseno', 'frontend'];
  String _phone = '+34';
  int _page = 1;
  bool _collapsed = false;
  Color? _color = const Color(0xFF6366F1);
  String _tab = 'resumen';
  bool _popoverVisible = false;

  static const List<AsnSelectOption<String>> _teamOptions = [
    AsnSelectOption(value: 'avengers', label: 'Los Vengadores'),
    AsnSelectOption(value: 'liga', label: 'Liga de la Justicia'),
    AsnSelectOption(value: 'guardianes', label: 'Guardianes de la Galaxia'),
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
            placeholder: 'Selecciona un equipo',
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
                description: Text('Mensaje neutro sin tinte ni icono.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.info,
                title: Text('Informacion'),
                description: Text('Tu sesion se cerrara en 5 minutos.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.warning,
                title: Text('Advertencia'),
                description: Text('Tienes cambios sin guardar.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.error,
                title: Text('Error'),
                description: Text('No se pudo guardar el documento.'),
              ),
              SizedBox(height: AsnSpacing.x3),
              AsnAlert(
                variant: AsnStatusVariant.success,
                title: Text('Hecho'),
                description: Text('El documento se guardo correctamente.'),
              ),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AsnCard',
          child: AsnCard(
            title: Text('Plan Pro'),
            description: Text('Facturacion mensual'),
            footer: Text('29 EUR / mes'),
            child: Text('Incluye soporte prioritario y usuarios ilimitados.'),
          ),
        ),
        const DemoBlock(
          title: 'AsnAccordion',
          child: AsnAccordion(
            items: [
              AsnAccordionItem(
                title: Text('Que es AtomSN?'),
                content: Text('Una biblioteca de componentes para Flutter.'),
              ),
              AsnAccordionItem(
                title: Text('Es de codigo abierto?'),
                content: Text('Si, se distribuye con licencia permisiva.'),
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
                value: 'resumen',
                label: Text('Resumen'),
                content: Text('Vista general del proyecto.'),
              ),
              AsnTabItem(
                value: 'actividad',
                label: Text('Actividad'),
                content: Text('Ultimos cambios del equipo.'),
              ),
              AsnTabItem(
                value: 'ajustes',
                label: Text('Ajustes'),
                content: Text('Preferencias y permisos.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnBreadcrumb',
          child: AsnBreadcrumb(
            items: [
              AsnBreadcrumbItem(label: const Text('Inicio'), onTap: () {}),
              AsnBreadcrumbItem(label: const Text('Proyectos'), onTap: () {}),
              const AsnBreadcrumbItem(label: Text('Detalle')),
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
              child: Text('Contenido del popover anclado al boton.'),
            ),
            child: AsnButton(
              variant: AsnButtonVariant.outline,
              size: AsnButtonSize.sm,
              onPressed: () =>
                  setState(() => _popoverVisible = !_popoverVisible),
              child: const Text('Abrir popover'),
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnFormField',
          child: AsnFormField(
            label: 'Correo electronico',
            description: 'Usaremos esta direccion para notificaciones.',
            child: AsnInput(
              placeholder: 'tu@empresa.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnChipInput',
          child: AsnChipInput(
            values: _chips,
            placeholder: 'Escribe y pulsa Enter',
            onChanged: (values) => setState(() => _chips = values),
          ),
        ),
        DemoBlock(
          title: 'AsnPhoneInput',
          child: AsnPhoneInput(
            value: _phone,
            placeholder: 'Numero de telefono',
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
            header: const Text('Detalles avanzados'),
            child: const Text(
              'Configuracion opcional que se muestra al expandir la seccion.',
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
              AsnTrackerCell(tooltip: 'Operativo'),
              AsnTrackerCell(tooltip: 'Operativo'),
              AsnTrackerCell(
                color: Color(0xFFF59E0B),
                tooltip: 'Degradado',
              ),
              AsnTrackerCell(tooltip: 'Operativo'),
              AsnTrackerCell(
                color: Color(0xFFEF4444),
                tooltip: 'Caida',
              ),
              AsnTrackerCell(tooltip: 'Operativo'),
              AsnTrackerCell(tooltip: 'Operativo'),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AsnHoverCard',
          child: AsnHoverCard(
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
