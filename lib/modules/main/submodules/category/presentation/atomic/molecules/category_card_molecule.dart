import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/utils/extensions/context_extension.dart';
import '../../../../../../shared/utils/utils.dart';

class CategoryCardMolecule extends StatelessWidget {
  const CategoryCardMolecule({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onCardTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback onCardTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Utils.autoDetectImageProvider(imagePath),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: AppTextStyle.titleRegular.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
