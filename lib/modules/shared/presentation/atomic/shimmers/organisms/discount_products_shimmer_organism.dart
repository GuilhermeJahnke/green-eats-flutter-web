import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../atoms/page_visibility_atom.dart';

class DiscountProductsShimmerOrganism extends StatelessWidget {
  const DiscountProductsShimmerOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(160),
      child: PageTransformer(
        pageViewBuilder: (context, visibilityResolver) {
          return PageView.builder(
            controller: PageController(viewportFraction: 0.90),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: const Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.grey,
                    child: SizedBox.expand(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
