import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/category.dart';
import '../../../../../../shared/presentation/atomic/molecules/empty_data_molecule.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';
import '../molecules/category_item_molecule.dart';

class CategoryBuilderOrganism extends StatelessWidget {
  const CategoryBuilderOrganism({
    super.key,
    required this.categoryList,
    required this.onCardTap,
  });

  final List<Category> categoryList;
  final ValueSetter<Category> onCardTap;

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: EmptyDataMolecule.category(),
      );
    }

    return SizedBox(
      height: context.isMobile ? 140 : 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return CategoryItemMolecule(
            imagePath: category.imagePath,
            title: category.title,
            onCardTap: () => onCardTap(category),
          );
        },
      ),
    );
  }
}
