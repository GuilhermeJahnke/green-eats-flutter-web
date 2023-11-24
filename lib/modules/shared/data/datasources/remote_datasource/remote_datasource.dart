import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';

abstract class SharedRemoteDatasource {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProducts();
}
