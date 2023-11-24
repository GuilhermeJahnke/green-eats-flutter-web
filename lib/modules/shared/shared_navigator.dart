import 'package:flutter_modular/flutter_modular.dart';

import '../authentication/authentication_module.dart';
import '../main/main_module.dart';

class SharedNavigator {
  void openAuthenticationModule() {
    Modular.to.navigate(
      AuthenticationModule.moduleName,
    );
  }

  void openMainModule() {
    Modular.to.navigate(MainModule.routePath);
  }
}
