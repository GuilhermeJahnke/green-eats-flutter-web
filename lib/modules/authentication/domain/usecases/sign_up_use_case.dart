import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/user.dart';
import '../../../shared/domain/errors/failures/failure.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, User>> signUp({
    required String name,
    required String lastName,
    required String document,
    required String email,
    required String password,
  });
}
