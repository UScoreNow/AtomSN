import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla que muestra todos los organismos del paquete AtomSN.
class OrganismsScreen extends StatefulWidget {
  const OrganismsScreen({super.key});

  @override
  State<OrganismsScreen> createState() => _OrganismsScreenState();
}

class _OrganismsScreenState extends State<OrganismsScreen> {
  int _stepperIndex = 1;
  int _stepsIndex = 1;
  int _navIndex = 0;
  DateTime? _selectedDate;
  Set<String> _expandedIds = {'src'};

  static const _navLabels = ['Inicio', 'Articulos', 'Archivo', 'Sobre'];

  static const _tree = [
    AsnTreeNode(
      id: 'src',
      label: 'lib',
      children: [
        AsnTreeNode(
          id: 'components',
          label: 'components',
          children: [
            AsnTreeNode(id: 'atoms', label: 'atoms'),
            AsnTreeNode(id: 'molecules', label: 'molecules'),
            AsnTreeNode(id: 'organisms', label: 'organisms'),
          ],
        ),
        AsnTreeNode(id: 'main', label: 'main.dart'),
      ],
    ),
  ];

  void _toggle(String id) {
    setState(() {
      _expandedIds = {..._expandedIds};
      if (!_expandedIds.add(id)) _expandedIds.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AsnTheme.of(context);

    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AsnDialog',
          child: Row(
            children: [
              AsnButton(
                onPressed: () => AsnDialog.show<void>(
                  context,
                  title: const Text('Publicar edicion'),
                  description: const Text(
                    'La edicion se enviara a impresion de inmediato.',
                  ),
                  actions: [
                    AsnButton(
                      variant: AsnButtonVariant.ghost,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    AsnButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Publicar'),
                    ),
                  ],
                ),
                child: const Text('Abrir dialogo'),
              ),
              const SizedBox(width: AsnSpacing.x3),
              AsnButton(
                variant: AsnButtonVariant.destructive,
                onPressed: () => AsnDialog.showAlert<void>(
                  context,
                  title: const Text('Borrar borrador'),
                  description: const Text('Esta accion no se puede deshacer.'),
                  actions: [
                    AsnButton(
                      variant: AsnButtonVariant.ghost,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    AsnButton(
                      variant: AsnButtonVariant.destructive,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Borrar'),
                    ),
                  ],
                ),
                child: const Text('Abrir alerta'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnSheet',
          child: Row(
            children: [
              AsnButton(
                variant: AsnButtonVariant.outline,
                onPressed: () => AsnSheet.show<void>(
                  context,
                  side: AsnSheetSide.right,
                  title: const Text('Filtros'),
                  description: const Text('Ajusta la lista de articulos.'),
                  child: const Text('Contenido del panel lateral.'),
                ),
                child: const Text('Sheet derecha'),
              ),
              const SizedBox(width: AsnSpacing.x3),
              AsnButton(
                variant: AsnButtonVariant.outline,
                onPressed: () => AsnSheet.show<void>(
                  context,
                  side: AsnSheetSide.bottom,
                  title: const Text('Acciones'),
                  child: const Text('Panel anclado abajo.'),
                ),
                child: const Text('Sheet abajo'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnContextMenu',
          child: AsnContextMenu(
            items: [
              AsnMenuItem(label: 'Copiar', onTap: () {}),
              AsnMenuItem(label: 'Pegar', onTap: () {}),
              const AsnMenuItem(label: 'Eliminar', enabled: false),
            ],
            child: Container(
              padding: const EdgeInsets.all(AsnSpacing.x4),
              decoration: BoxDecoration(
                color: colors.bgSubtle,
                borderRadius: AsnRadius.brMd,
                border: Border.all(color: colors.borderDefault),
              ),
              child: const Text(
                'Click derecho o pulsacion larga aqui',
              ),
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnMenubar',
          child: AsnMenubar(
            menus: [
              AsnMenu(
                label: 'Archivo',
                items: [
                  AsnMenuItem(label: 'Nuevo', onTap: () {}),
                  AsnMenuItem(label: 'Abrir', onTap: () {}),
                  AsnMenuItem(label: 'Guardar', onTap: () {}),
                ],
              ),
              AsnMenu(
                label: 'Editar',
                items: [
                  AsnMenuItem(label: 'Deshacer', onTap: () {}),
                  AsnMenuItem(label: 'Rehacer', onTap: () {}),
                ],
              ),
              AsnMenu(
                label: 'Ver',
                items: [
                  AsnMenuItem(label: 'Zoom +', onTap: () {}),
                  AsnMenuItem(label: 'Zoom -', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnTable',
          // ShadTable usa un viewport 2D: necesita altura acotada dentro de un
          // ListView. Se limita con un SizedBox.
          child: SizedBox(
            height: 160,
            child: AsnTable(
              columns: const [
                AsnTableColumn(header: Text('Seccion')),
                AsnTableColumn(header: Text('Editor')),
                AsnTableColumn(header: Text('Notas')),
              ],
              rows: const [
                [Text('Portada'), Text('A. Soler'), Text('12')],
                [Text('Cultura'), Text('M. Rivas'), Text('8')],
                [Text('Deportes'), Text('J. Pena'), Text('15')],
              ],
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnDatePicker',
          child: AsnDatePicker(
            selected: _selectedDate,
            onChanged: (date) => setState(() => _selectedDate = date),
          ),
        ),
        DemoBlock(
          title: 'AsnResizable',
          child: SizedBox(
            height: 160,
            child: AsnResizable(
              axis: AsnResizableAxis.horizontal,
              panels: [
                _panel(colors, 'Indice'),
                _panel(colors, 'Documento'),
              ],
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnToast',
          child: Wrap(
            spacing: AsnSpacing.x3,
            runSpacing: AsnSpacing.x3,
            children: [
              AsnButton(
                onPressed: () => AsnToast.show(
                  context,
                  title: const Text('Guardado'),
                  description: const Text('El borrador se guardo.'),
                ),
                child: const Text('Normal'),
              ),
              AsnButton(
                onPressed: () => AsnToast.show(
                  context,
                  title: const Text('Informacion'),
                  description: const Text('Hay una actualizacion disponible.'),
                  variant: AsnStatusVariant.info,
                ),
                child: const Text('Info'),
              ),
              AsnButton(
                onPressed: () => AsnToast.show(
                  context,
                  title: const Text('Advertencia'),
                  description: const Text('Tu sesion caduca pronto.'),
                  variant: AsnStatusVariant.warning,
                ),
                child: const Text('Warning'),
              ),
              AsnButton(
                variant: AsnButtonVariant.destructive,
                onPressed: () => AsnToast.show(
                  context,
                  title: const Text('Error'),
                  description: const Text('No se pudo conectar.'),
                  variant: AsnStatusVariant.error,
                ),
                child: const Text('Error'),
              ),
              AsnButton(
                onPressed: () => AsnToast.show(
                  context,
                  title: const Text('Hecho'),
                  description: const Text('Los cambios se publicaron.'),
                  variant: AsnStatusVariant.success,
                ),
                child: const Text('Success'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnStepper',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnStepper(
                currentIndex: _stepperIndex,
                steps: const [
                  AsnStep(title: 'Redactar', subtitle: 'Texto'),
                  AsnStep(title: 'Revisar', subtitle: 'Edicion'),
                  AsnStep(title: 'Publicar', subtitle: 'Salida'),
                ],
              ),
              const SizedBox(height: AsnSpacing.x4),
              Row(
                children: [
                  AsnButton(
                    size: AsnButtonSize.sm,
                    variant: AsnButtonVariant.outline,
                    onPressed: _stepperIndex > 0
                        ? () => setState(() => _stepperIndex--)
                        : null,
                    child: const Text('Atras'),
                  ),
                  const SizedBox(width: AsnSpacing.x2),
                  AsnButton(
                    size: AsnButtonSize.sm,
                    onPressed: _stepperIndex < 2
                        ? () => setState(() => _stepperIndex++)
                        : null,
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnSteps',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsnSteps(
                currentIndex: _stepsIndex,
                steps: const [
                  AsnStep(title: 'Crear cuenta', subtitle: 'Datos basicos'),
                  AsnStep(title: 'Confirmar email', subtitle: 'Verificacion'),
                  AsnStep(title: 'Listo', subtitle: 'Acceso completo'),
                ],
              ),
              Row(
                children: [
                  AsnButton(
                    size: AsnButtonSize.sm,
                    variant: AsnButtonVariant.outline,
                    onPressed: _stepsIndex > 0
                        ? () => setState(() => _stepsIndex--)
                        : null,
                    child: const Text('Atras'),
                  ),
                  const SizedBox(width: AsnSpacing.x2),
                  AsnButton(
                    size: AsnButtonSize.sm,
                    onPressed: _stepsIndex < 2
                        ? () => setState(() => _stepsIndex++)
                        : null,
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const DemoBlock(
          title: 'AsnTimeline',
          child: AsnTimeline(
            entries: [
              AsnTimelineEntry(
                title: 'Borrador creado',
                time: '09:14',
                child: Text('Primer esbozo del articulo.'),
              ),
              AsnTimelineEntry(
                title: 'Enviado a revision',
                time: '11:30',
              ),
              AsnTimelineEntry(
                title: 'Aprobado',
                time: '15:02',
                child: Text('Listo para maquetacion.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnTree',
          child: AsnTree(
            roots: _tree,
            expandedIds: _expandedIds,
            onToggle: _toggle,
          ),
        ),
        DemoBlock(
          title: 'AsnNavigationMenu',
          child: AsnNavigationMenu(
            items: [
              for (var i = 0; i < _navLabels.length; i++)
                AsnNavItem(
                  label: _navLabels[i],
                  selected: i == _navIndex,
                  onTap: () => setState(() => _navIndex = i),
                ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnCommand',
          child: SizedBox(
            height: 240,
            child: AsnCommand(
              placeholder: 'Buscar comando...',
              items: [
                AsnCommandItem(
                  label: 'Nuevo articulo',
                  keywords: const ['crear', 'post'],
                  onSelected: () {},
                ),
                AsnCommandItem(
                  label: 'Buscar archivo',
                  keywords: const ['abrir', 'file'],
                  onSelected: () {},
                ),
                AsnCommandItem(
                  label: 'Ajustes',
                  keywords: const ['config', 'preferencias'],
                  onSelected: () {},
                ),
              ],
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnCarousel',
          child: AsnCarousel(
            height: 160,
            items: [
              _card(colors, 'Edicion 1'),
              _card(colors, 'Edicion 2'),
              _card(colors, 'Edicion 3'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnDataTable',
          child: AsnDataTable(
            columns: [
              AsnDataColumn(label: 'Titulo', onSort: () {}),
              AsnDataColumn(label: 'Autor', onSort: () {}),
              const AsnDataColumn(label: 'Estado'),
            ],
            rows: const [
              [Text('El paro silencioso'), Text('A. Soler'), Text('Publicado')],
              [Text('Cronica de barrio'), Text('M. Rivas'), Text('Borrador')],
              [Text('Final de copa'), Text('J. Pena'), Text('Revision')],
            ],
          ),
        ),
        DemoBlock(
          title: 'AsnDrawer',
          child: Row(
            children: [
              AsnButton(
                variant: AsnButtonVariant.outline,
                onPressed: () => AsnDrawer.show<void>(
                  context,
                  side: AsnDrawerSide.left,
                  child: const Text('Navegacion del cajon izquierdo.'),
                ),
                child: const Text('Drawer izquierda'),
              ),
              const SizedBox(width: AsnSpacing.x3),
              AsnButton(
                variant: AsnButtonVariant.outline,
                onPressed: () => AsnDrawer.show<void>(
                  context,
                  side: AsnDrawerSide.right,
                  child: const Text('Detalles en el cajon derecho.'),
                ),
                child: const Text('Drawer derecha'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _panel(AsnSemanticColors colors, String label) {
    return Container(
      alignment: Alignment.center,
      color: colors.bgSubtle,
      child: Text(label, style: TextStyle(color: colors.textSecondary)),
    );
  }

  Widget _card(AsnSemanticColors colors, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AsnSpacing.x1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.bgSubtle,
        borderRadius: AsnRadius.brMd,
        border: Border.all(color: colors.borderDefault),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: AsnTextTheme.fontFamily,
          fontSize: AsnFontSize.xl2,
          fontWeight: AsnFontWeight.semibold,
          color: colors.textPrimary,
        ),
      ),
    );
  }
}
