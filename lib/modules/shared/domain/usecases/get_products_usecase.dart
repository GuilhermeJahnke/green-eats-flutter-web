import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../errors/failures/failure.dart';

abstract class GetProductsUsecase {
  Future<Either<Failure, List<Product>>> getProducts();
}
