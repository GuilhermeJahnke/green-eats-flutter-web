import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/product.dart';
import '../../../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';
import '../molecules/empty_cart_molecule.dart';
import '../organisms/cart_builder_item_organism.dart';

class CartPageTemplate extends StatelessWidget {
  const CartPageTemplate({
    super.key,
    required this.products,
    required this.onAddQuantityTap,
    required this.onRemoveQuantityTap,
    required this.onConfirmTap,
    required this.isLoading,
  });

  final List<Product> products;

  final ValueSetter<Product> onAddQuantityTap;
  final ValueSetter<Product> onRemoveQuantityTap;

  final VoidCallback onConfirmTap;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text(
                      'Carrinho',
                      style: AppTextStyle.titleBold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40.0),
                    if (products.isEmpty)
                      const EmptyCartMolecule()
                    else ...[
                      if (context.isMobile)
                        CartBuilderItemOrganism(
                          products: products,
                          onAddQuantityTap: onAddQuantityTap,
                          onRemoveQuantityTap: onRemoveQuantityTap,
                        )
                      else
                        Center(
                          child: SizedBox(
                            width: 500,
                            child: CartBuilderItemOrganism(
                              products: products,
                              onAddQuantityTap: onAddQuantityTap,
                              onRemoveQuantityTap: onRemoveQuantityTap,
                            ),
                          ),
                        ),
                      const SizedBox(height: 90.0),
                    ],
                  ],
                ),
              ),
            ),
          ),
          if (products.isNotEmpty) ...[
            if (context.isMobile)
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    color: const Color(0x00ffffff),
                    child: ButtonMolecule(
                      type: Buttontype.filled,
                      title: 'Confirmar',
                      onTap: onConfirmTap,
                      isLoading: isLoading,
                    ),
                  ),
                ),
              )
            else
              Center(
                child: SizedBox(
                  width: 500,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Colors.transparent),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        color: const Color(0x00ffffff),
                        child: ButtonMolecule(
                          type: Buttontype.filled,
                          title: 'Confirmar',
                          onTap: onConfirmTap,
                          isLoading: isLoading,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ]
        ],
      ),
    );
  }
}
