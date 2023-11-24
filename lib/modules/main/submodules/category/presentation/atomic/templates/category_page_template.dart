import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/category.dart';
import '../../../../home/presentation/atomic/molecules/section_title_molecule.dart';
import '../../../../home/presentation/atomic/molecules/shimmers/section_title_shimmer_molecule.dart';
import '../molecules/empty_categories_molecule.dart';
import '../organisms/category_card_builder_organism.dart';
import '../organisms/shimmers/category_card_shimmer_builder_organism.dart';

class CategoryPageTemplate extends StatelessWidget {
  const CategoryPageTemplate({
    super.key,
    required this.categoryList,
    required this.onCategoryTap,
    required this.isLoading,
  });

  final ValueSetter<Category> onCategoryTap;
  final List<Category> categoryList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                if (isLoading)
                  const SectionTitleShimmerMolecule()
                else
                  const SectionTitleMolecule(
                    title: 'Categorias',
                    showSeeMore: false,
                    titleTextStyle: AppTextStyle.titleBold,
                  ),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CategoryCardShimmerBuilderOrganism(),
                  ),
                if (categoryList.isEmpty)
                  const EmptyCategoriesMolecule()
                else
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CategoryCardBuilderOrganism(
                      categoryList: categoryList,
                      onCategoryTap: onCategoryTap,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
