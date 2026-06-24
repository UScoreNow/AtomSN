import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Panel flotante anclado a un [child]. Envuelve `ShadPopover`.
///
/// Controlado: la visibilidad la dicta [visible] y los cambios (incluido el
/// cierre por tap fuera) se reportan via [onVisibleChanged]. Se gestiona un
/// `ShadPopoverController` interno para mantener la API controlada.
class AsnPopover extends StatefulWidget {
  const AsnPopover({
    super.key,
    required this.child,
    required this.popover,
    this.visible = false,
    this.onVisibleChanged,
  });

  final Widget child;
  final Widget popover;
  final bool visible;
  final ValueChanged<bool>? onVisibleChanged;

  @override
  State<AsnPopover> createState() => _AsnPopoverState();
}

class _AsnPopoverState extends State<AsnPopover> {
  late final ShadPopoverController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ShadPopoverController(isOpen: widget.visible);
    _controller.addListener(_handleControllerChanged);
  }

  @override
  void didUpdateWidget(AsnPopover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != _controller.isOpen) {
      widget.visible ? _controller.show() : _controller.hide();
    }
  }

  void _handleControllerChanged() {
    if (_controller.isOpen != widget.visible) {
      widget.onVisibleChanged?.call(_controller.isOpen);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadPopover(
      controller: _controller,
      popover: (context) => widget.popover,
      child: widget.child,
    );
  }
}
