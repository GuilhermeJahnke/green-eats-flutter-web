import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../../../utils/mixins/interable_mixin.dart';
import '../../../utils/utils.dart';
import '../molecules/empty_data_molecule.dart';
import '../molecules/product_card_molecule.dart';

class ProductCardBuilderOrganism extends StatelessWidget {
  const ProductCardBuilderOrganism({
    super.key,
    required this.productList,
    required this.onCardTap,
    required this.onAddTap,
  });

  final List<Product> productList;
  final ValueSetter<Product> onCardTap;
  final ValueSetter<Product> onAddTap;

  List<Widget> _buildTermGroups(List<Product> termsList) {
    final groupedTerms = Utils.groupElements<Product>(termsList, groupSize: 2);

    final termGroups = groupedTerms
        .map(
          (group) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...group.map(
                (product) {
                  return Flexible(
                    child: ProductCardMolecule(
                      title: product.title,
                      imagePath: product.imagePath,
                      price: product.price,
                      onCardTap: () => onCardTap(product),
                      onAddTap: () => onAddTap(product),
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
    if (productList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: EmptyDataMolecule.product(),
      );
    }

    final termGroups = _buildTermGroups(productList);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: termGroups.addSeparators(const SizedBox(height: 16)),
    );
  }
}
