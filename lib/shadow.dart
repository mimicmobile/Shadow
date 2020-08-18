library shadow;

import 'package:flutter/material.dart';

class Shadow extends StatelessWidget {
  final double opacity;
  final double scale;
  final Widget child;
  final Offset offset;
  final Color color;

  Shadow({
    this.opacity,
    this.color,
    @required this.child,
    this.scale,
    this.offset,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset ?? Offset(5, 5),
          child: Transform.scale(
            scale: scale ?? 1,
            child: Opacity(opacity: opacity ?? 0.5, child: changeColor(child)),
          ),
        ),
        child,
      ],
    );
  }

  Widget changeColor(Widget child) {
    if (color != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.saturation,
        ),
        child: child,
      );
    }
    return child;
  }
}
