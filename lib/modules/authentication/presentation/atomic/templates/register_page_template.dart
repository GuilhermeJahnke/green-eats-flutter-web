import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../authentication_strings.dart';
import '../atoms/return_icon_atom.dart';

class RegisterPageTemplate extends StatelessWidget {
  const RegisterPageTemplate({
    super.key,
    required this.onNameChanged,
    required this.onLastNameChanged,
    required this.onCpfChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    required this.onRegisterTap,
    required this.onTermsAndConditionsTap,
    required this.onConfirmPasswordValidate,
    required this.isLoading,
    required this.isButtonEnabled,
  });

  final ValueSetter<String?> onNameChanged;
  final ValueSetter<String?> onLastNameChanged;
  final ValueSetter<String?> onCpfChanged;
  final ValueSetter<String?> onEmailChanged;
  final ValueSetter<String?> onPasswordChanged;
  final ValueSetter<String?> onConfirmPasswordChanged;
  final String? Function(String?) onConfirmPasswordValidate;

  final VoidCallback onRegisterTap;
  final VoidCallback onTermsAndConditionsTap;

  final bool isLoading;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReturnIconAtom(),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AuthenticationStrings
                            .registerPage.createYourAccountForFree,
                        style: AppTextStyle.titleBold,
                      ),
                      const SizedBox(height: 30),
                      TextFieldMolecule(
                        type: TextFieldType.none,
                        label: AuthenticationStrings.registerPage.name,
                        onChanged: onNameChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFieldMolecule(
                        type: TextFieldType.none,
                        label: AuthenticationStrings.registerPage.lastName,
                        onChanged: onLastNameChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFieldMolecule(
                        type: TextFieldType.cpf,
                        label: AuthenticationStrings.registerPage.cpf,
                        onChanged: onCpfChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFieldMolecule(
                        type: TextFieldType.email,
                        label: AuthenticationStrings.registerPage.email,
                        onChanged: onEmailChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFieldMolecule(
                        type: TextFieldType.password,
                        label: AuthenticationStrings.registerPage.password,
                        onChanged: onPasswordChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFieldMolecule(
                        type: TextFieldType.password,
                        label:
                            AuthenticationStrings.registerPage.confirmPassword,
                        onChanged: onConfirmPasswordChanged,
                        validator: onConfirmPasswordValidate,
                      ),
                      const SizedBox(height: 30),
                      ButtonMolecule(
                        type: Buttontype.filled,
                        title: AuthenticationStrings.registerPage.signUp,
                        onTap: onRegisterTap,
                        isLoading: isLoading,
                        isEnabled: isButtonEnabled,
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: onTermsAndConditionsTap,
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AuthenticationStrings
                                  .registerPage.termsAndConditions,
                              style: AppTextStyle.subtitleRegular,
                              children: [
                                TextSpan(
                                  text: AuthenticationStrings
                                      .registerPage.termsAndConditionsLink,
                                  style: AppTextStyle.subtitleBold.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
