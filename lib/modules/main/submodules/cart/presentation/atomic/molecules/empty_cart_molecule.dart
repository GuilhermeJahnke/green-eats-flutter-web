import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_assets.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';

class EmptyCartMolecule extends StatelessWidget {
  const EmptyCartMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.emptyCart),
          const SizedBox(height: 20.0),
          const Text(
            'Seu carrinho está vazio',
            style: AppTextStyle.titleBold,
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Parece que você ainda não escolheu seus produtos',
            style: AppTextStyle.subtitleRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
