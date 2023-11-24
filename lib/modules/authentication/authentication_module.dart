import 'package:flutter_modular/flutter_modular.dart';

import 'authentication_navigator.dart';
import 'data/datasources/remote/authentication_remote_datasource_impl.dart';
import 'data/repositories/authentication_repository.dart';
import 'presentation/cubits/check_your_email_cubit.dart';
import 'presentation/cubits/create_new_password_cubit.dart';
import 'presentation/cubits/forgot_password_cubit.dart';
import 'presentation/cubits/login_cubit.dart';
import 'presentation/cubits/register_cubit.dart';
import 'presentation/pages/check_your_email_page.dart';
import 'presentation/pages/create_new_password_page.dart';
import 'presentation/pages/forgot_password_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/register_page.dart';

class AuthenticationModule extends Module {
  static const moduleName = '/authentication';

  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind(
          (i) => AuthenticationRemoteDatasourceImpl(
            notLoggedDio: i(),
            appNetwork: i(),
          ),
        ),

        // Repositories
        Bind(
          (i) => AuthenticationRepository(
            authenticationRemoteDatasource: i(),
          ),
        ),

        // Navigator
        Bind((i) => AuthenticationNavigator()),

        // Cubits
        Bind(
          (i) => LoginCubit(
            navigator: i(),
            sharedNavigator: i(),
            signInUseCase: i(),
            updateUserUsecase: i(),
          ),
        ),
        Bind(
          (i) => RegisterCubit(
            sharedNavigator: i(),
            signUpUseCase: i(),
            updateUserUsecase: i(),
          ),
        ),
        Bind((i) => ForgotPasswordCubit(navigator: i())),
        Bind((i) => CheckYourEmailCubit(navigator: i())),
        Bind((i) => CreateNewPasswordCubit(navigator: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const LoginPage(),
        ),
        ChildRoute(
          RegisterPage.routeName,
          child: (_, __) => const RegisterPage(),
        ),
        ChildRoute(
          ForgotPasswordPage.routeName,
          child: (_, __) => const ForgotPasswordPage(),
        ),
        ChildRoute(
          CheckYourEmailPage.routeName,
          child: (_, __) => const CheckYourEmailPage(),
        ),
        ChildRoute(
          CreateNewPasswordPage.routeName,
          child: (_, __) => const CreateNewPasswordPage(),
        ),
      ];
}
