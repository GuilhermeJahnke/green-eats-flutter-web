import 'package:flutter/material.dart';

import '../../../configs/constants/app_text_style.dart';
import '../../../domain/entities/product.dart';
import '../../../utils/extensions/context_extension.dart';
import '../atoms/page_visibility_atom.dart';
import '../molecules/card_content_molecule.dart';
import '../molecules/empty_data_molecule.dart';

class DiscountProductsOrganism extends StatelessWidget {
  const DiscountProductsOrganism({
    super.key,
    required this.itemsList,
    required this.onCardTap,
  });

  final ValueSetter<Product> onCardTap;
  final List<Product> itemsList;

  @override
  Widget build(BuildContext context) {
    if (itemsList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: EmptyDataMolecule.discountProduct(),
      );
    }

    return SizedBox.fromSize(
      size: context.isMobile
          ? const Size.fromHeight(160)
          : const Size.fromHeight(300),
      child: PageTransformer(
        pageViewBuilder: (context, visibilityResolver) {
          return PageView.builder(
            controller: PageController(viewportFraction: 0.90),
            itemCount: 1,
            itemBuilder: (context, index) {
              final Product item = itemsList[index];

              final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);
              return CardContentMolecule(
                imagePath: item.imagePath,
                onCardTap: () => onCardTap(item),
                pageVisibility: pageVisibility,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      item.title,
                      style: AppTextStyle.subtitleRegular.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Descontos imperdiveis de até ${item.discount}%',
                      style: AppTextStyle.titleRegular.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
