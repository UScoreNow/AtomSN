import 'package:atomsn/atomsn.dart';
import 'package:flutter/widgets.dart';

import '../widgets/demo_block.dart';

/// Demo screen for AtomSN's TEMPLATE components.
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
              title: const Text('Dashboard'),
              actions: [
                AsnButton(
                  variant: AsnButtonVariant.outline,
                  size: AsnButtonSize.sm,
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedRefresh,
                    size: 16,
                  ),
                  onPressed: () {},
                  child: const Text('Refresh'),
                ),
                AsnButton(
                  size: AsnButtonSize.sm,
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedAdd01,
                    size: 16,
                  ),
                  onPressed: () {},
                  child: const Text('New'),
                ),
              ],
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AsnCard(
                    title: const Text('Summary'),
                    description: const Text('Activity over the last 7 days'),
                    child: const Text(
                      'The metrics are up to date and within expectations.',
                    ),
                  ),
                  const SizedBox(height: AsnSpacing.x3),
                  AsnButton(
                    onPressed: () {},
                    child: const Text('View details'),
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
                      child: const Text('Home'),
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
                      child: const Text('Reports'),
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
                      child: const Text('Settings'),
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
                      title: const Text('Revenue'),
                      description: const Text('Current month'),
                      child: const Text('24.580 EUR'),
                    ),
                    const SizedBox(height: AsnSpacing.x3),
                    AsnCard(
                      title: const Text('Customers'),
                      description: const Text('New this month'),
                      child: const Text('128 sign-ups'),
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
              title: const Text('Sign in'),
              footer: const Text("Don't have an account? Sign up"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AsnInput(
                    placeholder: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AsnSpacing.x3),
                  const AsnInput(
                    placeholder: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: AsnSpacing.x5),
                  AsnButton(
                    onPressed: () {},
                    child: const Text('Enter'),
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

/// Fixed-height frame that wraps a template as a preview.
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
