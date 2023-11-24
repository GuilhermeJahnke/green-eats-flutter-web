import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../authentication_strings.dart';
import '../atoms/return_icon_atom.dart';

class ForgotPasswordPageTemplate extends StatelessWidget {
  const ForgotPasswordPageTemplate({
    super.key,
    required this.onEmailChanged,
    required this.onSendTap,
  });

  final ValueSetter<String?> onEmailChanged;
  final VoidCallback onSendTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReturnIconAtom(),
                const SizedBox(height: 30),
                Text(
                  AuthenticationStrings.forgotPasswordPage.forgotYourPassword,
                  style: AppTextStyle.titleBold,
                ),
                const SizedBox(height: 30),
                Text(
                  AuthenticationStrings.forgotPasswordPage.subtitle,
                  style: AppTextStyle.subtitleRegular,
                ),
                const SizedBox(height: 30),
                TextFieldMolecule(
                  type: TextFieldType.email,
                  label: AuthenticationStrings.forgotPasswordPage.email,
                  onChanged: onEmailChanged,
                ),
                const SizedBox(height: 30),
                ButtonMolecule(
                  type: Buttontype.filled,
                  title: AuthenticationStrings.forgotPasswordPage.send,
                  onTap: onSendTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
