import 'package:flutter/material.dart';

import '../../../../../shared/domain/entities/order.dart';

extension OrderStatusExtension on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.rejected:
        return Colors.red;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.inProgress:
        return Colors.blue;
    }
  }

  String get text {
    switch (this) {
      case OrderStatus.pending:
        return 'Pendente';
      case OrderStatus.rejected:
        return 'Rejeitado';
      case OrderStatus.delivered:
        return 'Entregue';
      case OrderStatus.inProgress:
        return 'Preparando';
    }
  }
}
