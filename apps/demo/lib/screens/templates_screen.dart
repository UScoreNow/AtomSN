import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Pantalla de demostracion de los componentes TEMPLATE de AtomSN.
class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      blocks: [
        DemoBlock(
          title: 'AsnPageScaffold',
          child: _Frame(
            child: AsnPageScaffold(
              title: const Text('Panel de control'),
              actions: [
                AsnButton(
                  variant: AsnButtonVariant.outline,
                  size: AsnButtonSize.sm,
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedRefresh,
                    size: 16,
                  ),
                  onPressed: () {},
                  child: const Text('Refrescar'),
                ),
                AsnButton(
                  size: AsnButtonSize.sm,
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
                  AsnCard(
                    title: const Text('Resumen'),
                    description: const Text('Actividad de los ultimos 7 dias'),
                    child: const Text(
                      'Las metricas estan al dia y dentro de lo esperado.',
                    ),
                  ),
                  const SizedBox(height: AsnSpacing.x3),
                  AsnButton(
                    onPressed: () {},
                    child: const Text('Ver detalles'),
                  ),
                ],
              ),
            ),
          ),
        ),
        DemoBlock(
          title: 'AsnDashboardLayout',
          child: _Frame(
            child: AsnDashboardLayout(
              sidebarWidth: 180,
              breakpoint: 0,
              sidebar: Padding(
                padding: const EdgeInsets.all(AsnSpacing.x3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AsnButton(
                      variant: AsnButtonVariant.ghost,
                      size: AsnButtonSize.sm,
                      leading: const HugeIcon(
                        icon: HugeIcons.strokeRoundedDashboardSquare01,
                        size: 16,
                      ),
                      onPressed: () {},
                      child: const Text('Inicio'),
                    ),
                    const SizedBox(height: AsnSpacing.x2),
                    AsnButton(
                      variant: AsnButtonVariant.ghost,
                      size: AsnButtonSize.sm,
                      leading: const HugeIcon(
                        icon: HugeIcons.strokeRoundedChartLineData02,
                        size: 16,
                      ),
                      onPressed: () {},
                      child: const Text('Informes'),
                    ),
                    const SizedBox(height: AsnSpacing.x2),
                    AsnButton(
                      variant: AsnButtonVariant.ghost,
                      size: AsnButtonSize.sm,
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
                padding: const EdgeInsets.all(AsnSpacing.x4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AsnCard(
                      title: const Text('Ingresos'),
                      description: const Text('Mes en curso'),
                      child: const Text('24.580 EUR'),
                    ),
                    const SizedBox(height: AsnSpacing.x3),
                    AsnCard(
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
          title: 'AsnAuthLayout',
          child: _Frame(
            child: AsnAuthLayout(
              title: const Text('Iniciar sesion'),
              footer: const Text('No tienes cuenta? Registrate'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AsnInput(
                    placeholder: 'Correo electronico',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AsnSpacing.x3),
                  const AsnInput(
                    placeholder: 'Contrasena',
                    obscureText: true,
                  ),
                  const SizedBox(height: AsnSpacing.x5),
                  AsnButton(
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
    final colors = AsnTheme.of(context);
    return SizedBox(
      height: 360,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: AsnRadius.brMd,
          border: Border.all(color: colors.borderDefault),
        ),
        child: child,
      ),
    );
  }
}
