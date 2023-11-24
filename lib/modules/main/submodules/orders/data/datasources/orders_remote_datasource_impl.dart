// ignore_for_file: unnecessary_lambdas

import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/data/models/order_model.dart';
import '../../../../../shared/domain/entities/order.dart';
import 'orders_remote_datasource.dart';

class OrdersRemoteDatasourceImpl implements OrdersRemoteDatasource {
  const OrdersRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<List<Order>> getOrders() async {
    final response = await loggedDio.get(appNetwork.getAllOrders);

    final orders = (response.data as List)
        .map((order) => OrderModel.fromJson(order))
        .toList();

    return orders;
  }
}
