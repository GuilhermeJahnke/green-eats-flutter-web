import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/user.dart';
import '../../../shared/domain/errors/failures/failure.dart';

abstract class SignInUseCase {
  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  });
}
