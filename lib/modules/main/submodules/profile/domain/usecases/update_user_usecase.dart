import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';

abstract class UpdateUserUsecase {
  Future<Either<Failure, User>> updateUser({
    required String userId,
    String? name,
    String? email,
  });
}
