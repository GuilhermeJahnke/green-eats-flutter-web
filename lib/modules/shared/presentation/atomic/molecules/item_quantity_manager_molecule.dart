import 'package:flutter/material.dart';

import '../../../configs/constants/app_text_style.dart';
import '../atoms/action_button_atom.dart';

class ItemQuantityManagerMolecule extends StatelessWidget {
  const ItemQuantityManagerMolecule({
    super.key,
    required this.onRemoveTap,
    required this.onAddTap,
    required this.quantity,
  });

  final VoidCallback onRemoveTap;
  final VoidCallback onAddTap;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButtonAtom.remove(onRemoveTap: onRemoveTap),
        const SizedBox(width: 10.0),
        Text(
          quantity.toString(),
          style: AppTextStyle.subtitleBold,
        ),
        const SizedBox(width: 10.0),
        ActionButtonAtom.add(
          onAddTap: onAddTap,
        ),
      ],
    );
  }
}
