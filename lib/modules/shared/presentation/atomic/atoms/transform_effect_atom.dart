import 'package:flutter/material.dart';

import 'page_visibility_atom.dart';

class TransformEffectAtom extends StatelessWidget {
  const TransformEffectAtom({
    super.key,
    required this.child,
    required this.pageVisibility,
    required this.translationFactor,
  });

  final Widget child;
  final double translationFactor;
  final PageVisibility pageVisibility;

  @override
  Widget build(BuildContext context) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }
}
