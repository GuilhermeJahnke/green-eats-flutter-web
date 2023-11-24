import '../entities/user.dart';

abstract class UpdateHiveUserUsecase {
  Future<void> updateUser(User user);
}
