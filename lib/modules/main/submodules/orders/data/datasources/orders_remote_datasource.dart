import '../../../../../shared/domain/entities/order.dart';

abstract class OrdersRemoteDatasource {
  Future<List<Order>> getOrders();
}
