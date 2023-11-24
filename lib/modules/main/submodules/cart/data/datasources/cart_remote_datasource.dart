import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/user.dart';

abstract class CartRemoteDatasource {
  Future<void> sendOrder({
    required User user,
    required List<Product> products,
  });
}
