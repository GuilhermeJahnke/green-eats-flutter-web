import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/product.dart';
import '../molecules/cart_item_molecule.dart';

class CartBuilderItemOrganism extends StatelessWidget {
  const CartBuilderItemOrganism({
    super.key,
    required this.products,
    required this.onAddQuantityTap,
    required this.onRemoveQuantityTap,
  });

  final List<Product> products;

  final ValueSetter<Product> onAddQuantityTap;
  final ValueSetter<Product> onRemoveQuantityTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Divider(color: Colors.black.withOpacity(0.3)),
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return CartItemMolecule(
          product: product,
          onAddQuantityTap: onAddQuantityTap,
          onRemoveQuantityTap: onRemoveQuantityTap,
        );
      },
    );
  }
}
