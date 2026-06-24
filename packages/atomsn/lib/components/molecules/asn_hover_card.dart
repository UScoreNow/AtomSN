import 'package:flutter/widgets.dart';

import '../../foundations/radius/asn_radius.dart';
import '../../foundations/spacing/asn_spacing.dart';
import '../../theme/asn_theme.dart';

/// Card that appears when hovering over [child]. Own widget.
///
/// Uses [MouseRegion] + [OverlayEntry]. The visibility state is UI-only
/// (hover), not business logic.
class AsnHoverCard extends StatefulWidget {
  const AsnHoverCard({
    super.key,
    required this.child,
    required this.card,
    this.cardWidth = 280,
  });

  final Widget child;
  final Widget card;
  final double cardWidth;

  @override
  State<AsnHoverCard> createState() => _AsnHoverCardState();
}

class _AsnHoverCardState extends State<AsnHoverCard> {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;

  void _show() {
    if (_entry != null) return;
    final colors = AsnTheme.of(context);
    _entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: widget.cardWidth,
          child: CompositedTransformFollower(
            link: _link,
            showWhenUnlinked: false,
            offset: const Offset(0, AsnSpacing.x2),
            targetAnchor: Alignment.bottomLeft,
            child: MouseRegion(
              onEnter: (_) => _show(),
              onExit: (_) => _hide(),
              child: Container(
                padding: const EdgeInsets.all(AsnSpacing.x4),
                decoration: BoxDecoration(
                  color: colors.bgRaised,
                  borderRadius: AsnRadius.brMd,
                  border: Border.all(color: colors.borderDefault),
                ),
                child: widget.card,
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_entry!);
  }

  void _hide() {
    _entry?.remove();
    _entry = null;
  }

  @override
  void dispose() {
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: MouseRegion(
        onEnter: (_) => _show(),
        onExit: (_) => _hide(),
        child: widget.child,
      ),
    );
  }
}
