import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_colors.dart';
import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/presentation/atomic/atoms/arrow_back_atom.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/item_quantity_manager_molecule.dart';
import '../../../../shared/utils/extensions/context_extension.dart';
import '../../../../shared/utils/mixins/context_mixin.dart';
import '../../../../shared/utils/utils.dart';
import '../organisms/characteristics_builder_organism.dart';

class ProductDetailPageTemplate extends StatelessWidget {
  const ProductDetailPageTemplate({
    super.key,
    required this.product,
    required this.onAddQuantityTap,
    required this.onRemoveQuantityTap,
    required this.onAddCartTap,
  });

  final Product product;

  final VoidCallback onAddQuantityTap;
  final VoidCallback onRemoveQuantityTap;

  final VoidCallback onAddCartTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (context.isMobile)
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20.0),
                      ),
                      child: Utils.autoDetectImage(
                        product.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ArrowBackAtom(),
                  ),
                ],
              ),
              // else
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Padding(
              //         padding: EdgeInsets.all(20.0),
              //         child: ArrowBackAtom(),
              //       ),
              //       Center(
              //         child: SizedBox(
              //           width: double.infinity,
              //           height: 500,
              //           child: Utils.autoDetectImage(
              //             product.imagePath,
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              const SizedBox(height: 20.0),
              Center(
                child: SizedBox(
                  width: context.isMobile ? null : 900,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.title,
                                style: AppTextStyle.titleBold,
                              ),
                            ),
                            ItemQuantityManagerMolecule(
                              onAddTap: onAddQuantityTap,
                              onRemoveTap: onRemoveQuantityTap,
                              quantity: product.quantity,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Utils.formatCurrency(product.price),
                              style: AppTextStyle.titleBold.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              Utils.formatWeight(product.weight),
                              style: AppTextStyle.titleBold.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          product.description,
                          style: AppTextStyle.subtitleRegular.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CharacteristicsCardBuilderOrganism(
                          characteristicList: product.characteristics,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ButtonMolecule(
                          type: Buttontype.filled,
                          title: 'Adicionar no carrinho',
                          onTap: () {
                            onAddCartTap();

                            context.showSuccessAddCartSnackBar();
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
