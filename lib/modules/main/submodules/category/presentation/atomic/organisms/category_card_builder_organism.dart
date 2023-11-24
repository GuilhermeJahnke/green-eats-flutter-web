import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/category.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';
import '../../../../../../shared/utils/mixins/interable_mixin.dart';
import '../../../../../../shared/utils/utils.dart';

import '../molecules/category_card_molecule.dart';

class CategoryCardBuilderOrganism extends StatelessWidget {
  const CategoryCardBuilderOrganism({
    super.key,
    required this.categoryList,
    required this.onCategoryTap,
  });

  final List<Category> categoryList;
  final ValueSetter<Category> onCategoryTap;

  List<Widget> _buildTermGroups(
    List<Category> termsList,
    BuildContext context,
  ) {
    final groupedTerms = Utils.groupElements<Category>(
      termsList,
      groupSize: 2,
    );

    final termGroups = groupedTerms
        .map(
          (group) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...group.map(
                (category) {
                  return Flexible(
                    child: CategoryCardMolecule(
                      imagePath: category.imagePath,
                      title: category.title,
                      onCardTap: () => onCategoryTap(category),
                    ),
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
    final termGroups = _buildTermGroups(categoryList, context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: termGroups.addSeparators(const SizedBox(height: 16)),
    );
  }
}
