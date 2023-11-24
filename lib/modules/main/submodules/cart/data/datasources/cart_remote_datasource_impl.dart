import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/user.dart';
import 'cart_remote_datasource.dart';

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  CartRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<void> sendOrder({
    required User user,
    required List<Product> products,
  }) async {
    final List<Map<String, dynamic>> productsJson = products
        .map(
          (product) => {
            'id': product.id,
            'quantity': product.quantity,
          },
        )
        .toList();

    await loggedDio.post(
      appNetwork.sendOrder,
      data: {
        'user': user.id,
        'products': productsJson,
      },
    );

    return;
  }
}
