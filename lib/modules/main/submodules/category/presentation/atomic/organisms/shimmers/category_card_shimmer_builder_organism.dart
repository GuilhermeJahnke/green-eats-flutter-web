import 'package:flutter/material.dart';

import '../../../../../../../shared/utils/mixins/interable_mixin.dart';
import '../../../../../../../shared/utils/utils.dart';
import '../../molecules/shimmers/category_card_shimmer_molecule.dart';

class CategoryCardShimmerBuilderOrganism extends StatelessWidget {
  const CategoryCardShimmerBuilderOrganism();

  List<Widget> _buildTermGroups() {
    final groupedTerms =
        Utils.groupElements(List.generate(10, (index) => index), groupSize: 2);

    final termGroups = groupedTerms
        .map(
          (group) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...group.map(
                (category) {
                  return const Flexible(
                    child: CategoryCardShimmerMolecule(),
                  );
                },
              ),
              if (group.length.isOdd) const Spacer(),
            ]..insert(1, const SizedBox(width: 16)),
          ),
        )
        .toList();

    return termGroups;
  }

  @override
  Widget build(BuildContext context) {
    final termGroups = _buildTermGroups();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: termGroups.addSeparators(const SizedBox(height: 16)),
    );
  }
}
