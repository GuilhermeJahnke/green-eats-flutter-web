import 'package:flutter/material.dart';

import '../../../utils/mixins/interable_mixin.dart';
import '../atoms/card_background_atom.dart';
import '../atoms/page_visibility_atom.dart';
import '../atoms/positioned.atom.dart';

class CardContentMolecule extends StatelessWidget {
  const CardContentMolecule({
    super.key,
    required this.onCardTap,
    required this.pageVisibility,
    required this.children,
    required this.imagePath,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.backgroundImageDecoration,
    this.contentBackgroundDecoration,
  });

  final String imagePath;
  final VoidCallback onCardTap;
  final PageVisibility pageVisibility;
  final List<Widget> children;

  final BoxDecoration? backgroundImageDecoration;
  final BoxDecoration? contentBackgroundDecoration;

  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Colors.transparent,
        child: ImageBackgroundAtom(
          imagePath: imagePath,
          pageVisibility: pageVisibility,
          child: Container(
            decoration: backgroundImageDecoration ??
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Color.fromARGB(223, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                  ),
                ),
            child: InkWell(
              onTap: onCardTap,
              child: Stack(
                children: <Widget>[
                  DecoratedBox(
                    decoration: contentBackgroundDecoration ??
                        const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              Color(0x00000000),
                              Color(0xFF000000),
                            ],
                          ),
                        ),
                  ),
                  PositionedAtom(
                    pageVisibility: pageVisibility,
                    widgets: children.transformEffectChildren(
                      pageVisibility: pageVisibility,
                    ),
                    mainAxisSize: mainAxisSize,
                    mainAxisAlignment: mainAxisAlignment,
                    crossAxisAlignment: crossAxisAlignment,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
