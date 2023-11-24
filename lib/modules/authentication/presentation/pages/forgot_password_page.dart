import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../authentication_module.dart';
import '../atomic/templates/forgot_password_page_template.dart';
import '../cubits/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = '/forgot-password';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final cubit = Modular.get<ForgotPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return ForgotPasswordPageTemplate(
          onEmailChanged: cubit.onEmailChanged,
          onSendTap: cubit.onSendTap,
        );
      },
    );
  }
}
