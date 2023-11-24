import 'package:flutter/material.dart';

import 'product.dart';

class CartManager extends ChangeNotifier {
  CartManager._();

  static final CartManager instance = CartManager._();

  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    if (isProductInCart(product)) {
      _updateExistingProductQuantity(product);
      notifyListeners();
      return;
    }

    _products.add(product);

    notifyListeners();
  }

  bool isProductInCart(Product product) {
    return _products.where((element) => element.id == product.id).isNotEmpty;
  }

  Future<void> _updateExistingProductQuantity(Product product) async {
    final index = _products.indexWhere((element) => element.id == product.id);
    final productFinded = _products[index];

    if (index == -1) throw Exception('Product not found');

    _products[index] = productFinded.copyWith(
      quantity: productFinded.quantity + product.quantity,
    );

    return;
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void onRemoveQuantityTap(Product product) {
    final index = _products.indexWhere((element) => element.id == product.id);

    if (index == -1) throw Exception('Product not found');

    if (product.quantity == 1) {
      removeProduct(product);
      return;
    }

    _products[index] = product.copyWith(quantity: product.quantity - 1);
    notifyListeners();
  }

  void onAddQuantityTap(Product product) {
    final index = _products.indexWhere((element) => element.id == product.id);

    if (index == -1) throw Exception('Product not found');

    _products[index] = product.copyWith(quantity: product.quantity + 1);
    notifyListeners();
  }

  void removeAllProducts() {
    _products.clear();
    notifyListeners();
  }
}
