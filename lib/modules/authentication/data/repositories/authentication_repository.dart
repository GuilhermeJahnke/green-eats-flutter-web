import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/user.dart';
import '../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../datasources/remote/authentication_remote_datasource.dart';

class AuthenticationRepository implements SignInUseCase, SignUpUseCase {
  AuthenticationRepository({
    required this.authenticationRemoteDatasource,
  });

  final AuthenticationRemoteDatasource authenticationRemoteDatasource;

  @override
  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authenticationRemoteDatasource.signIn(
        email: email,
        password: password,
      );

      return Right(user);
    } catch (error) {
      return Left(
        Failure(exception: error),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String lastName,
    required String document,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authenticationRemoteDatasource.signUp(
        name: name,
        lastName: lastName,
        document: document,
        email: email,
        password: password,
      );

      return Right(user);
    } catch (error) {
      return Left(
        Failure(exception: error),
      );
    }
  }
}
