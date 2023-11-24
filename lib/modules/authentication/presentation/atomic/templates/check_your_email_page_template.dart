import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/configs/constants/app_assets.dart';
import '../../../../shared/configs/constants/app_colors.dart';
import '../../../../shared/configs/constants/app_text_style.dart';
import '../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../authentication_strings.dart';

class CheckYourEmailPageTemplate extends StatelessWidget {
  const CheckYourEmailPageTemplate({
    super.key,
    required this.onAlreadyCheckedTap,
    required this.onTryWithAnotherEmailTap,
  });

  final VoidCallback onAlreadyCheckedTap;
  final VoidCallback onTryWithAnotherEmailTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      AppAssets.icEmail,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  AuthenticationStrings.checkYourEmailPage.checkYourEmail,
                  style: AppTextStyle.titleBold,
                ),
                const SizedBox(height: 20),
                Text(
                  AuthenticationStrings.checkYourEmailPage.subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subtitleRegular,
                ),
                const SizedBox(height: 30),
                ButtonMolecule(
                  type: Buttontype.filled,
                  title:
                      AuthenticationStrings.checkYourEmailPage.alreadyChecked,
                  onTap: onAlreadyCheckedTap,
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: onTryWithAnotherEmailTap,
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AuthenticationStrings
                            .checkYourEmailPage.didntReceive,
                        style: AppTextStyle.subtitleRegular,
                        children: [
                          TextSpan(
                            text: AuthenticationStrings
                                .checkYourEmailPage.tryWithAnotherEmail,
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
      ),
    );
  }
}
