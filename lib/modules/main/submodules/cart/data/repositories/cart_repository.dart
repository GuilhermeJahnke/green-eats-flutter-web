import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';

import '../../domain/usecases/send_order_usecase.dart';
import '../datasources/cart_remote_datasource.dart';

class CartRepository implements SendOrderUsecase {
  CartRepository({
    required this.remoteDatasource,
  });

  final CartRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, void>> call({
    required User user,
    required List<Product> products,
  }) async {
    try {
      await remoteDatasource.sendOrder(
        user: user,
        products: products,
      );

      return const Right(null);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
