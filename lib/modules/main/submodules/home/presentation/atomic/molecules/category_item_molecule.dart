import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';
import '../../../../../../shared/utils/utils.dart';

class CategoryItemMolecule extends StatelessWidget {
  const CategoryItemMolecule({
    super.key,
    required this.onCardTap,
    required this.imagePath,
    required this.title,
  });

  final VoidCallback onCardTap;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: InkWell(
        onTap: onCardTap,
        child: SizedBox(
          width: context.isMobile ? 80 : 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.isMobile ? 80 : 150,
                width: context.isMobile ? 80 : 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Utils.autoDetectImage(
                    imagePath,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
