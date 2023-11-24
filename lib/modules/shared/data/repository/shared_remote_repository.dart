import 'package:dartz/dartz.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/errors/failures/failure.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../datasources/remote_datasource/remote_datasource.dart';

class SharedRemoteRepository
    implements GetCategoriesUsecase, GetProductsUsecase {
  const SharedRemoteRepository({
    required this.remoteDatasource,
  });

  final SharedRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await remoteDatasource.getCategories();

      return Right(categories);
    } catch (error) {
      return Left(
        Failure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDatasource.getProducts();

      return Right(products);
    } catch (error) {
      return Left(
        Failure(
          exception: error,
        ),
      );
    }
  }
}
