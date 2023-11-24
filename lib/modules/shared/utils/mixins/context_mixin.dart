import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../main/main_navigator.dart';
import '../../app_strings.dart';
import '../../configs/constants/app_text_style.dart';

extension BuildContextMixin on BuildContext {
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.bodyRegular.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  void showSuccessAddCartSnackBar() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          'Produto adicionado ao carrinho',
          style: AppTextStyle.bodyRegular.copyWith(
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Ver carrinho',
          onPressed: Modular.get<MainNavigator>().goToCart,
        ),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  void showErrorSnackBar(String? message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message ?? AppStrings.failure.defaultFailureMessage,
          style: AppTextStyle.bodyRegular.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
