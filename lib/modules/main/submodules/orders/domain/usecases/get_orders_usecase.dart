import 'package:dartz/dartz.dart' as dz;

import '../../../../../shared/domain/entities/order.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';

abstract class GetOrdersUsecase {
  Future<dz.Either<Failure, List<Order>>> call();
}
