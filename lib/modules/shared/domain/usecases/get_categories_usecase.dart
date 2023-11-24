import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../errors/failures/failure.dart';

abstract class GetCategoriesUsecase {
  Future<Either<Failure, List<Category>>> getCategories();
}
