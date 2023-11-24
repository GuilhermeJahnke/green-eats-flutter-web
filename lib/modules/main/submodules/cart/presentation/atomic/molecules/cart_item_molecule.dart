import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_colors.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/product.dart';
import '../../../../../../shared/presentation/atomic/molecules/item_quantity_manager_molecule.dart';
import '../../../../../../shared/utils/utils.dart';

class CartItemMolecule extends StatelessWidget {
  const CartItemMolecule({
    super.key,
    required this.product,
    required this.onRemoveQuantityTap,
    required this.onAddQuantityTap,
  });

  final Product product;

  final ValueSetter<Product> onRemoveQuantityTap;
  final ValueSetter<Product> onAddQuantityTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Utils.autoDetectImage(
              product.imagePath,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: AppTextStyle.subtitleBold,
              ),
              const SizedBox(height: 10.0),
              Text(
                Utils.formatWeight(
                  product.weight,
                ),
                style: AppTextStyle.bodyBold,
              ),
              const SizedBox(height: 10.0),
              Text(
                Utils.formatCurrency(
                  product.price,
                ),
                style: AppTextStyle.subtitleBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        ItemQuantityManagerMolecule(
          onRemoveTap: () => onRemoveQuantityTap(product),
          onAddTap: () => onAddQuantityTap(product),
          quantity: product.quantity,
        ),
      ],
    );
  }
}
