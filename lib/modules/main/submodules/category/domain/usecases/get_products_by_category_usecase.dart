import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';

abstract class GetProductsByCategoryUseCase {
  Future<Either<Failure, List<Product>>> call(String category);
}
