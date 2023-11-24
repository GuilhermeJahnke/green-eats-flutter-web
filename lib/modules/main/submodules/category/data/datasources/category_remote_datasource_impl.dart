// ignore_for_file: unnecessary_lambdas

import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/data/models/product_model.dart';
import '../../../../../shared/domain/entities/product.dart';
import 'category_remote_datasource.dart';

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  const CategoryRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final response = await loggedDio.get(
      appNetwork.getProducts,
      queryParameters: {
        'category': categoryId,
      },
    );

    final products = (response.data as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return products;
  }
}
