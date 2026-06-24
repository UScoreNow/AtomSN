import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla de demostracion de los componentes TEMPLATE de atomic_ui.
class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AxPageScaffold',
          child: _Frame(
            child: AxPageScaffold(
              title: const Text('Panel de control'),
              actions: [
                AxButton(
                  variant: AxButtonVariant.outline,
                  size: AxButtonSize.sm,
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedRefresh,
                    size: 16,
                  ),
                  onPressed: () {},
                  child: const Text('Refrescar'),
                ),
                AxButton(
                  size: AxButtonSize.sm,
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedAdd01,
                    size: 16,
                  ),
                  onPressed: () {},
                  child: const Text('Nuevo'),
                ),
              ],
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AxCard(
                    title: const Text('Resumen'),
                    description: const Text('Actividad de los ultimos 7 dias'),
                    child: const Text(
                      'Las metricas estan al dia y dentro de lo esperado.',
                    ),
                  ),
                  const SizedBox(height: AxSpacing.x3),
                  AxButton(
                    onPressed: () {},
                    child: const Text('Ver detalles'),
                  ),
                ],
              ),
            ),
          ),
        ),
        DemoBlock(
          title: 'AxDashboardLayout',
          child: _Frame(
            child: AxDashboardLayout(
              sidebarWidth: 180,
              breakpoint: 0,
              sidebar: Padding(
                padding: const EdgeInsets.all(AxSpacing.x3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AxButton(
                      variant: AxButtonVariant.ghost,
                      size: AxButtonSize.sm,
                      leading: const HugeIcon(
                        icon: HugeIcons.strokeRoundedDashboardSquare01,
                        size: 16,
                      ),
                      onPressed: () {},
                      child: const Text('Inicio'),
                    ),
                    const SizedBox(height: AxSpacing.x2),
                    AxButton(
                      variant: AxButtonVariant.ghost,
                      size: AxButtonSize.sm,
                      leading: const HugeIcon(
                        icon: HugeIcons.strokeRoundedChartLineData02,
                        size: 16,
                      ),
                      onPressed: () {},
                      child: const Text('Informes'),
                    ),
                    const SizedBox(height: AxSpacing.x2),
                    AxButton(
                      variant: AxButtonVariant.ghost,
                      size: AxButtonSize.sm,
                      leading: const HugeIcon(
                        icon: HugeIcons.strokeRoundedSettings01,
                        size: 16,
                      ),
                      onPressed: () {},
                      child: const Text('Ajustes'),
                    ),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.all(AxSpacing.x4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AxCard(
                      title: const Text('Ingresos'),
                      description: const Text('Mes en curso'),
                      child: const Text('24.580 EUR'),
                    ),
                    const SizedBox(height: AxSpacing.x3),
                    AxCard(
                      title: const Text('Clientes'),
                      description: const Text('Nuevos este mes'),
                      child: const Text('128 altas'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        DemoBlock(
          title: 'AxAuthLayout',
          child: _Frame(
            child: AxAuthLayout(
              title: const Text('Iniciar sesion'),
              footer: const Text('No tienes cuenta? Registrate'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AxInput(
                    placeholder: 'Correo electronico',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AxSpacing.x3),
                  const AxInput(
                    placeholder: 'Contrasena',
                    obscureText: true,
                  ),
                  const SizedBox(height: AxSpacing.x5),
                  AxButton(
                    onPressed: () {},
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Marco de altura fija que enmarca una plantilla como vista previa.
class _Frame extends StatelessWidget {
  const _Frame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AxTheme.of(context);
    return SizedBox(
      height: 360,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: AxRadius.brMd,
          border: Border.all(color: colors.borderDefault),
        ),
        child: child,
      ),
    );
  }
}
