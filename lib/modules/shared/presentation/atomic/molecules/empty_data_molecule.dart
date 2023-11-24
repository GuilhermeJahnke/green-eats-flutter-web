import 'package:flutter/material.dart';

import '../../../configs/constants/app_text_style.dart';

class EmptyDataMolecule extends StatelessWidget {
  const EmptyDataMolecule({
    super.key,
    required this.icon,
    required this.text,
  });

  const EmptyDataMolecule.category()
      : icon = Icons.category_outlined,
        text = 'Nenhuma categoria encontrada';

  const EmptyDataMolecule.product()
      : icon = Icons.shopping_bag_outlined,
        text = 'Nenhum produto encontrado';

  const EmptyDataMolecule.discountProduct()
      : icon = Icons.local_offer_outlined,
        text = 'Nenhum produto em promoção';

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
            Text(
              text,
              style: AppTextStyle.subtitleRegular,
            ),
          ],
        ),
      ),
    );
  }
}
