import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/cubits/onboarding_cubit.dart';
import 'presentation/cubits/splash_cubit.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/splash_page.dart';
import 'splash_navigator.dart';

class SplashModule extends Module {
  static const moduleName = '/splash';

  @override
  List<Bind<Object>> get binds => [
        // Navigator
        Bind(
          (i) => SplashNavigator(),
        ),

        // Cubits
        Bind(
          (i) => SplashCubit(splashNavigator: i()),
        ),

        Bind(
          (i) => OnboardingCubit(sharedNavigator: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const SplashPage(),
        ),
        ChildRoute(
          OnboardingPage.routeName,
          child: (_, __) => const OnboardingPage(),
        ),
      ];
}
