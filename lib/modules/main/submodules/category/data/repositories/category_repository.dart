import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import '../datasources/category_remote_datasource.dart';

class CategoryRepository implements GetProductsByCategoryUseCase {
  const CategoryRepository({
    required this.categoryRemoteDatasource,
  });

  final CategoryRemoteDatasource categoryRemoteDatasource;

  @override
  Future<Either<Failure, List<Product>>> call(String category) async {
    try {
      final products =
          await categoryRemoteDatasource.getProductsByCategory(category);

      return Right(products);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
