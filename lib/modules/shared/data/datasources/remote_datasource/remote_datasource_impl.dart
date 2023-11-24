// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import '../../../configs/data/network/app_network.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';
import '../../dio/logged_dio.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import 'remote_datasource.dart';

class SharedRemoteDatasourceImpl implements SharedRemoteDatasource {
  SharedRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<List<Category>> getCategories() async {
    final response = await loggedDio.get(
      appNetwork.getCategories,
    );

    final List<Category> categories = [];

    for (var i = 0; i < response.data.length; i++) {
      final category = CategoryModel.fromJson(response.data[i]);

      categories.add(category);
    }

    return categories;
  }

  @override
  Future<List<Product>> getProducts() async {
    final response = await loggedDio.get(
      appNetwork.getProducts,
    );

    final List<Product> products = [];

    for (var i = 0; i < response.data.length; i++) {
      final product = ProductModel.fromJson(response.data[i]);

      products.add(product);
    }

    return products;
  }
}
