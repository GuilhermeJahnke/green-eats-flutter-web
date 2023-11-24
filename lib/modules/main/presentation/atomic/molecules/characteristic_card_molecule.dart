import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_colors.dart';
import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/domain/entities/characteristics.dart';
import '../../../../shared/utils/utils.dart';

class CharacteristicCardMolecule extends StatelessWidget {
  const CharacteristicCardMolecule({
    super.key,
    required this.characteristic,
  });

  final Characteristic characteristic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Utils.autoDetectImage(
                characteristic.imagePath,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characteristic.name,
                    style: AppTextStyle.subtitleRegular.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    characteristic.description,
                    style: AppTextStyle.bodyBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
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
