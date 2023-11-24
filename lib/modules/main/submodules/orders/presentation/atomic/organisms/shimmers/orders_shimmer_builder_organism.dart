import 'package:flutter/material.dart';

import '../../molecules/shimmers/order_shimmer_molecule.dart';

class OrdersShimmerBuilderOrganism extends StatelessWidget {
  const OrdersShimmerBuilderOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20.0,
      ),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: OrderShimmerMolecule(),
        );
      },
    );
  }
}
