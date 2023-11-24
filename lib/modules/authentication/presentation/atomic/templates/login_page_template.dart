import 'package:flutter/material.dart';

import '../../../../shared/configs/constants/app_assets.dart';
import '../../../../shared/configs/constants/app_colors.dart';
import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../../shared/utils/extensions/context_extension.dart';
import '../../../authentication_strings.dart';

class LoginPageTemplate extends StatelessWidget {
  const LoginPageTemplate({
    super.key,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onLoginTap,
    required this.onSignUpTap,
    required this.onForgotPasswordTap,
    required this.isButtonEnabled,
    required this.isButtonLoading,
  });

  final ValueSetter<String?> onEmailChanged;
  final ValueSetter<String?> onPasswordChanged;

  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;
  final VoidCallback onForgotPasswordTap;

  final bool isButtonEnabled;
  final bool isButtonLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 700,
          child: Stack(
            children: [
              if (context.isMobile)
                Image.asset(
                  AppAssets.authenticationPageBackground,
                  fit: BoxFit.cover,
                ),
              Align(
                alignment: context.isMobile
                    ? Alignment.bottomCenter
                    : Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: context.isMobile
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )
                          : BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AuthenticationStrings.loginPage.loginWithYourAccount,
                          style: AppTextStyle.titleBold,
                        ),
                        const SizedBox(height: 30),
                        TextFieldMolecule(
                          type: TextFieldType.email,
                          label: AuthenticationStrings.loginPage.emailOrCpf,
                          onChanged: onEmailChanged,
                        ),
                        const SizedBox(height: 30),
                        TextFieldMolecule(
                          type: TextFieldType.password,
                          label: AuthenticationStrings.loginPage.password,
                          onChanged: onPasswordChanged,
                        ),
                        const SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: onForgotPasswordTap,
                        //     child: Text(
                        //       AuthenticationStrings
                        //           .loginPage.forgotYourPassword,
                        //       style: AppTextStyle.bodyBold
                        //           .copyWith(color: Colors.blue),
                        //       textAlign: TextAlign.left,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        ButtonMolecule(
                          title: AuthenticationStrings.loginPage.login,
                          type: Buttontype.filled,
                          onTap: onLoginTap,
                          isEnabled: isButtonEnabled,
                          isLoading: isButtonLoading,
                        ),
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: onSignUpTap,
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: AuthenticationStrings
                                    .loginPage.dontHaveAnAccount,
                                style: AppTextStyle.subtitleRegular,
                                children: [
                                  TextSpan(
                                    text:
                                        AuthenticationStrings.loginPage.signUp,
                                    style: AppTextStyle.subtitleBold.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
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
