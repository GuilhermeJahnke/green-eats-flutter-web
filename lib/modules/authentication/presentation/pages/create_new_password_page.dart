import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../authentication_module.dart';
import '../atomic/templates/create_new_password_page_template.dart';
import '../cubits/create_new_password_cubit.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  static const routeName = '/create-new-password';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final cubit = Modular.get<CreateNewPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return CreateNewPasswordPageTemplate(
      onPasswordChanged: cubit.onPasswordChanged,
      onConfirmPasswordChanged: cubit.onConfirmPasswordChanged,
      onBackTap: cubit.navigateToLogin,
      onResetPasswordTap: cubit.onResetPasswordTap,
    );
  }
}
