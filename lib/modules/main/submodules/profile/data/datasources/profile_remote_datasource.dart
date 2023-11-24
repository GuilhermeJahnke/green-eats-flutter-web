import '../../../../../shared/domain/entities/user.dart';

abstract class ProfileRemoteDatasource {
  Future<User> updateUser({
    required String userId,
    String? name,
    String? email,
  });
}
