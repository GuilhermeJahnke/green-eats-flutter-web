import '../../../../../shared/domain/entities/product.dart';

abstract class CategoryRemoteDatasource {
  Future<List<Product>> getProductsByCategory(String categoryId);
}
