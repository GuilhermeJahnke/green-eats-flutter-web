import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/onboarding_page.dart';

class SplashNavigator {
  void openOnboardingPage() {
    Modular.to.navigate(OnboardingPage.routeName);
  }
}
