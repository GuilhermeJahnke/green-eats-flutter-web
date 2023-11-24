import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_colors.dart';
import '../../../../../../shared/domain/entities/user.dart';
import '../../../../../../shared/utils/utils.dart';

class PickUserMolecule extends StatelessWidget {
  const PickUserMolecule({
    super.key,
    required this.user,
    required this.onPickImageTap,
  });

  final User user;
  final VoidCallback onPickImageTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Utils.autoDetectImage(
              user.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onPickImageTap,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
