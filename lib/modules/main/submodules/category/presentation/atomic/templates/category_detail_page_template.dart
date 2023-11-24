import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/category.dart';
import '../../../../../../shared/domain/entities/product.dart';
import '../../../../../../shared/presentation/atomic/atoms/arrow_back_atom.dart';
import '../../../../../../shared/presentation/atomic/molecules/product_card_molecule.dart';
import '../../../../../../shared/presentation/atomic/organisms/product_card_builder_organism.dart';
import '../../../../../../shared/presentation/atomic/shimmers/organisms/product_card_builder_shimmer_organism.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';

class CategoryDetailPageTemplate extends StatelessWidget {
  const CategoryDetailPageTemplate({
    super.key,
    required this.category,
    required this.productList,
    required this.onCardTap,
    required this.onAddTap,
    required this.isLoading,
  });

  final Category? category;
  final List<Product> productList;
  final ValueSetter<Product> onCardTap;
  final ValueSetter<Product> onAddTap;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ArrowBackAtom(),
                      Expanded(
                        child: Text(
                          category?.title ?? '',
                          style: AppTextStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  if (isLoading)
                    const ProductCardShimmerBuilderOrganism()
                  else ...[
                    if (context.isMobile)
                      ProductCardBuilderOrganism(
                        productList: productList,
                        onCardTap: onCardTap,
                        onAddTap: onAddTap,
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return ProductCardMolecule(
                            title: product.title,
                            imagePath: product.imagePath,
                            price: product.price,
                            onCardTap: () => onCardTap(product),
                            onAddTap: () => onAddTap(product),
                          );
                        },
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
