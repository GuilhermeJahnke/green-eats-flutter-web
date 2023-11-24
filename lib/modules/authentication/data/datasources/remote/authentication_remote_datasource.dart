import '../../../../shared/domain/entities/user.dart';

abstract class AuthenticationRemoteDatasource {
  Future<User> signIn({
    required String email,
    required String password,
  });
  Future<User> signUp({
    required String name,
    required String lastName,
    required String document,
    required String email,
    required String password,
  });
}
