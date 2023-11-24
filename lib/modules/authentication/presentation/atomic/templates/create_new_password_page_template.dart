import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../authentication_strings.dart';
import '../atoms/return_icon_atom.dart';

class CreateNewPasswordPageTemplate extends StatelessWidget {
  const CreateNewPasswordPageTemplate({
    super.key,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    required this.onBackTap,
    required this.onResetPasswordTap,
  });

  final ValueSetter<String?> onPasswordChanged;
  final ValueSetter<String?> onConfirmPasswordChanged;
  final VoidCallback onBackTap;
  final VoidCallback onResetPasswordTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackTap();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReturnIconAtom(onTap: onBackTap),
                  const SizedBox(height: 30),
                  Text(
                    AuthenticationStrings
                        .createNewPasswordPage.createNewPassword,
                    style: AppTextStyle.titleBold,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AuthenticationStrings.createNewPasswordPage.subtitle,
                    style: AppTextStyle.subtitleRegular,
                  ),
                  const SizedBox(height: 30),
                  TextFieldMolecule(
                    type: TextFieldType.password,
                    label: AuthenticationStrings.createNewPasswordPage.password,
                    onChanged: onPasswordChanged,
                  ),
                  const SizedBox(height: 16),
                  TextFieldMolecule(
                    type: TextFieldType.password,
                    label: AuthenticationStrings
                        .createNewPasswordPage.confirmPassword,
                    onChanged: onConfirmPasswordChanged,
                  ),
                  const SizedBox(height: 30),
                  ButtonMolecule(
                    type: Buttontype.filled,
                    title: AuthenticationStrings
                        .createNewPasswordPage.resetPassword,
                    onTap: onResetPasswordTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
