import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/order.dart';
import '../molecules/order_molecule.dart';

class OrdersBuilderOrganism extends StatelessWidget {
  const OrdersBuilderOrganism({
    super.key,
    required this.orders,
  });

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20.0,
      ),
      itemBuilder: (context, index) {
        final order = orders[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: OrderMolecule(
            photoUrl: order.establishmentImage,
            orderNumber: order.id,
            totalValue: order.price,
            quantity: order.quantity,
            date: order.date,
            status: order.status,
          ),
        );
      },
    );
  }
}
