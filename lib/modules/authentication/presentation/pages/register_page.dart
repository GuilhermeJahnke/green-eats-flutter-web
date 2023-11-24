import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/mixins/context_mixin.dart';
import '../../../shared/utils/mixins/status_mixin.dart';
import '../../authentication_module.dart';
import '../atomic/templates/register_page_template.dart';
import '../cubits/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final cubit = Modular.get<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.status.isFailure && state.failure != null) {
          context.showErrorSnackBar(state.failure?.exception?.message);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return RegisterPageTemplate(
          onNameChanged: cubit.onNameChanged,
          onLastNameChanged: cubit.onLastNameChanged,
          onCpfChanged: cubit.onCpfChanged,
          onEmailChanged: cubit.onEmailChanged,
          onPasswordChanged: cubit.onPasswordChanged,
          onConfirmPasswordChanged: cubit.onConfirmPasswordChanged,
          onRegisterTap: cubit.onRegisterTap,
          onTermsAndConditionsTap: cubit.onTermsAndConditionsTap,
          onConfirmPasswordValidate: cubit.confirmPasswordValidator,
          isLoading: state.status.isLoading,
          isButtonEnabled: state.isButtonEnabled,
        );
      },
    );
  }
}
