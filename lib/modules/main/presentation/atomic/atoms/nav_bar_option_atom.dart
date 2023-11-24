import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/configs/constants/app_colors.dart';
import '../../../../shared/configs/constants/app_text_style.dart';

class NavBarOptionAtom extends StatelessWidget {
  const NavBarOptionAtom({
    super.key,
    required this.isSelected,
    required this.showBadge,
    required this.onTap,
    required this.svgPath,
    this.count = 0,
  });

  final bool isSelected;
  final bool showBadge;
  final VoidCallback onTap;
  final String svgPath;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Badge.count(
          alignment: Alignment.bottomRight,
          isLabelVisible: count > 0 && showBadge,
          count: count,
          offset: const Offset(0, 0),
          textStyle: AppTextStyle.captionRegular,
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                svgPath,
                color: isSelected ? Colors.white : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
