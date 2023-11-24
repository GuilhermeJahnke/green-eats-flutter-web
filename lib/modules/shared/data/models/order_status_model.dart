import '../../domain/entities/order.dart';

class OrderStatusModel {
  const OrderStatusModel._();

  static OrderStatus fromJson(String status) {
    switch (status) {
      case 'pending':
        return OrderStatus.pending;
      case 'inProgress':
        return OrderStatus.inProgress;
      case 'rejected':
        return OrderStatus.rejected;
      case 'delivered':
        return OrderStatus.delivered;
      default:
        throw Exception('Invalid status');
    }
  }
}
