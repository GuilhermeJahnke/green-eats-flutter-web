import '../entities/user.dart';

abstract class GetCurrentUserUsecase {
  Future<User?> getCurrentUser();
}
