import 'package:flutter/material.dart';

import '../../../configs/constants/app_colors.dart';

class ActionButtonAtom extends StatelessWidget {
  const ActionButtonAtom({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  const ActionButtonAtom.remove({
    super.key,
    required VoidCallback onRemoveTap,
  })  : backgroundColor = const Color(0xFFE5E5E5),
        icon = Icons.remove,
        iconColor = Colors.black,
        onTap = onRemoveTap;

  const ActionButtonAtom.add({
    super.key,
    required VoidCallback onAddTap,
  })  : backgroundColor = AppColors.primaryColor,
        icon = Icons.add,
        iconColor = Colors.white,
        onTap = onAddTap;

  final Color backgroundColor;
  final Color? iconColor;

  final IconData icon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
