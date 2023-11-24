import 'package:flutter_modular/flutter_modular.dart';

import '../authentication/authentication_module.dart';
import '../main/main_module.dart';
import '../splash/splash_module.dart';
import 'configs/data/network/app_network.dart';
import 'configs/env/environment.dart';
import 'data/datasources/local_datasource/local_datasource_impl.dart';
import 'data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'data/dio/logged_dio.dart';
import 'data/dio/not_logged_dio.dart';
import 'data/repository/shared_local_repository.dart';
import 'data/repository/shared_remote_repository.dart';
import 'mocks/mock_manager.dart';
import 'shared_navigator.dart';

class AppModule extends Module {
  AppModule(this.environment);

  final Environment environment;

  static const routePath = '';

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => environment),
        Bind(
          (i) => AppNetwork(environment: environment),
        ),
        Bind(
          (i) => MockManager(),
        ),
        Bind(
          (i) => LocalDatasourceImpl(),
        ),
        Bind(
          (i) => SharedLocalRepository(
            localDatasource: i(),
          ),
        ),
        Bind(
          (i) => LoggedDio(
            environment: i(),
            getCookieUsecase: i(),
            setCookieUsecase: i(),
          ),
        ),
        Bind(
          (i) => NotLoggedDio(
            environment: i(),
            setCookieUsecase: i(),
          ),
        ),
        Bind(
          (i) => SharedRemoteDatasourceImpl(
            loggedDio: i(),
            appNetwork: i(),
          ),
        ),
        Bind(
          (i) => SharedRemoteRepository(
            remoteDatasource: i(),
          ),
        ),
        Bind(
          (i) => SharedNavigator(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          AuthenticationModule.moduleName,
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          MainModule.routeName,
          module: MainModule(),
        ),
      ];
}
