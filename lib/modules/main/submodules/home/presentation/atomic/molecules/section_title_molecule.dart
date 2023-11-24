import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_colors.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';

class SectionTitleMolecule extends StatelessWidget {
  const SectionTitleMolecule({
    super.key,
    required this.title,
    this.onSeeMoreTap,
    this.showSeeMore = true,
    this.titleTextStyle = AppTextStyle.subtitleBold,
  });

  final String title;
  final VoidCallback? onSeeMoreTap;
  final bool showSeeMore;

  final TextStyle titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeeMoreTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Text(
              title,
              style: titleTextStyle,
            ),
            const Spacer(),
            Visibility(
              visible: showSeeMore,
              child: Text(
                'Ver mais',
                style: AppTextStyle.subtitleRegular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
