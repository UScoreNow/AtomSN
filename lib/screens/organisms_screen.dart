import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla que muestra todos los organismos del paquete atomic_ui.
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
    AxTreeNode(
      id: 'src',
      label: 'lib',
      children: [
        AxTreeNode(
          id: 'components',
          label: 'components',
          children: [
            AxTreeNode(id: 'atoms', label: 'atoms'),
            AxTreeNode(id: 'molecules', label: 'molecules'),
            AxTreeNode(id: 'organisms', label: 'organisms'),
          ],
        ),
        AxTreeNode(id: 'main', label: 'main.dart'),
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
    final colors = AxTheme.of(context);

    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AxDialog',
          child: Row(
            children: [
              AxButton(
                onPressed: () => AxDialog.show<void>(
                  context,
                  title: const Text('Publicar edicion'),
                  description: const Text(
                    'La edicion se enviara a impresion de inmediato.',
                  ),
                  actions: [
                    AxButton(
                      variant: AxButtonVariant.ghost,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    AxButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Publicar'),
                    ),
                  ],
                ),
                child: const Text('Abrir dialogo'),
              ),
              const SizedBox(width: AxSpacing.x3),
              AxButton(
                variant: AxButtonVariant.destructive,
                onPressed: () => AxDialog.showAlert<void>(
                  context,
                  title: const Text('Borrar borrador'),
                  description: const Text('Esta accion no se puede deshacer.'),
                  actions: [
                    AxButton(
                      variant: AxButtonVariant.ghost,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    AxButton(
                      variant: AxButtonVariant.destructive,
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
          title: 'AxSheet',
          child: Row(
            children: [
              AxButton(
                variant: AxButtonVariant.outline,
                onPressed: () => AxSheet.show<void>(
                  context,
                  side: AxSheetSide.right,
                  title: const Text('Filtros'),
                  description: const Text('Ajusta la lista de articulos.'),
                  child: const Text('Contenido del panel lateral.'),
                ),
                child: const Text('Sheet derecha'),
              ),
              const SizedBox(width: AxSpacing.x3),
              AxButton(
                variant: AxButtonVariant.outline,
                onPressed: () => AxSheet.show<void>(
                  context,
                  side: AxSheetSide.bottom,
                  title: const Text('Acciones'),
                  child: const Text('Panel anclado abajo.'),
                ),
                child: const Text('Sheet abajo'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxContextMenu',
          child: AxContextMenu(
            items: [
              AxMenuItem(label: 'Copiar', onTap: () {}),
              AxMenuItem(label: 'Pegar', onTap: () {}),
              const AxMenuItem(label: 'Eliminar', enabled: false),
            ],
            child: Container(
              padding: const EdgeInsets.all(AxSpacing.x4),
              decoration: BoxDecoration(
                color: colors.bgSubtle,
                borderRadius: AxRadius.brMd,
                border: Border.all(color: colors.borderDefault),
              ),
              child: const Text(
                'Click derecho o pulsacion larga aqui',
              ),
            ),
          ),
        ),
        DemoBlock(
          title: 'AxMenubar',
          child: AxMenubar(
            menus: [
              AxMenu(
                label: 'Archivo',
                items: [
                  AxMenuItem(label: 'Nuevo', onTap: () {}),
                  AxMenuItem(label: 'Abrir', onTap: () {}),
                  AxMenuItem(label: 'Guardar', onTap: () {}),
                ],
              ),
              AxMenu(
                label: 'Editar',
                items: [
                  AxMenuItem(label: 'Deshacer', onTap: () {}),
                  AxMenuItem(label: 'Rehacer', onTap: () {}),
                ],
              ),
              AxMenu(
                label: 'Ver',
                items: [
                  AxMenuItem(label: 'Zoom +', onTap: () {}),
                  AxMenuItem(label: 'Zoom -', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxTable',
          child: AxTable(
            columns: const [
              AxTableColumn(header: Text('Seccion')),
              AxTableColumn(header: Text('Editor')),
              AxTableColumn(header: Text('Notas')),
            ],
            rows: const [
              [Text('Portada'), Text('A. Soler'), Text('12')],
              [Text('Cultura'), Text('M. Rivas'), Text('8')],
              [Text('Deportes'), Text('J. Pena'), Text('15')],
            ],
          ),
        ),
        DemoBlock(
          title: 'AxCalendar',
          child: SizedBox(
            height: 360,
            child: AxCalendar(
              selected: _selectedDate,
              onChanged: (date) => setState(() => _selectedDate = date),
            ),
          ),
        ),
        DemoBlock(
          title: 'AxResizable',
          child: SizedBox(
            height: 160,
            child: AxResizable(
              axis: AxResizableAxis.horizontal,
              panels: [
                _panel(colors, 'Indice'),
                _panel(colors, 'Documento'),
              ],
            ),
          ),
        ),
        DemoBlock(
          title: 'AxToast',
          child: Row(
            children: [
              AxButton(
                onPressed: () => AxToast.show(
                  context,
                  title: const Text('Guardado'),
                  description: const Text('El borrador se guardo.'),
                ),
                child: const Text('Toast'),
              ),
              const SizedBox(width: AxSpacing.x3),
              AxButton(
                variant: AxButtonVariant.destructive,
                onPressed: () => AxToast.show(
                  context,
                  title: const Text('Error'),
                  description: const Text('No se pudo conectar.'),
                  variant: AxToastVariant.destructive,
                ),
                child: const Text('Toast error'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxStepper',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxStepper(
                currentIndex: _stepperIndex,
                steps: const [
                  AxStep(title: 'Redactar', subtitle: 'Texto'),
                  AxStep(title: 'Revisar', subtitle: 'Edicion'),
                  AxStep(title: 'Publicar', subtitle: 'Salida'),
                ],
              ),
              const SizedBox(height: AxSpacing.x4),
              Row(
                children: [
                  AxButton(
                    size: AxButtonSize.sm,
                    variant: AxButtonVariant.outline,
                    onPressed: _stepperIndex > 0
                        ? () => setState(() => _stepperIndex--)
                        : null,
                    child: const Text('Atras'),
                  ),
                  const SizedBox(width: AxSpacing.x2),
                  AxButton(
                    size: AxButtonSize.sm,
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
          title: 'AxSteps',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AxSteps(
                currentIndex: _stepsIndex,
                steps: const [
                  AxStep(title: 'Crear cuenta', subtitle: 'Datos basicos'),
                  AxStep(title: 'Confirmar email', subtitle: 'Verificacion'),
                  AxStep(title: 'Listo', subtitle: 'Acceso completo'),
                ],
              ),
              Row(
                children: [
                  AxButton(
                    size: AxButtonSize.sm,
                    variant: AxButtonVariant.outline,
                    onPressed: _stepsIndex > 0
                        ? () => setState(() => _stepsIndex--)
                        : null,
                    child: const Text('Atras'),
                  ),
                  const SizedBox(width: AxSpacing.x2),
                  AxButton(
                    size: AxButtonSize.sm,
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
          title: 'AxTimeline',
          child: AxTimeline(
            entries: [
              AxTimelineEntry(
                title: 'Borrador creado',
                time: '09:14',
                child: Text('Primer esbozo del articulo.'),
              ),
              AxTimelineEntry(
                title: 'Enviado a revision',
                time: '11:30',
              ),
              AxTimelineEntry(
                title: 'Aprobado',
                time: '15:02',
                child: Text('Listo para maquetacion.'),
              ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxTree',
          child: AxTree(
            roots: _tree,
            expandedIds: _expandedIds,
            onToggle: _toggle,
          ),
        ),
        DemoBlock(
          title: 'AxNavigationMenu',
          child: AxNavigationMenu(
            items: [
              for (var i = 0; i < _navLabels.length; i++)
                AxNavItem(
                  label: _navLabels[i],
                  selected: i == _navIndex,
                  onTap: () => setState(() => _navIndex = i),
                ),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxCommand',
          child: SizedBox(
            height: 240,
            child: AxCommand(
              placeholder: 'Buscar comando...',
              items: [
                AxCommandItem(
                  label: 'Nuevo articulo',
                  keywords: const ['crear', 'post'],
                  onSelected: () {},
                ),
                AxCommandItem(
                  label: 'Buscar archivo',
                  keywords: const ['abrir', 'file'],
                  onSelected: () {},
                ),
                AxCommandItem(
                  label: 'Ajustes',
                  keywords: const ['config', 'preferencias'],
                  onSelected: () {},
                ),
              ],
            ),
          ),
        ),
        DemoBlock(
          title: 'AxCarousel',
          child: AxCarousel(
            height: 160,
            items: [
              _card(colors, 'Edicion 1'),
              _card(colors, 'Edicion 2'),
              _card(colors, 'Edicion 3'),
            ],
          ),
        ),
        DemoBlock(
          title: 'AxDataTable',
          child: AxDataTable(
            columns: [
              AxDataColumn(label: 'Titulo', onSort: () {}),
              AxDataColumn(label: 'Autor', onSort: () {}),
              const AxDataColumn(label: 'Estado'),
            ],
            rows: const [
              [Text('El paro silencioso'), Text('A. Soler'), Text('Publicado')],
              [Text('Cronica de barrio'), Text('M. Rivas'), Text('Borrador')],
              [Text('Final de copa'), Text('J. Pena'), Text('Revision')],
            ],
          ),
        ),
        DemoBlock(
          title: 'AxDrawer',
          child: Row(
            children: [
              AxButton(
                variant: AxButtonVariant.outline,
                onPressed: () => AxDrawer.show<void>(
                  context,
                  side: AxDrawerSide.left,
                  child: const Text('Navegacion del cajon izquierdo.'),
                ),
                child: const Text('Drawer izquierda'),
              ),
              const SizedBox(width: AxSpacing.x3),
              AxButton(
                variant: AxButtonVariant.outline,
                onPressed: () => AxDrawer.show<void>(
                  context,
                  side: AxDrawerSide.right,
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

  Widget _panel(AxSemanticColors colors, String label) {
    return Container(
      alignment: Alignment.center,
      color: colors.bgSubtle,
      child: Text(label, style: TextStyle(color: colors.textSecondary)),
    );
  }

  Widget _card(AxSemanticColors colors, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AxSpacing.x1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.bgSubtle,
        borderRadius: AxRadius.brMd,
        border: Border.all(color: colors.borderDefault),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: AxTextTheme.serifFamily,
          fontSize: AxFontSize.xl2,
          color: colors.textPrimary,
        ),
      ),
    );
  }
}
