import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/check_your_email_page.dart';
import 'presentation/pages/create_new_password_page.dart';
import 'presentation/pages/forgot_password_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/register_page.dart';

class AuthenticationNavigator {
  void openRegisterPage() {
    Modular.to.pushNamed(
      RegisterPage.routePath,
    );
  }

  void openForgotPasswordPage() {
    Modular.to.pushNamed(
      ForgotPasswordPage.routePath,
    );
  }

  void openCheckYourEmailPage() {
    Modular.to.pushNamed(
      CheckYourEmailPage.routePath,
    );
  }

  void openNewPasswordPage() {
    Modular.to.pushNamed(
      CreateNewPasswordPage.routePath,
    );
  }

  void popToLoginPage() {
    Modular.to.popUntil(
      (route) => route.settings.name == LoginPage.routePath,
    );
  }
}
