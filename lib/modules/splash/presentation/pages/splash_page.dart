import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/configs/constants/app_assets.dart';
import '../../../shared/configs/constants/app_colors.dart';
import '../cubits/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashCubit cubit = Modular.get<SplashCubit>();

  @override
  void initState() {
    super.initState();

    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenColor,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.splashScreenLogo,
        ),
      ),
    );
  }
}
