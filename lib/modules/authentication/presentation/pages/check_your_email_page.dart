import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../authentication_module.dart';

import '../atomic/templates/check_your_email_page_template.dart';
import '../cubits/check_your_email_cubit.dart';

class CheckYourEmailPage extends StatefulWidget {
  const CheckYourEmailPage({super.key});

  static const routeName = '/check-your-email';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<CheckYourEmailPage> createState() => _CheckYourEmailPageState();
}

class _CheckYourEmailPageState extends State<CheckYourEmailPage> {
  final cubit = Modular.get<CheckYourEmailCubit>();

  @override
  Widget build(BuildContext context) {
    return CheckYourEmailPageTemplate(
      onAlreadyCheckedTap: cubit.onAlreadyCheckedTap,
      onTryWithAnotherEmailTap: cubit.onTryWithAnotherEmailTap,
    );
  }
}
