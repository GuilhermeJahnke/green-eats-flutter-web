import 'package:flutter/material.dart';

import 'page_visibility_atom.dart';
import 'transform_effect_atom.dart';

class PositionedAtom extends StatelessWidget {
  const PositionedAtom({
    super.key,
    required this.pageVisibility,
    required this.widgets,
    this.top = 16.0,
    this.bottom = 16.0,
    this.left = 16.0,
    this.right = 16.0,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final PageVisibility pageVisibility;

  final List<TransformEffectAtom> widgets;

  final double top;
  final double bottom;
  final double left;
  final double right;

  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: widgets,
      ),
    );
  }
}
