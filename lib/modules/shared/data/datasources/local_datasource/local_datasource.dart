import '../../../domain/entities/user.dart';

abstract class LocalDatasource {
  Future<void> setCookie(String cookie);
  Future<String?> getCookie();

  Future<void> updateHiveUser(User user);
  Future<User?> getCurrentHiveUser();
  Future<void> clearHiveUser();
}
