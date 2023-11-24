import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'page_visibility_atom.dart';

class ImageBackgroundAtom extends StatelessWidget {
  const ImageBackgroundAtom({
    super.key,
    required this.imagePath,
    required this.pageVisibility,
    required this.child,
  });

  final String imagePath;
  final PageVisibility pageVisibility;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        image: DecorationImage(
          image: Utils.autoDetectImageProvider(imagePath),
          fit: BoxFit.cover,
          alignment: FractionalOffset(
            0.5 + (pageVisibility.pagePosition / 3),
            0.5,
          ),
        ),
      ),
      child: child,
    );
  }
}
