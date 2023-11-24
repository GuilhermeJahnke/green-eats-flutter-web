class AuthenticationStrings {
  const AuthenticationStrings._();

  static const _LoginPageStrings loginPage = _LoginPageStrings();
  static const _RegisterPageStrings registerPage = _RegisterPageStrings();
  static const _ForgotPasswordPageStrings forgotPasswordPage =
      _ForgotPasswordPageStrings();
  static const _CheckYourEmailPageStrings checkYourEmailPage =
      _CheckYourEmailPageStrings();

  static const _CreateNewPasswordPageStrings createNewPasswordPage =
      _CreateNewPasswordPageStrings();
}

class _LoginPageStrings {
  const _LoginPageStrings();

  final String loginWithYourAccount = 'Entre com sua conta';
  final String emailOrCpf = 'E-mail ou CPF';
  final String password = 'Senha';
  final String forgotYourPassword = 'Esqueceu sua senha?';
  final String login = 'Entrar';
  final String dontHaveAnAccount = 'Não tem uma conta? ';
  final String signUp = 'Cadastre-se';
}

class _RegisterPageStrings {
  const _RegisterPageStrings();

  final String createYourAccountForFree = 'Crie sua conta gratuitamente';
  final String name = 'Nome';
  final String lastName = 'Sobrenome';
  final String cpf = 'CPF';
  final String email = 'E-mail';
  final String password = 'Senha';
  final String confirmPassword = 'Confirme sua senha';
  final String signUp = 'Cadastrar-se';
  final String termsAndConditions =
      'Ao clicar em cadastrar-se, você concorda com os ';
  final String termsAndConditionsLink = 'Termos e Condições de Uso';
}

class _ForgotPasswordPageStrings {
  const _ForgotPasswordPageStrings();

  final String forgotYourPassword = 'Esqueci minha senha';
  final String subtitle =
      'Digite o e-mail associado na sua conta e nós te enviaremos as intruções para alterar sua senha.';
  final String email = 'E-mail';
  final String send = 'Enviar';
}

class _CheckYourEmailPageStrings {
  const _CheckYourEmailPageStrings();

  final String checkYourEmail = 'Verifique seu e-mail';
  final String subtitle =
      'Enviamos um link para o seu e-mail, verifique sua caixa de entrada e siga as instruções para recuperar sua senha.';
  final String alreadyChecked = 'Já verifiquei';
  final String didntReceive =
      'Não recebeu o e-mail? Verifique sua caixa de spam ou ';
  final String tryWithAnotherEmail = 'tente com outro e-mail';
}

class _CreateNewPasswordPageStrings {
  const _CreateNewPasswordPageStrings();

  final String createNewPassword = 'Crie uma nova senha';
  final String subtitle =
      'Digite sua nova senha e confirme para alterar sua senha.';
  final String password = 'Senha';
  final String confirmPassword = 'Confirme sua senha';
  final String resetPassword = 'Redefinir senha';
}
