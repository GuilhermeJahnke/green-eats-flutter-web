import 'package:flutter/material.dart';

import '../../../configs/constants/app_colors.dart';
import '../../../configs/constants/app_text_style.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/utils.dart';
import '../atoms/action_button_atom.dart';

class ProductCardMolecule extends StatelessWidget {
  const ProductCardMolecule({
    super.key,
    required this.onCardTap,
    required this.onAddTap,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  final VoidCallback onCardTap;
  final VoidCallback onAddTap;
  final String imagePath;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (context.isMobile)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Utils.autoDetectImage(imagePath),
              )
            else
              Flexible(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Utils.autoDetectImage(imagePath),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: AppTextStyle.subtitleRegular,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  Text(
                    Utils.formatCurrency(price),
                    style: AppTextStyle.subtitleBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  ActionButtonAtom.add(
                    onAddTap: onAddTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
