import '../../domain/entities/user.dart';
import '../../domain/usecases/clear_user_usecase.dart';
import '../../domain/usecases/get_cookie_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/set_cookie_usecase.dart';
import '../../domain/usecases/update_hive_user_usecase.dart';
import '../datasources/local_datasource/local_datasource.dart';

class SharedLocalRepository
    implements
        GetCookieUsecase,
        SetCookieUsecase,
        UpdateHiveUserUsecase,
        GetCurrentUserUsecase,
        ClearUserUsecase {
  const SharedLocalRepository({
    required this.localDatasource,
  });

  final LocalDatasource localDatasource;

  @override
  Future<String?> getCookie() async {
    final cookie = await localDatasource.getCookie();

    return cookie;
  }

  @override
  Future<void> setCookie(String cookie) async {
    await localDatasource.setCookie(cookie);

    return;
  }

  @override
  Future<void> clearUser() async {
    await localDatasource.clearHiveUser();
    return;
  }

  @override
  Future<User?> getCurrentUser() async {
    final user = await localDatasource.getCurrentHiveUser();

    return user;
  }

  @override
  Future<void> updateUser(User user) async {
    await localDatasource.updateHiveUser(user);

    return;
  }
}
