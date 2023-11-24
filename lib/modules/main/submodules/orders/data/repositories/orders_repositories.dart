import 'package:dartz/dartz.dart' as dz;

import '../../../../../shared/domain/entities/order.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import '../datasources/orders_remote_datasource.dart';

class OrdersRepositories implements GetOrdersUsecase {
  const OrdersRepositories({
    required this.ordersRemoteDatasource,
  });

  final OrdersRemoteDatasource ordersRemoteDatasource;

  @override
  Future<dz.Either<Failure, List<Order>>> call() async {
    try {
      final orders = await ordersRemoteDatasource.getOrders();

      return dz.Right(orders);
    } catch (error) {
      return dz.Left(Failure(exception: error));
    }
  }
}
