import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/mixins/context_mixin.dart';
import '../../../shared/utils/mixins/status_mixin.dart';
import '../../authentication_module.dart';
import '../atomic/templates/login_page_template.dart';
import '../cubits/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = Modular.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.status.isFailure && state.failure != null) {
          context.showErrorSnackBar(state.failure?.exception?.message);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return LoginPageTemplate(
          onEmailChanged: cubit.onEmailChanged,
          onPasswordChanged: cubit.onPasswordChanged,
          onLoginTap: cubit.onLoginTap,
          onSignUpTap: cubit.onSignUpTap,
          onForgotPasswordTap: cubit.onForgotPasswordTap,
          isButtonEnabled: state.isFormValid,
          isButtonLoading: state.status.isLoading,
        );
      },
    );
  }
}
