import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/configs/constants/app_assets.dart';
import '../../../shared/configs/constants/app_text_style.dart';
import '../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../splash_module.dart';
import '../cubits/onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const routeName = '/onboarding';
  static const routePath = SplashModule.moduleName + routeName;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final cubit = Modular.get<OnboardingCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    SvgPicture.asset(AppAssets.splashScreenLogo),
                    const SizedBox(height: 30),
                    Text(
                      'Receba suas compras em casa',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBold.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'O melhor aplicativo de entrega da cidade para entregar seus mantimentos frescos diários',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.subtitleRegular.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 250.0,
                      child: ButtonMolecule(
                        type: Buttontype.filled,
                        title: 'Continuar',
                        onTap: cubit.onContinueButtonTap,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppAssets.onboardingPageBackground,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
