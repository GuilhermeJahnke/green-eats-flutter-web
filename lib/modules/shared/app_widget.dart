import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'configs/constants/app_colors.dart';
import 'configs/constants/app_text_style.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Green Eats',
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          contentTextStyle:
              AppTextStyle.bodyRegular.copyWith(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          actionTextColor: Colors.white,
          insetPadding: const EdgeInsets.all(8.0),
          behavior: SnackBarBehavior.floating,
        ),
      ),
    );
  }
}
