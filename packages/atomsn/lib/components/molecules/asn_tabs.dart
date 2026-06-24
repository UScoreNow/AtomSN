import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Pestana de un [AsnTabs]. Modelo propio (no filtra tipos `Shad*`).
@immutable
class AsnTabItem<T> {
  const AsnTabItem({
    required this.value,
    required this.label,
    required this.content,
  });

  final T value;
  final Widget label;
  final Widget content;
}

/// Conjunto de pestanas controlado. Envuelve `ShadTabs`.
class AsnTabs<T> extends StatelessWidget {
  const AsnTabs({
    super.key,
    required this.value,
    required this.tabs,
    this.onChanged,
  });

  final T value;
  final List<AsnTabItem<T>> tabs;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ShadTabs<T>(
      value: value,
      onChanged: onChanged,
      tabs: tabs
          .map(
            (tab) => ShadTab<T>(
              value: tab.value,
              content: tab.content,
              child: tab.label,
            ),
          )
          .toList(),
    );
  }
}
