import 'package:flutter/material.dart';

import '../../molecules/shimmers/category_item_shimmer_molecule.dart';

class CategoryBuilderShimmerOrganism extends StatelessWidget {
  const CategoryBuilderShimmerOrganism();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return const CategoryItemShimmerMolecule();
        },
      ),
    );
  }
}
